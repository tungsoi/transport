<?php

namespace App\Admin\Controllers\Report;

use App\Models\Warehouse;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\User;
use App\Models\TransportOrderItem;
use App\Models\TransportRecharge;
use Encore\Admin\Layout\Row;
use Encore\Admin\Layout\Content;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Layout\Column;

class RefundController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;

    public function __construct()
    {
        $this->title = 'Báo cáo hoàn trả tiền';
    }

    public function index(Content $content)
    {
        return $content
            ->header($this->title)
            ->description('Số tiền hoàn trả khách hàng khi thanh toán nhầm')
            ->row(function (Row $row) {
                // $row->column(12, function (Column $column)
                // {
                //     $title = "Báo cáo hoàn trả tiền theo tháng 2020";
                //     $dataArray = [];
                //     for ($i = 1; $i <= 12; $i++) {
                //         $rows = TransportRecharge::whereYear('created_at', '=', '2020')
                //                 ->whereMonth('created_at', '=', $i)
                //                 ->where('type_recharge', TransportRecharge::REFUND)
                //                 ->sum('money');

                //         $dataArray[] = $rows;
                //     }
                //     $data = implode(",", $dataArray);
                //     $column->append(view('admin.charts.bar', compact('title', 'data')));
                // });
                $row->column(12, function (Column $column)
                {
                    $column->append($this->grid());
                });
            });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new TransportRecharge);
        $grid->model()->whereIn('type_recharge', [TransportRecharge::REFUND])->where('money', '>', 0)->orderBy('id', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->between('created_at', 'Ngày tạo')->date();
        });

        $grid->header(function ($query) {
            $money = $query->sum('money');
            return '<h4>Tổng hoàn tiền hiện tại: <span style="color:red">'. number_format($money) ."</span> (VND)</h4>";
        });

        $grid->id('ID');
        $grid->customer_id('Mã khách hàng')->display(function () {
            return $this->customer->symbol_name ?? "";
        });
        $grid->user_id_created('Nhân viên thực hiện')->display(function () {
            return $this->userCreated->name ?? "";
        });
        $grid->money('Số tiền')->display(function () {
            return number_format($this->money);
        });
        $grid->type_recharge('Loại giao dịch')->display(function () {
            return TransportRecharge::RECHARGE[$this->type_recharge];
        });
        $grid->content('Nội dung');
        $grid->created_at(trans('admin.created_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });
        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->disableView();
            $actions->disableEdit();
        });
        $grid->disableActions();

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
