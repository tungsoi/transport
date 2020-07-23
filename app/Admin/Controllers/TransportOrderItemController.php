<?php

namespace App\Admin\Controllers;

use App\Models\Warehouse;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\User;
use App\Models\TransportOrderItem;

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
        $grid->model()->orderBy('id', 'desc');

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

            if ($actions->row->is_payment == 1) {
                $actions->disableEdit();
                $actions->disableDelete();
            } elseif ($actions->row->warehouse_vn == 0) {
                $actions->disableEdit();
            }
        });
        $grid->paginate(20);
        $grid->disableCreateButton();
        
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
        $form->select('transport_customer_id', 'Tên khách hàng')->options(User::where('is_customer', 1)->get()->pluck('symbol_name', 'id'))->rules('required');
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
