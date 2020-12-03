<?php

namespace App\Admin\Controllers;

use App\Models\Aloorder\PurchaseOrder;
use App\Models\Message;
use App\Models\Order;
use App\Models\TransportOrderItem;
use App\Models\TransportRecharge;
use App\Models\Warehouse;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\User;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Widgets\InfoBox;
use Encore\Admin\Widgets\Table;

class ProfileController extends AdminController
{
    protected $userId;

    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;

    public function __construct()
    {
        $this->title = 'Thông tin cá nhân';
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User);

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->like('title', trans('admin.title'));
        });

        $grid->id(trans('admin.id'));
        $grid->title(trans('admin.title'));
        $grid->order(trans('admin.order'));
        $grid->created_at(trans('admin.created_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });
        $grid->updated_at(trans('admin.updated_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->updated_at));
        });

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed   $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(User::findOrFail($id));

        $show->field('id', trans('admin.id'));
        $show->title(trans('admin.title'));
        $show->order(trans('admin.order'));
        $show->field('created_at', trans('admin.created_at'));
        $show->field('updated_at', trans('admin.updated_at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new User);

        $form->display('id', __('ID'));
        $form->text('title', trans('admin.title'))->rules('required');
        $form->number('order', trans('admin.order'))->default(0)->rules('required');
        $form->display('created_at', trans('admin.created_at'));
        $form->display('updated_at', trans('admin.updated_at'));

        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        return $form;
    }

    ####
    public function wallet(Content $content)
    {
        $id = Admin::user()->id;
        return $content->header('Lịch sử giao dịch ví')
        ->description('Chi tiết')

        ->row(function (Row $row) use ($id) {
            $row->column(4, new InfoBox('Thông tin', 'users', 'primary', '#', User::find($id)->symbol_name));
            $row->column(4, new InfoBox('Số dư ví', 'users', 'danger', '#', number_format(User::find($id)->wallet)));
        })
        ->row(function (Row $row) use ($id)
        {
            // Tab thong tin chi tiet bao cao
            $row->column(12, function (Column $column)  use ($id)
            {
                $column->append((new Box('Chi tiết các giao dịch', $this->walletGrid($id))));
            });
        });
    }

    public function infomation(Content $content)
    {
        return redirect('/admin/auth/setting');
    }

    public function walletGrid($id) {
        $res = TransportRecharge::where('money', ">", 0)
        ->where('customer_id', $id)
        ->orderBy('id', 'desc')
        ->get();

        $headers = ['STT', 'Ngày giao dịch', 'Đơn hàng', 'Nội dung giao dịch', 'Loại giao dịch', 'Số dư đầu kỳ (VND)', 'Trừ tiền (VND)', 'Nạp tiền (VND)', 'Số dư cuối kỳ (VND)'];

        $raw = [
            'order' =>  '',
            'payment_date'  =>  '',
            'order_link'    =>  '',
            'type_recharge' =>  '',
            'content'   =>  '',
            'before_payment'    =>  '',
            'down'   =>  '',
            'up'    =>  '',
            'after_payment'
        ];
        $data = [];

        foreach ($res as $key => $record) {
            $type = $record->type_recharge;
            if (in_array($type, TransportRecharge::UP)) {
                $up = $record->money;
                $down = null;
                $flag = 'up';
            } else {
                $down = $record->money;
                $up = null;
                $flag = 'down';
            }

            $data[] = [
                'order' =>  $key + 1,
                'payment_date'  =>  date('H:i | d-m-Y', strtotime($record->created_at)),
                'order_link'    =>  $this->convertOrderLink($record->content, $record->type_recharge),
                'type_recharge' =>  TransportRecharge::ALL_RECHARGE[$record->type_recharge],
                'content'   =>  $record->content,
                'before_payment'    =>  '',
                'down'   =>  $down,
                'up'    => $up,
                'after_payment' =>  '',
                'flag'  =>  $flag
            ];
        }

        $data = array_reverse($data);
        foreach ($data as $key => $raw) {
            if ($key == 0) {
                $data[0]['before_payment']  = 0;
                if ($data[0]['flag'] == 'up') {
                    $data[0]['after_payment'] = $data[0]['before_payment'] + $data[0]['up'];
                }
                else {
                    $data[0]['after_payment'] = $data[0]['before_payment'] - $data[0]['down'];
                }
            }
            else {
                $data[$key]['before_payment']  = $data[$key-1]['after_payment'];
                if ($data[$key]['flag'] == 'up') {
                    $data[$key]['after_payment'] = $data[$key]['before_payment'] + $data[$key]['up'];
                }
                else {
                    $data[$key]['after_payment'] = $data[$key]['before_payment'] - $data[$key]['down'];
                }
            }
        }

        $data = array_reverse($data);

        foreach ($data as $key => $last_raw) {

            $data[$key]['before_payment'] = $data[$key]['before_payment'] >= 0 
            ? "<span class='label label-success'>".number_format($data[$key]['before_payment'])."</span>"
            : "<span class='label label-danger'>".number_format($data[$key]['before_payment'])."</span>";

            $data[$key]['down'] = $data[$key]['down'] != null
            ? "<span class='label label-danger'>".number_format($data[$key]['down'])."</span>"
            : null;
            
            $data[$key]['up'] = $data[$key]['up'] != null
            ? "<span class='label label-success'>".number_format($data[$key]['up'])."</span>"
            : null;
        
            $data[$key]['after_payment'] = $data[$key]['after_payment'] >= 0 
            ? "<span class='label label-success'>".number_format($data[$key]['after_payment'])."</span>"
            : "<span class='label label-danger'>".number_format($data[$key]['after_payment'])."</span>";

            unset($data[$key]['flag']);
        }

        $table = new Table($headers, $data);

        return $table->render();
    }

    public function convertOrderLink($content, $type)
    {
        # code...

        switch ($type) {
            case 4: 
                $subs = explode("Thanh toán đơn hàng vận chuyển VC-", $content);
                $order_number = trim($subs[1]);
                $order = Order::whereOrderNumber($order_number)->first();
                if ($order) {
                    return "<a href='https://alilogi.vn/admin/transport_orders/".$order->id."' target='_blank'>Đơn hàng vận chuyển ".$subs[1]."</a>";
                }
                else {
                    return null;
                }
            case 5: 
                $subs = explode("Đặt cọc đơn hàng mua hộ. Mã đơn hàng", $content);
                $order_number = trim($subs[1]);
                
                $order = PurchaseOrder::whereOrderNumber($order_number)->first();

                if ($order) {
                    $route = 'https://aloorder.vn/admin/customer_orders/'.$order->id;

                    return '<a href="'.$route.'" target="_blank">Đơn hàng order '.$subs[1].'</a>';
                }
                else {
                    return null;
                }
                
            case 6: 
                $subs = explode("Thanh toán đơn hàng mua hộ. Mã đơn hàng", $content);
                $order_number = trim($subs[1]);
                $order = PurchaseOrder::whereOrderNumber($order_number)->first();
                if ($order) {
                    $route = 'https://aloorder.vn/admin/customer_orders/'.$order->id;
                    return '<a href="'.$route.'" target="_blank">Đơn hàng order '.$subs[1].'</a>';
                }
                else {
                    return null;
                }
                
            default:
                return null;
        }
        return $content;
    }

    public function history(Content $content)
    {
        return $content
            ->header('Danh sách mã vận đơn')
            ->description('Danh sách')
            ->body($this->historyGrid());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function historyGrid()
    {
        $grid = new Grid(new TransportOrderItem());
        $grid->model()->where('transport_customer_id', Admin::user()->id)->orderBy('id', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->like('cn_code', 'Mã vận đơn');
                $filter->equal('user_id_updated', 'Người sửa')->select(User::where('is_customer', 0)->pluck('name', 'id'));
                $filter->where(function ($query) {
                    switch ($this->input) {
                        case TransportOrderItem::IS_PAYMENT:
                            $query->where('is_payment', true);
                            break;
                        case TransportOrderItem::NOT_PAYMENT_VN:
                            $query->where('warehouse_cn', true)->where('warehouse_vn', true)->where('is_payment', false);
                            break;
                        case TransportOrderItem::CN_REV:
                            $query->where('warehouse_cn', true)->where('warehouse_vn', false);
                            break;
                        case TransportOrderItem::VN_REV:
                            $query->where('warehouse_cn', true)->where('warehouse_vn', true);
                            break;
                    }
                }, 'Trạng thái', 'status')->select(TransportOrderItem::STATUS);
            });
            $filter->column(1/2, function ($filter) {
                $filter->between('warehouse_cn_date', 'Ngày về kho TQ')->date();
                $filter->between('warehouse_vn_date', 'Ngày về kho Hà Nội')->date();
            });
        });
        $grid->rows(function (Grid\Row $row) {
            $row->column('number', ($row->number+1));
        });
        $grid->column('number', 'STT');
        $grid->order_id('Mã đơn hàng')->display(function () {
            return $this->order->order_number ?? "";
        });
        $grid->transport_customer_id('Tên KH')->display(function () {
            return $this->customer->symbol_name ?? "";
        });
        $grid->cn_code('MVD');
        $grid->kg();
        $grid->product_width('Rộng (cm)');
        $grid->product_length('Dài (cm)');
        $grid->product_height('Cao (cm)');
        $grid->volume('V/6000')->display(function() {
            return str_replace('.00', '', $this->volume);
        });
        $grid->cublic_meter('M3')->display(function() {
            return str_replace('.000', '', $this->cublic_meter);
        });
        $grid->advance_drag('Ứng kéo (Tệ)');
        $grid->price_service('Giá VC')->display(function() {
            return number_format($this->price_service);
        });
        $grid->total_price('Tổng tiền (VND)')->display(function() {
            return number_format($this->total_price);
        });
        $grid->payment_type('Loại TT')->display(function() {
            if ($this->is_payment == 1) {
                return $this->paymentTypeText($this->payment_type);
            }

            return "";
        });
        $grid->is_payment('Trạng thái')->display(function() {
            switch ($this->is_payment)
            {
                case 1:
                    $msg = "Đã thanh toán";
                    return '<span class="label label-success">'.$msg.'</span> <br>' . date('H:i | d-m-Y', strtotime($this->transporting_vn_date));
                case 0 :
                    return '<span class="label label-danger">Chưa thanh toán</span>';
            }
        });
        $grid->user_id_updated('Người sửa')->display(function() {
            return $this->userUpdated->name ?? "";
        });
        $grid->warehouse_cn_date('Ngày về TQ')->display(function () {
            return $this->warehouse_cn_date != "" ? date('H:i | d-m-Y', strtotime($this->warehouse_cn_date)) : "";
        });
        $grid->warehouse_vn_date('Ngày về VN')->display(function () {
            return $this->warehouse_vn_date != "" ? date('H:i | d-m-Y', strtotime($this->warehouse_vn_date)) : "";
        });
        $grid->note('Ghi chú')->editable();
        $grid->actions(function ($actions) {
            $actions->disableView();
            $actions->disableEdit();
            $actions->disableDelete();
        });
        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->disableBatchActions();
        $grid->paginate(50);

        $grid->tools(function (Grid\Tools $tools) {
            #
        });
        return $grid;
    }

    public function orderPayment(Content $content)
    {
        return $content
            ->header('Danh sách đơn hàng đã thanh toán')
            ->description('Danh sách')
            ->body($this->orderPaymentGrid());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function orderPaymentGrid()
    {
        $grid = new Grid(new Order());
        $grid->model()->where('order_type', 2)
        ->where('transport_customer_id', Admin::user()->id)
        ->orWhere('payment_customer_id', Admin::user()->id)
        ->orderBy('id', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->like('order_number', 'Mã đơn hàng');
            });
            $filter->column(1/2, function ($filter) {
                $filter->between('created_at', 'Ngày thanh toán')->date();
            });
        });
        $grid->rows(function (Grid\Row $row) {
            $row->column('number', ($row->number+1));
        });
        $grid->column('number', 'STT');
        $grid->order_number('Mã đơn hàng');
        // $grid->transport_customer_id('Tên khách hàng')->display(function() {
        //     return $this->transportCustomer->symbol_name ?? "";
        // });
        $grid->items('Số MVD')->count();
        $grid->transport_kg('KG')->totalRow(function ($amount) {
            return "<span class='label label-success'>".number_format($amount)."</span>";
        });
        $grid->price_kg('Giá KG (VND)')->display(function() {
            return number_format($this->getPriceService($this, $this::KG));
        });
        $grid->transport_volume('V/6000')->display(function() {
            return $this->transport_volume != '0.0000' ? $this->transport_volume : 0;
        })->totalRow(function ($amount) {
            return "<span class='label label-success'>".number_format($amount)."</span>";
        });
        $grid->price_volume('Giá V/6000 (VND)')->display(function() {
            return number_format($this->getPriceService($this, $this::V));
        });
        $grid->transport_cublic_meter('M3')->totalRow(function ($amount) {
            return "<span class='label label-success'>".number_format($amount)."</span>";
        });
        $grid->price_cublic_meter('Giá M3 (VND)')->display(function() {
            return number_format($this->getPriceService($this, $this::M3));
        });
        $grid->final_total_price('Tổng tiền (VND)')->display(function() {
            $total = number_format($this->final_total_price);
            if ($this->final_total_price <= 0) {
                return '<span class="label label-danger">'.$total.'</span>';
            }

            return $total;
        })->totalRow(function ($amount) {
            return "<span class='label label-success'>".number_format($amount)."</span>";
        });
        
        $grid->created_at(trans('admin.created_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });
        $grid->user_created_id('Người tạo')->display(function () {
            return $this->userCreated->name ?? "";
        });
        $grid->internal_note('Ghi chú');
        $grid->actions(function ($actions) {
            $actions->disableEdit();
            $actions->disableDelete();
        });
        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->tools(function ($tools) {
            #
        });
        return $grid;
    }

    public function orderPaymentDetail($id, Content $content)
    {
        return $content
            ->header('Chi tiết đơn hàng vận chuyển')
            ->description('Danh sách')
            ->row(function (Row $row) use ($id){
                $row->column(12, function (Column $column) use ($id)
                {
                    $column->append($this->detailOrder($id));
                });
                $row->column(12, function (Column $column) use ($id)
                {
                    $column->append($this->listItem($id));
                });
                $row->column(12, function (Column $column) use ($id)
                {
                    $column->append($this->discount($id));
                });
                $row->column(12, function (Column $column) use ($id)
                {
                    $column->append($this->payment($id));
                });
            });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function detailOrder($id)
    {
        $grid = new Grid(new Order);
        $grid->model()->where('id', $id);

        $grid->header(function ($query) {
            return "<h4 class='uppercase'><b>Thông tin chi tiết</b> <br></h4>";
        });

        $grid->order_number('Mã đơn hàng');
        $grid->final_total_price('Tổng tiền (VND)')->display(function() {
            $total = number_format($this->final_total_price);
            if ($this->final_total_price <= 0) {
                return '<span class="label label-danger">'.$total.'</span>';
            }

            return $total;
        });

        $grid->transport_customer_id('Tên khách hàng theo đơn hàng')->display(function() {
            return $this->transportCustomer->symbol_name ?? "";
        });
        $grid->payment_customer_id('Khách hàng thanh toán')->display(function() {
            return $this->paymentCustomer->symbol_name ?? "";
        });
        $grid->created_at('Ngày trả hàng')->display(function () {
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });
        $grid->user_created_name('Người tạo');
        $grid->internal_note('Ghi chú');
        $grid->disableActions();
        $grid->disablePagination();
        $grid->disableCreateButton();
        $grid->disableFilter();
        $grid->disableRowSelector();
        $grid->disableColumnSelector();
        $grid->disableExport();

        $grid->tools(function ($tools) {
            $tools->append('<a href="'.route('profiles.historyOrder').'" class="btn btn-sm btn-primary" title="Danh sách đơn hàng vận chuyển">
                <i class="fa fa-list"></i>
                <span class="hidden-xs">&nbsp;Danh sách đơn hàng vận chuyển</span>
            </a>');

            $tools->append('<a href="#" class="btn btn-sm btn-warning" onclick="window.print()">
                <i class="fa fa-print"></i>
                <span class="hidden-xs">&nbsp;In hoá đơn</span>
            </a>');
        });
        return $grid;
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function listItem($id)
    {
        $grid = new Grid(new TransportOrderItem());
        $order = Order::find($id);
        $grid->model()->where('order_id', $id);
        $grid->header(function ($query) {
            return "<h4 class='uppercase'><b>Danh sách mã vận đơn</b> <br></h4>";
        });

        $grid->cn_code('Mã vận đơn');
        $grid->product_width('Rộng (cm)');
        $grid->product_length('Dài (cm)');
        $grid->product_height('Cao (cm)');
        $grid->kg('Cân nặng (kg)')->totalRow(function ($amount) use ($id, $order) {
            return '<span class="label label-primary">'. $order->getSumKg() .'</span>';
        });
        $grid->volume('Thể tích (V/6000)')->totalRow(function ($amount) use ($id, $order) {
            return '<span class="label label-primary">'. $order->getSumVolume() .'</span>';
        });
        $grid->cublic_meter('Mét khối (M3)')->totalRow(function ($amount) use ($id, $order) {
            return '<span class="label label-primary">'. $order->getSumCublicMeter() .'</span>';
        });
        
        $grid->payment_type('Loại thanh toán')->display(function () {
            return $this->paymentTypeText($this);
        });
        $grid->advance_drag('Ứng kéo (Tệ)')->totalRow(function ($amount) use ($id) {
            return '<span class="label label-primary">'.$amount.'</span>';
        });
        $grid->price_service('Giá dịch vụ (VND)')->display(function () {
            return $this->price_service ? number_format($this->price_service) : "";
        });
        $grid->total_price('Tổng tiền theo từng mã (VND)')->display(function () {
            switch ($this->payment_type)
            {
                case TransportOrderItem::KG:
                    return number_format($this->kg * $this->price_service);
                case TransportOrderItem::V:
                    return number_format($this->volume * $this->price_service);
                case TransportOrderItem::M3:
                    return number_format($this->cublic_meter * $this->price_service);
            }      
        })->totalRow(function ($amount) use ($id) {
            $order = Order::find($id);
            return '<span class="label label-primary">'.number_format($order->getTotalPriceOrder()).'</span>';
        });
        $grid->description('Chi tiết')->display(function () {
            switch ($this->payment_type)
            {
                case TransportOrderItem::KG:
                    return "= ".(int) $this->kg." x ". number_format($this->price_service);
                case TransportOrderItem::V:
                    return "= ".$this->volume." x ". number_format($this->price_service);
                case TransportOrderItem::M3:
                    return "= ".$this->cublic_meter." x ". number_format($this->price_service);
            }      
            return number_format($this->kg * $this->price_service) ?? 0;
        });

        $grid->disableActions();
        $grid->disablePagination();
        $grid->disableCreateButton();
        $grid->disableFilter();
        $grid->disableRowSelector();
        $grid->disableColumnSelector();
        $grid->disableTools();
        $grid->disableExport();

        return $grid;
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function discount($id)
    {
        $grid = new Grid(new Order);
        $grid->model()->where('id', $id);

        $grid->header(function ($query) {
            return "<h4 class='uppercase'><b>Giảm trừ cân nặng</b> <br></h4>";
        });
        $grid->discount_type('Loại giảm trừ')->display(function () {
            return $this->discount_type == 1 ? '<span class="label label-danger">Giảm đi</span>' : '<span class="label label-primary">Tăng lên</span>';
        });
        $grid->discount_value('Giá trị giảm trừ (kg)')->display(function () {
            return $this->discount_value == "" ? 0 : $this->discount_value;
        })->label('primary');

        $grid->discount_money('Tiền thanh toán giảm trừ (VND)')->display(function () {
            $price = $this->items->where('payment_type', 1)->first();
            $price_service = $price ? $price->price_service : 0;
            $sum = number_format($this->discount_value * $price_service);
            $des = " (". $this->discount_value ." x ". number_format($price_service) . ")";
            if ($this->discount_type == 1) {
                return '<span class="label label-danger">- '.$sum.'</span>&nbsp;' . $des;
            } else {
                return '<span class="label label-success">+ '.$sum.'</span>&nbsp;' . $des;
            }
        });
        $grid->disableActions();
        $grid->disablePagination();
        $grid->disableCreateButton();
        $grid->disableFilter();
        $grid->disableRowSelector();
        $grid->disableColumnSelector();
        $grid->disableExport();
        $grid->disableTools();

        return $grid;
    }


    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function payment($id)
    {
        $order = Order::find($id);

        // Tổng kg sau khi đã tính giảm trừ
        $sumKg = $order->getSumKgAfterDiscount();

        $price = [
            Order::KG => $order->items->where('payment_type', Order::KG)->first()->price_service ?? 0,
            Order::V  => $order->items->where('payment_type', Order::V)->first()->price_service ?? 0,
            Order::M3 => $order->items->where('payment_type', Order::M3)->first()->price_service ?? 0
        ];

        // Header table
        $headers = ['THANH TOÁN', null, null, null, null, null];

        // Get detail sum kg
        $detailSumKg   = $order->getDetailSumKg();

        $rows = [
            [null, 'Số lượng', 'Đơn giá (VND)', 'Thành tiền (VND)', 'Chi tiết'],
            [
                'Tổng khối lượng', 
                $order->getSumKgAfterDiscount() . " (".$order->getSumKg()." ". $detailSumKg .")", 
                number_format($price[Order::KG]),
                $price[Order::KG] != 0 
                    ? number_format($order->getSumKgAfterDiscount() * $price[Order::KG])
                    : 0,
                "= " . $order->getDetailMoneySumKg()
            ],
            [
                'Tổng V/6000', 
                $order->getSumVolume(),
                number_format($price[Order::V]),
                $price[Order::V] != 0
                    ? number_format($order->getSumVolume() * $price[Order::V]) 
                    : 0,
                "= " . $order->getSumVolume() . " x " . number_format($price[Order::V])
            ],
            [
                'Tổng M3', 
                $order->getSumCublicMeter(),
                number_format($price[Order::M3]),
                $price[Order::M3] != 0 
                    ? number_format($order->getSumCublicMeter() * $price[Order::M3])
                    : 0,
                "= " . $order->getSumCublicMeter() . " x " . number_format($price[Order::M3])
            ],
            [
                'Tổng ứng kéo', 
                null, 
                null, 
                number_format($order->transport_advance_drag),
                "= ". str_replace('.00', '', $order->getSumItemAdvanceDrag())." Tệ"
            ],
            [
                'Tổng tiền', 
                null,
                null, 
                '<span class="label label-primary">'.number_format($order->final_total_price).'</span>',
                "= ". number_format($order->getTotalPriceOrder())
                . " + " .number_format($order->getSumKgDiscount() * $order->getPriceService($order, Order::KG))
                . " + " .number_format($order->transport_advance_drag)
            ],
        ];

        $table = new Table($headers, $rows);
        $table->id('tbl_payment');

        return $table->render();
    }
}
