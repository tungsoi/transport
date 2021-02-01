<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\CheckRow;
use App\Models\Warehouse;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\User;
use App\Models\TransportOrderItem;
use Encore\Admin\Facades\Admin;
use App\Models\Order;

class TransportOrderItemController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;

    public function __construct()
    {
        $this->title = 'Danh sách mã vận đơn';
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new TransportOrderItem);
        $grid->model()->orderBy('is_payment', 'asc')->orderBy('created_at', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->where(function ($query) {
                    $orders = Order::where('order_number', 'like', "%{$this->input}%")->get()->pluck('id');

                    $query->whereIn('order_id', $orders);
                
                }, 'Mã đơn hàng');
                $filter->like('cn_code', 'Mã vận đơn');
                $filter->like('customer_name', 'Mã KH');
                $filter->equal('transport_customer_id', 'Mã khách hàng thanh toán')->select(User::whereIsCustomer(1)->get()->pluck('symbol_name', 'id'));
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
                $filter->between('warehouse_cn_date', 'Ngày về TQ')->date();
                $filter->between('warehouse_vn_date', 'Ngày về HN')->date();
                $filter->equal('user_id_updated', 'Người sửa')->select(User::where('is_customer', 0)->pluck('name', 'id'));
                $filter->where(function ($query) {
                    if ($this->input == '0') {
                        $duplicate_items = TransportOrderItem::select('cn_code')->groupBy('cn_code')->havingRaw('count(cn_code) > 1')->get()->pluck('cn_code');
                        
                        $query->whereIn('cn_code', $duplicate_items);
                    }
                }, 'Mã vận đơn', 'search_customer_order')->radio(['Bị trùng hoặc nhảy mã']);
            });
        });
        $grid->rows(function (Grid\Row $row) {
            $row->column('number', ($row->number+1));
        });
        $grid->column('number', 'STT');
        $grid->order_id('Mã đơn hàng')->display(function () {
            return $this->order->order_number ?? "";
        });
        $grid->cn_code('MVD')->display(function () {
            $html = "<span class='label label-warning'>".$this->cn_code."</span>";

            $flag = TransportOrderItem::where('cn_code', $this->cn_code)->get();

            if ($flag->count() > 1) {
                $html .= "<br><br> Trùng (".($flag->count() - 1).")";
                return $html;
            }

            return $html;
        });
        $grid->transport_customer_id('Mã KH')->display(function () {
            $check_row = false;
            if ($this->warehouse_cn == 1 && $this->warehouse_vn == 1 && $this->is_payment == 0) {
                $check_row = true; // chua thanh toan ha noi nhan
            }
            $input = "<input type='hidden' class='flag' value='".$check_row."' data-item-id='".$this->id."'/>";
            if ($this->transport_customer_id == "") {
                return $this->customer_name.$input;
            }
            $res = $this->customer_name ?? "";
            if ($res != null) {
                return $res.$input;
            }
        });
        $grid->column('payment_customer_id', 'KH Thanh toán')->display(function () {
            if (is_null($this->order_id)) {
                return "";
            }

            return $this->order->paymentCustomer->symbol_name ?? "";
        });
        $grid->kg()->totalRow(function ($amount) {
            $amount = number_format($amount, 2);
            return '<span class="label label-danger">'.$amount.'</span>';
        });
        $grid->product_width('Rộng (cm)');
        $grid->product_length('Dài (cm)');
        $grid->product_height('Cao (cm)');
        $grid->volume('V/6000')->display(function() {
            return str_replace('.00', '', $this->volume);
        })->totalRow(function ($amount) {
            $amount = number_format($amount, 2);
            return '<span class="label label-danger">'.$amount.'</span>';
        });
        $grid->cublic_meter('M3')->display(function() {
            return str_replace('.000', '', $this->cublic_meter);
        })->totalRow(function ($amount) {
            $amount = number_format($amount, 3);
            return '<span class="label label-danger">'.$amount.'</span>';
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
                    return '<span class="label label-success">'.$msg.'</span> <br>' . date('H:i | d-m-Y', strtotime($this->order->created_at));
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
        $grid->ware_house_id('Kho')->display(function () {
            return $this->warehouse->name ?? "";
        });
        $grid->actions(function ($actions) {
            $actions->disableView();
            
            if ($actions->row->is_payment == 1) {
                $actions->disableEdit();
                $actions->disableDelete();

                $id = $actions->row->id;
                Admin::script(
<<<EOT
$('input[data-id=$id]').parent().parent().empty();
EOT);
            } elseif ($actions->row->warehouse_vn == 0) {
                $actions->disableEdit();
            }

            if (! Admin::user()->isRole('administrator')) {
                $actions->disableDelete();
            }
        });
        $grid->paginate(20);
        $grid->disableCreateButton();

        $grid->tools(function (Grid\Tools $tools) {
            if (Admin::user()->can('order.payment') ) {
                $tools->append('<a id="btn-payment-code" class="btn btn-sm btn-danger" title="Thanh toán">
                    <i class="fa fa-dollar"></i>
                    <span class="hidden-xs">&nbsp;Thanh toán</span>
                </a>');
            }

            $tools->batch(function(Grid\Tools\BatchActions $actions){
                // if (! Admin::user()->isRole('administrator')) {
                    // $actions->disableDelete();
                // }
            });
        });

        Admin::script(
            <<<EOT

            $('tfoot').each(function () {
                $(this).insertAfter($(this).siblings('thead'));
            });

            let flags = $('table .column-transport_customer_id .flag');
            $(flags).each(function( index ) {
                if (!flags.eq(index).val()) {
                    flags.eq(index).parent().prev().prev().children().remove();
                }
            });

            $('#btn-payment-code').on('click', function (e)
            {
                let checked = $('table input[class="grid-row-checkbox"]:checked');
                let list = "";
                $(checked).each(function( index ) {
                    let cn_code = checked.eq(index).parent().parent().next().next().next().children().html().trim();
                    if (cn_code != "") {
                        list += cn_code + ",";
                    }
                });
               
                window.location.href = "/admin/transport_orders/payments?payment_in_list_code="+list;
            });


EOT
    );
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
        $show = new Show(TransportOrderItem::findOrFail($id));
        $show->id('ID');
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new TransportOrderItem);
        $form->text('cn_code', 'Mã vận đơn')->rules('required');
        $form->text('customer_name', 'Mã khách hàng');
        // $form->select('transport_customer_id', 'Tên khách hàng')->options(User::where('is_customer', 1)->get()->pluck('symbol_name', 'id'))->rules('required');
        $form->text('kg', 'Cân nặng (kg)')->rules('required');
        $form->text('product_length', 'Chiều dài (cm)')->rules('required');
        $form->text('product_width', 'Chiều rộng (cm)')->rules('required');
        $form->text('product_height', 'Chiều cao (cm)')->rules('required');
        $form->text('advance_drag', 'Ứng kéo (Tệ)')->rules('required');
        $form->text('note', 'Ghi chú');
        $form->hidden('volume');
        $form->hidden('cublic_meter');

        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        $form->tools(function (Form\Tools $tools) {
            $tools->disableView();
        });

        $form->saving(function (Form $form) {
            $form->volume = TransportOrderItem::calculateVolume(
                $form->product_width,
                $form->product_height,
                $form->product_length,
            );

            $form->cublic_meter = TransportOrderItem::calculateCublicMeter(
                $form->product_width,
                $form->product_height,
                $form->product_length,
            );
        });
        return $form;
    }
}
