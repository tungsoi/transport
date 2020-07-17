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
                $filter->equal('status', 'Trạng thái')->select(TransportOrderItem::STATUS)->default(1);
                $filter->like('user_created_id', 'Người sửa');
            });
            $filter->column(1/2, function ($filter) {
                $filter->between('created_at', 'Ngày về kho Trung Quốc')->date();
                $filter->between('created_at', 'Ngày về kho Hà Nội')->date();
            });
        });

        $grid->transport_customer_id('Tên KH')->display(function () {
            return $this->customer->name ?? "";
        });
        $grid->cn_code('Mã vận đơn');
        $grid->kg();
        $grid->product_width('Rộng');
        $grid->product_length('Dài');
        $grid->product_height('Cao');
        $grid->volume('V/6000')->display(function () {
            return !is_null($this->volume) ? number_format($this->volume, 2) : number_format( ( $this->product_width * $this->product_height * $this->product_length)/6000, 2 );
        });
        $grid->cublic_meter('M3')->display(function () {
            return !is_null($this->cublic_meter) ? number_format($this->cublic_meter, 3) : number_format( ( $this->product_width * $this->product_height * $this->product_length)/1000000, 3 );
        });
        $grid->advance_drag('Ứng kéo');
        $grid->total_price('Tổng tiền (VND)')->display(function() {
            return number_format($this->total_price);
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
            return $this->userUpdated->name;
        })->label('info');
        $grid->warehouse_cn_date('Ngày về kho TQ')->display(function () {
            return $this->warehouse_cn_date != "" ? date('H:i | d-m-Y', strtotime($this->warehouse_cn_date)) : "";
        });
        $grid->warehouse_vn_date('Ngày về kho VN')->display(function () {
            return $this->warehouse_vn_date != "" ? date('H:i | d-m-Y', strtotime($this->warehouse_vn_date)) : "";
        });
        $grid->note('Ghi chú')->editable();
        $grid->actions(function ($actions) {
            $actions->disableView();

            if ($actions->row->is_payment == 1) {
                $actions->disableEdit();
                $actions->disableDelete();
            }
        });
        $grid->paginate(50);
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
        $form->text('transport_customer_id', 'Tên khách hàng');
        $form->text('kg', 'Cân nặng');
        $form->text('product_length', 'Chiều dài');
        $form->text('product_width', 'Chiều rộng');
        $form->text('product_height', 'Chiều cao');
        $form->text('note', 'Ghi chú');

        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });

        return $form;
    }
}
