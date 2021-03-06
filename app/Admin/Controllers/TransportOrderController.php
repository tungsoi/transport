<?php

namespace App\Admin\Controllers;

use App\Admin\Services\OrderService;
use App\Customer\Services\OrderService as CustomerOrderService;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use App\User;
use App\Models\Order;
use App\Models\TransportOrderItem;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Table;
use Illuminate\Http\Request;
use App\Models\TransportCustomer;
use App\Models\TransportRecharge;
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
                $filter->where(function ($query) {
                    $orders = TransportOrderItem::where('customer_name', 'like', "%{$this->input}%")->get()->pluck('order_id');

                    $query->whereIn('id', $orders);
                
                }, 'Tên khách hàng');
                $filter->equal('payment_customer_id', 'Khách hàng thanh toán')->select(User::where('is_customer', 1)->get()->pluck('symbol_name', 'id'));
            });
        });
        $grid->rows(function (Grid\Row $row) {
            $row->column('number', ($row->number+1));
        });
        $grid->column('number', 'STT');
        $grid->order_number('Mã đơn hàng');
        $grid->transport_customer_id('Tên khách hàng')->display(function() {
            if ($this->transport_customer_id == "") {
                return $this->items->first()->customer_name ?? "";
            }
            return $this->transportCustomer->symbol_name ?? "";
        });
        $grid->payment_customer_id('KH Thanh toán')->display(function() {
            if ($this->payment_customer_id != "") {
                return $this->paymentCustomer->symbol_name ?? "";
            }
            return "";
        });
        $grid->items('Số MVD')->count()->expand(function ($model) {

            $items = $model->items()->take(200)->get()->map(function ($comment) {
                return $comment->only(['cn_code', 'kg', 'product_width', 'product_length', 'product_height', 'advance_drag']);
            })->toArray();
            
            return new Table(['MVD', 'Khối lượng (kg)', 'Rộng (cm)', 'Dài (cm)', 'Cao (cm)', 'Ứng kéo (Tệ)'], $items);
        });
        $grid->transport_kg('KG')->totalRow();
        $grid->price_kg('Giá KG (VND)')->display(function() {
            return number_format($this->getPriceService($this, $this::KG));
        });
        $grid->transport_volume('V/6000')->display(function() {
            return $this->transport_volume != '0.0000' ? $this->transport_volume : 0;
        });
        $grid->price_volume('Giá V/6000 (VND)')->display(function() {
            return number_format($this->getPriceService($this, $this::V));
        });
        $grid->transport_cublic_meter('M3');
        $grid->price_cublic_meter('Giá M3 (VND)')->display(function() {
            return number_format($this->getPriceService($this, $this::M3));
        });
        $grid->final_total_price('Tổng tiền (VND)')->display(function() {
            $total = number_format($this->final_total_price);
            if ($this->final_total_price <= 0) {
                return '<span class="label label-danger">'.$total.'</span>';
            }

            return '<span class="label label-success">'.$total.'</span>';
        });
        
        $grid->created_at(trans('admin.created_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });
        $grid->user_created_id('Người tạo')->display(function () {
            return $this->userCreated->name ?? "";
        });
        $grid->internal_note('Ghi chú')->editable();
        $grid->actions(function ($actions) {

            if (! Admin::user()->can('order.detail') ) {
                $actions->disableView();
            }

            $actions->disableDelete();
            $actions->disableEdit();
        });
        $grid->disableCreateButton();
        $grid->disableRowSelector();
        $grid->tools(function ($tools) {
            if (Admin::user()->can('order.china') ) {
                $tools->append('<a href="'.route('transport_orders.china_receives').'" class="btn btn-sm btn-warning active" target="_blank">
                    <i class="fa fa-grav"></i>
                    <span class="hidden-xs">&nbsp;Trung Quốc nhận</span>
                </a>');
            }

            if (Admin::user()->can('order.vietnam') ) {
                $tools->append('<a href="'.route('transport_orders.vietnam_receives').'" class="btn btn-sm btn-success active"  target="_blank">
                    <i class="fa fa-plus"></i>
                    <span class="hidden-xs">&nbsp;Hà Nội nhận</span>
                </a>');
            }

            if (Admin::user()->can('order.payment') ) {
                $tools->append('<a href="'.route('transport_orders.payments').'" class="btn btn-sm btn-danger active"  target="_blank">
                    <i class="fa fa-money"></i>
                    <span class="hidden-xs">&nbsp;Thanh toán</span>
                </a>');
            }
        });
        if (! Admin::user()->can('order.export') ) {
            $grid->disableExport();
        }

        $grid->paginate(20);
        $grid->perPages([20, 50, 100, 200, 1000]);
        return $grid;
    }

    /**
     * Show screen
     *
     * @param [type] $id
     * @param Content $content
     * @return void
     */
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
        try {
            $grid = new Grid(new Order);
            $grid->model()->where('id', $id);
    
            $grid->header(function ($query) {
                return "<h4 class='uppercase'><b>Thông tin chi tiết</b> <br></h4>";
            });
    
            $grid->order_number('Mã đơn hàng');
            $grid->final_total_price('Tổng tiền (VND)')->display(function() {
                $total = number_format(str_replace('.00', '', $this->final_total_price));
                if ($this->final_total_price <= 0) {
                    return '<span class="label label-danger">'.$total.'</span>';
                }
                return $total;
            });
    
            $grid->transport_customer_id('Mã khách hàng')->display(function() {
                return $this->items->first()->customer_name ?? "";
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
        } catch (\Exception $e) {
            dd($e);
        }
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function listItem($id)
    {   
        try {
            $grid = new Grid(new TransportOrderItem());
            $order = Order::find($id);
            $grid->model()->where('order_id', $id);
            $grid->header(function ($query) {
                return "<h4 class='uppercase'><b>Danh sách mã vận đơn</b> <br></h4>";
            });
            $grid->rows(function (Grid\Row $row) {
                $row->column('number', ($row->number+1));
            });
            $grid->column('number', 'STT');
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
            // $grid->description('Chi tiết')->display(function () {
            //     switch ($this->payment_type)
            //     {
            //         case TransportOrderItem::KG:
            //             return "= ".(int) $this->kg." x ". number_format($this->price_service);
            //         case TransportOrderItem::V:
            //             return "= ".$this->volume." x ". number_format($this->price_service);
            //         case TransportOrderItem::M3:
            //             return "= ".$this->cublic_meter." x ". number_format($this->price_service);
            //     }      
            //     return number_format($this->kg * $this->price_service) ?? 0;
            // });

            $grid->disableActions();
            $grid->disablePagination();
            $grid->disableCreateButton();
            $grid->disableFilter();
            $grid->disableRowSelector();
            $grid->disableColumnSelector();
            $grid->disableTools();
            $grid->disableExport();

            return $grid;
        } catch (\Exception $e) {
            dd($e);
        }
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function discount($id)
    {
        try {
                
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
        } catch (\Exception $e) {
            dd($e);
        }
    }


    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function payment($id)
    {
        try {
                
            $order = Order::find($id);

            // Tổng kg sau khi đã tính giảm trừ
            $sumKg = $order->getSumKgAfterDiscount();

            $price = [
                Order::KG => $order->items->where('payment_type', Order::KG)->first()->price_service ?? 0,
                Order::V  => $order->items->where('payment_type', Order::V)->first()->price_service ?? 0,
                Order::M3 => $order->items->where('payment_type', Order::M3)->first()->price_service ?? 0
            ];

            // Header table
            $headers = ['THANH TOÁN', null, null, null, null];

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
                [
                    "",
                    "",
                    "",
                    "",
                    "",
                ],
                [
                    "<h5><b>Yêu cầu Khách hàng kiểm tra đủ số lượng hàng hoá và đúng mã vận đơn theo đơn hàng. Nếu có sai sót xin phản ánh lại với công ty trong vòng 24h.</b></h5>",
                    "",
                    "",
                    "",
                    "<h5><b>Khách hàng ký nhận.</b></h5>"

                ]
            ];

            $table = new Table($headers, $rows);
            $table->id('tbl_payment');

            return $table->render();
        } catch (\Exception $e) {
            dd($e);
        }
    }

    public function getDataTransportOrderItems(Request $request)
    {
        $service = new OrderService();
        return $service->getOrderItem($request->all());
    }

    /**
     * Tao Don hang TQ nhan
     *
     * @param Request $request
     * @return void
     */
    public function storeOrderReceiveChina(Request $request)
    {
        DB::beginTransaction();
        try {
            $service = new OrderService();
            if ($service->isExitsCnCode($request->cn_code)) {
                return response()->json([
                    'error' =>  true,
                    'msg'   =>  'Mã vận đơn đã tồn tại. Vui lòng nhập mã khác.'
                ]);
            }

            $data = $service->buildDataChinaReceive($request->all());

            $flag = TransportOrderItem::where('cn_code', $data['cn_code'])->first();

            if ($flag == null) {
                
                TransportOrderItem::create($data);

                DB::commit();
                return response()->json([
                    'error' =>  false,
                    'msg'   =>  'Tạo đơn hàng TQ nhận thành công'
                ]);
            }

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'error' =>  true,
                'msg'   =>  $e->getMessage()
            ]);
        }
    }

    /**
     * Search transport order item
     *
     * @param Request $request
     * @return void
     */
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
     * Don hang Ha Noi nhan
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function storeTransportOrder(Request $request)
    {
        DB::beginTransaction();
        try {
            $service = new OrderService();
            $data = $request->all();

            if (sizeof($data['cn_code']) >= 1) {
                foreach ($data['cn_code'] as $key => $cn_code) {
                    if ($cn_code != "") {
                        $item = $service->buildDataVietnamReceive([
                            'customer_name'     =>  $data['customer_name'],
                            'cn_code'           =>  $cn_code,
                            'kg'                =>  $data['kg'][$key],
                            'product_width'     =>  $data['product_width'][$key],
                            'product_length'    =>  $data['product_length'][$key],
                            'product_height'    =>  $data['product_height'][$key],
                            'advance_drag'      =>  $data['advance_drag'][$key],
                            'note'              =>  $data['note'][$key],
                            'ware_house_id'     =>  $data['ware_house_id']
                        ]);

                        $flag = TransportOrderItem::where('cn_code', $item['cn_code'])->first();

                        if ($flag == null) {
                            TransportOrderItem::create($item);
                        }
                        else {
                            TransportOrderItem::find($flag->id)->update($item);
                        }
                    }
                    
                }
            }

            DB::commit();
            Session::flash('notification', 'Tạo đơn hàng Hà Nội nhận thành công');
            return redirect()->back();

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error([
                'message' => 'Lỗi khi tạo đơn hàng vận chuyển'
            ]);
            Session::flash('notification', $e->getMessage());
            return redirect()->back()->withInput();
        }
    }

    /**
     * Thanh toán đơn hàng
     *
     * @param Request $request
     * @return void
     */
    public function paymentTransportOrder(Request $request)
    {
        DB::beginTransaction();
        try {
            $service = new OrderService();
            $data = $service->buildDataPayment($request->all());

            if (is_null($data['payment_customer_id'])) {
                Session::flash('payment-error', 'Vui lòng chọn Khách hàng thanh toán đơn hàng.');
                return redirect()->back();
            }

            $flag = Order::where('order_number', $data['order_number'])->count();
            if ($flag == 0 && sizeof($request->item_id) >= 1) {
                # create order
                $order = Order::create($data);

                # update items
                foreach ($request->item_id as $key => $id)
                {
                    $dataItem = $service->buildDataItemPaymentUpdate($key, $request->all());
                    $dataItem['order_id'] = $order->id;

                    TransportOrderItem::find($id)->update($dataItem);
                }

                # process wallet customer
                $customer = User::find($request->payment_customer_id);
                $wallet = (int)$customer->wallet;
                $customer->update([
                    'wallet'    =>  (int) $wallet - (int) str_replace('.00', '', $data['final_total_price'])
                ]);
                $customer->save();

                # create record in report_recharge
                TransportRecharge::create([
                    'customer_id'       =>  $request->payment_customer_id,
                    'user_id_created'   =>  1,
                    'money'             =>  (int) str_replace('.00', '', $data['final_total_price']),
                    'type_recharge'     =>  TransportRecharge::DEDUCTION,
                    'content'           =>  TransportRecharge::RECHARGE_PAYMENT . " " . $order->order_number
                ]);
                
                DB::commit();
                Session::flash('payment-success', 'Thanh toán đơn hàng vận chuyển thành công');

                return redirect()->route('transport_orders.payments')->with(['order_raw' => $order]);

            }
        } catch (\Exception $exception) {
            DB::rollBack();
            Log::error(['message' => 'Lỗi khi thanh toán đơn hàng vận chuyển' ]);
            Session::flash('payment-error', ['status' => 'danger', 'message' => 'Thanh toán đơn hàng vận chuyển lỗi']);

            return redirect()->back();
        }
    }

    public function getDataPaymentCustomer(Request $request) {
        $customer = User::select('wallet')->find($request->customer_id);
        $customer->wallet = number_format($customer->wallet);
        return response()->json([
            'customer'  =>  $customer
        ]);
    }
}
