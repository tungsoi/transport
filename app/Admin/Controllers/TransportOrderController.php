<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Order\UploadImport;
use App\Customer\Services\OrderService;
use App\Models\Warehouse;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\User;
use App\Models\Order;
use App\Models\TransportOrderItem;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Table;
use Illuminate\Http\Request;
use App\Models\TransportCustomer;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;

class TransportOrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;

    public function __construct()
    {
        $this->title = 'Đơn hàng vận chuyển';
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Order);
        $grid->model()->where('order_type', 2)->orderBy('id', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->like('order_number', 'Mã đơn hàng');
                $filter->equal('user_created_id', 'Người tạo')->select(User::where('is_customer', 0)->get()->pluck('name', 'id'));
            });
            $filter->column(1/2, function ($filter) {
                $filter->between('created_at', 'Ngày thanh toán')->date();
                $filter->like('customer_name', 'Tên khách hàng');
            });
        });

        $grid->order_number('Mã đơn hàng');
        $grid->customer_name('Tên khách hàng');
        $grid->items('Số MVD')->count();
        $grid->transport_kg('KG');
        $grid->price_kg('Giá KG (VND)')->display(function() {
            return $this->items->first()->payment_type == $this::KG
                    ? number_format( (int) $this->getPriceService($this))
                    : 0;
        });
        $grid->transport_volume('V/6000')->display(function() {
            return $this->transport_volume != '0.0000' ? $this->transport_volume : 0;
        });
        $grid->price_volume('Giá V/6000 (VND)')->display(function() {
            return $this->items->first()->payment_type == $this::V
                    ? number_format($this->getPriceService($this))
                    : 0;
        });
        $grid->transport_cublic_meter('M3');
        $grid->price_cublic_meter('Giá M3 (VND)')->display(function() {
            return $this->items->first()->payment_type == $this::M3
                    ? number_format($this->getPriceService($this))
                    : 0;
        });
        $grid->final_total_price('Tổng tiền (VND)')->display(function() {
            $total = number_format($this->final_total_price);
            if ($this->final_total_price <= 0) {
                return '<span class="label label-danger">'.$total.'</span>';
            }

            return $total;
        });
        
        $grid->created_at(trans('admin.created_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });
        $grid->user_created_id('Người tạo')->display(function () {
            return $this->userCreated->name ?? "";
        });
        $grid->internal_note('Ghi chú')->editable();
        $grid->actions(function ($actions) {
            $actions->disableEdit();
            $actions->disableDelete();
        });
        $grid->tools(function ($tools) {
            $tools->append(new UploadImport());

            $tools->append('<a href="'.route('transport_orders.china_receives').'" class="btn btn-sm btn-warning active">
                <i class="fa fa-grav"></i>
                <span class="hidden-xs">&nbsp;Trung Quốc nhận</span>
            </a>');
            $tools->append('<a href="'.route('transport_orders.vietnam_receives').'" class="btn btn-sm btn-success active">
                <i class="fa fa-plus"></i>
                <span class="hidden-xs">&nbsp;Hà Nội nhận</span>
            </a>');

            $tools->append('<a href="'.route('transport_orders.payments').'" class="btn btn-sm btn-danger active">
                <i class="fa fa-money"></i>
                <span class="hidden-xs">&nbsp;Thanh toán</span>
            </a>');
        });
        $grid->paginate(50);
        return $grid;
    }

    public function show($id, Content $content)
    {
        return $content
            ->header('Chi tiết đơn hàng vận chuyển')
            ->description('Danh sách')
            ->row(function (Row $row) use ($id){
                $row->column(12, function (Column $column) use ($id)
                {
                    $column->append($this->detail($id));
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
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Order);
        $form->text('internal_note', 'Ghi chú');

        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });

        return $form;
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function detail($id)
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

        $grid->customer_name('Tên khách hàng');
        // $grid->payment_type('Loại thanh toán')->display(function () {
        //     return $this->paymentTypeText($this);
        // });
        // $grid->price_service('Giá dịch vụ (VND)')->display(function () {
        //     return $this->items->first()->price_service ? number_format($this->items->first()->price_service) : "";
        // });
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
            $tools->append('<a href="'.route('transport_orders.index').'" class="btn btn-sm btn-primary" title="Danh sách đơn hàng vận chuyển">
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
            return '<span class="label label-primary">'.number_format($order->getSumKg(), 2).'</span>';
        });
        $grid->volume('Thể tích (V/6000)')->display(function () {
            return !is_null($this->volume) ? number_format($this->volume, 2) : number_format( ( $this->product_width * $this->product_height * $this->product_length)/6000, 2 );
        })->totalRow(function ($amount) use ($id, $order) {
            return '<span class="label label-primary">'. $order->getSumVolume().'</span>';
        });
        $grid->cublic_meter('Mét khối (M3)')->display(function () {
            return !is_null($this->cublic_meter) ? number_format($this->cublic_meter, 3) : number_format( ( $this->product_width * $this->product_height * $this->product_length)/1000000, 3 );
        })->totalRow(function ($amount) use ($id, $order) {
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
                    return "= ".number_format($this->volume, 2)." x ". number_format($this->price_service);
                case TransportOrderItem::M3:
                    return "= ".number_format($this->cublic_meter, 3)." x ". number_format($this->price_service);
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
        $detailMoneySumKg = $order->getDetailMoneySumKg();

        $rows = [
            [null, 'Số lượng', 'Đơn giá (VND)', 'Thành tiền (VND)', 'Chi tiết'],
            [
                'Tổng khối lượng', 
                $order->getSumKgAfterDiscount() . " (".$order->getSumKg()." ". $detailSumKg .")", 
                number_format($price[Order::KG]),
                $price[Order::KG] != 0 
                    ? number_format($order->getSumKgAfterDiscount() * $price[Order::KG])
                    : 0,
                "= " . $detailMoneySumKg 
            ],
            [
                'Tổng V/6000', 
                $order->getSumVolume(),
                number_format($price[Order::V]),
                $price[Order::V] != 0
                    ? number_format($order->getSumVolume() * $price[Order::V]) 
                    : 0,
                null
            ],
            [
                'Tổng M3', 
                $order->getSumCublicMeter(),
                number_format($price[Order::M3]),
                $price[Order::M3] != 0 
                    ? number_format($order->getSumCublicMeter() * $price[Order::M3]) 
                    : 0,
                null
            ],
            [
                'Tổng ứng kéo', 
                null, 
                null, 
                number_format($order->transport_advance_drag),
                "= ". $order->getSumItemAdvanceDrag()." Tệ"
            ],
            [
                'Tổng tiền', 
                null,
                null, 
                '<span class="label label-primary">'.number_format($order->final_total_price).'</span>',
                null
            ],
        ];

        $table = new Table($headers, $rows);
        $table->id('tbl_payment');

        return $table->render();
    }

    public function getDataTransportOrderItems(Request $request)
    {
        if (isset($request->isPayment) && $request->isPayment == 1) // thanh toan
        {
            $data = TransportOrderItem::where('cn_code', $request->cn_code)->where('warehouse_cn', 1)->where('warehouse_vn', 1)->where('is_payment', 0)->orderBy('id', 'desc')->first();
        } else {
            $data = TransportOrderItem::where('cn_code', $request->cn_code)->where('warehouse_cn', 1)->where('warehouse_vn', 0)->orderBy('id', 'desc')->first();
        }
        
        if (!is_null($data))
        {
            $data->customer_name = TransportCustomer::find($data->transport_customer_id)->name ?? null;
            $data->advance_drag = number_format($data->advance_drag) ?? null;
            $data->product_volumn = (float) ($data->product_width * $data->product_length * $data->product_height)/6000;
            $data->product_volumn = number_format($data->product_volumn, 2, '.', '');
            $data->product_cublic_meter = (float) ($data->product_width * $data->product_length * $data->product_height)/1000000;
            $data->product_cublic_meter = number_format($data->product_cublic_meter, 3, '.', '');
        }
        return $data ?? null;
    }

    public function storeOrderReceiveChina(Request $request)
    {
        $data = $request->all();
        $data['warehouse_cn'] = 1;
        $data['warehouse_cn_date'] = now();
        $data['advance_drag'] = str_replace(',', '', $data['advance_drag']);
        $data['kg'] = str_replace(',', '.', $data['kg']);
        $data['user_id_updated'] = Admin::user()->id;

        TransportOrderItem::create($data);
        return response()->json([
            'error' =>  false,
            'msg'   =>  'Tạo đơn hàng TQ nhận thành công'
        ]);
    }

    public function searchTransportOrderItems(Request $request)
    {
        $data = TransportOrderItem::where('cn_code', 'like', '%'.$request->cn_code.'%')
                ->where('warehouse_cn', 1)->where('warehouse_vn', 0)->get();
        if (!is_null($data))
        {
            foreach ($data as $item)
            {
                $item->customer_name = $item->customer->name ?? null;
            }
        }
        
        return $data ?? null;
    }

     /**
     * Create transport order
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function storeTransportOrder(Request $request)
    {
        DB::beginTransaction();
        try {
            $data = $request->all();
            $transport_customer_id = $this->getTransportCustomerId($data['customer_name']);
            $number_product = sizeof($data['cn_code']);

            foreach ($data['cn_code'] as $key => $code)
            {
                if (!is_null($code))
                {
                    $field = [
                        'cn_code'   =>  $code,
                        'kg'        =>  $data['kg'][$key] ?? 0,
                        'advance_drag'  =>  (int) str_replace(',', '', $data['advance_drag'][$key]) ?? null,
                        'product_width' =>  $data['product_width'][$key] ?? 0,
                        'product_length'    =>  $data['product_length'][$key] ?? 0,
                        'product_height'    =>  $data['product_height'][$key] ?? 0,
                        'transport_customer_id' =>  $transport_customer_id ?? null,
                        'user_id_updated'   =>  Admin::user()->id,
                        'warehouse_cn'  =>  1,
                        'warehouse_vn'  =>  1,
                        'warehouse_vn_date' =>  now(),
                        'note'          =>  $data['note'][$key] ?? null
                    ];

                    if (TransportOrderItem::where('cn_code', $field['cn_code'])->count() > 0)
                    {
                        TransportOrderItem::where('cn_code', $field['cn_code'])->orderBy('id', 'desc')->first()->update($field);
                    } else {

                        TransportOrderItem::create($field);
                    }
                }

            }

            DB::commit();
            Session::flash('notification', 'Tạo đơn hàng Hà Nội nhận thành công');
            return redirect()->back();
        } catch (\Exception $e) {

            DB::rollback();
            Log::error([
                'method'  => __METHOD__,
                'line'    => __LINE__,
                'message' => 'Lỗi khi tạo đơn hàng vận chuyển',
                'context' => [
                    'data'          => $request->all(),
                    'error_message' => $e->getMessage()
                ]
            ]);
            Session::flash('notification', $e->getMessage());
            return redirect()->back();
        }
    }

    public function getTransportCustomerId(string $customerName = null)
    {
        $cus = TransportCustomer::where('name', $customerName)->first();
        
        if (isset($cus))
        {
            return $cus->id;
        } else {
            $cus = TransportCustomer::create(['name' => $customerName]);
            return $cus->id;
        }
    }

    public function paymentTransportOrder(Request $request)
    {
        DB::beginTransaction();
        try {
            $data = $request->all();
            $data['user_id_updated'] = Admin::user()->id;
            $order_number = OrderService::generateOrderNR();
            dd($data);
            if (Order::where('order_number', $order_number)->count() == 0)
            {
                $order = Order::firstOrCreate([
                    'order_number'  =>  OrderService::generateOrderNR(),
                    'order_type'    =>  2,
                    'final_total_price' => $data['total-money'] ?? null,
                    'transport_kg'  =>  $data['count-kg'] ?? null,
                    'transport_volume'  =>  $data['count-volumn'] ?? null,
                    'transport_cublic_meter'    =>  $data['count-cublic-meter'] ?? null,
                    'transport_advance_drag'  => isset($data['advan']) ? (float) $data['advan'] : 0,
                    'user_created_id'   =>   $data['user_id_updated'],
                    'internal_note'     =>  $data['internal_note'] ?? null,
                    'user_created_name' =>  Admin::user()->name ?? null,
                    'discount_type' =>  $data['discount_type'][0],
                    'discount_method'   =>  $data['discount_type'][0],
                    'discount_value'    =>  $data['discount_kg']
                ]);

                $customer_name = null;
                foreach ($data['item_id'] as $key => $id)
                {
                    if (!is_null($id))
                    {
                        $id = (int) $id;
                        $payment_type = $data['payment_type'][$key];
                        if (is_null ($data['sum_cublic_meter'])) { $data['sum_cublic_meter'] = 0; }
                        if (is_null ($data['sum_volumn'])) { $data['sum_volumn'] = 0; }
                        if (is_null ($data['sum_kg'])) { $data['sum_kg'] = 0; }

                        switch ($payment_type)
                        {
                            case -1: // m3
                                $price_service = str_replace(',', '', $data['sum_cublic_meter']) ?? null;
                                $total_price = (int) $price_service * (int) $data['product_cublic_meter'][$key];
                                break;
                            case 0: // v
                                $price_service = str_replace(',', '', $data['sum_volumn']) ?? null;
                                $total_price = (int) $price_service * (int) $data['product_volumn'][$key];
                                break;
                            case 1: // kg
                                $price_service = str_replace(',', '', $data['sum_kg']) ?? null;
                                $total_price = (int) $price_service * (int) $data['kg'][$key];
                                break;
                        }

                        $item = TransportOrderItem::find($id)->update([
                            'order_id'  =>  $order->id,
                            'price_service' =>  $price_service,
                            'kg'    =>  $data['kg'][$key] ?? null,
                            'volume'    =>  $data['product_volumn'][$key] ?? null,
                            'advance_drag'  =>   str_replace(',', '', $data['advance_drag'][$key]) ?? null,
                            'total_price'   =>  $total_price,
                            'product_width' =>  $data['product_width'][$key] ?? null,
                            'product_height'    =>  $data['product_height'][$key] ?? null,
                            'product_length'    =>  $data['product_length'][$key] ?? null,
                            'is_payment'    =>  1,
                            'user_id_updated'   =>  $data['user_id_updated'],
                            'payment_type'  =>  $data['payment_type'][$key],
                            'cublic_meter'  =>  $data['product_cublic_meter'][$key],
                            'transporting_vn'   =>  1,
                            'transporting_vn_date'  =>  now()
                        ]);

                        if (is_null($customer_name))
                        {
                            $customer_name = TransportOrderItem::find($id)->customer->name ?? null;
                        }
                    }
                }

                if (! is_null($customer_name))
                {
                    Order::find($order->id)->update(['customer_name' => $customer_name]);
                }
            }
            
            DB::commit();
            Session::flash('notification', 'Thanh toán đơn hàng vận chuyển thành công');
            return redirect()->back();
        } catch (\Exception $exception) {
            dd($exception);
            DB::rollback();
            Log::error([
                'method'  => __METHOD__,
                'line'    => __LINE__,
                'message' => 'Lỗi khi thanh toán đơn hàng vận chuyển',
                'context' => [
                    'data'          => $request->all(),
                    'error_message' => $exception->getMessage()
                ]
            ]);
            Session::flash('notification', ['status' => 'danger', 'message' => 'Thanh toán đơn hàng vận chuyển lỗi']);
            return redirect()->back();
        }
    }
}
