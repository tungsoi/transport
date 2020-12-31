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
use Encore\Admin\Facades\Admin;

class DeductionController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;

    public function __construct()
    {
        $this->title = 'Báo cáo doanh thu';
    }

    public function index(Content $content)
    {
        return $content
            ->header($this->title)
            ->description('Trừ tiền theo đơn thanh toán')
            ->row(function (Row $row) {
                $row->column(12, function (Column $column)
                {
                    $title = "Báo cáo doanh thu theo tháng 2020";
                    $dataArray = [];
                    for ($i = 1; $i <= 12; $i++) {
                        $rows = TransportRecharge::whereYear('created_at', '=', '2020')
                                ->whereMonth('created_at', '=', $i)
                                ->where('type_recharge', TransportRecharge::PAYMENT)
                                ->sum('money');

                        $dataArray[] = $rows;
                    }
                    $data = implode(",", $dataArray);
                    $column->append(view('admin.charts.bar', compact('title', 'data')));
                });
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
        $grid->model()->where('type_recharge', TransportRecharge::DEDUCTION)
        ->where('content', 'like', 'Thanh toán đơn hàng vận chuyển%')->orderBy('id', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->where(function ($query) {

                $query->where('content', 'like', "%{$this->input}%");
            
            }, 'Mã đơn hàng');
            $filter->where(function ($query) {
                $query->where('created_at', '>=', $this->input." 00:00:00");
            }, 'Ngày thanh toán nhỏ nhất', 'created_at_begin')->date();
            $filter->where(function ($query) {
                $query->where('created_at', '<=', $this->input." 23:59:59");
            }, 'Ngày thanh toán lớn nhất', 'created_at_finish')->date();
        });

        $grid->id('ID');
        $grid->column('order_code', 'Mã đơn hàng')->display(function () {
            $data = explode(' ', $this->content);
            return $data[sizeof($data)-1] ?? null;
        });
        $grid->customer_id('Mã khách hàng')->display(function () {
            return $this->customer->symbol_name ?? "";
        });
        $grid->user_id_created('Nhân viên thực hiện')->display(function () {
            return $this->userCreated->name ?? "";
        });
        $grid->money('Số tiền')->display(function () {
            if ($this->money > 0) {
                return '<span class="label label-success">'.number_format($this->money) ?? "0".'</span>';
            }

            return '<span class="label label-danger">'.number_format($this->money).'</span>';
        })->totalRow(function ($amount) {
            $am = number_format($amount);
            return '<span class="label label-danger">'.$am.'</span>';
        });
        $grid->type_recharge('Loại giao dịch')->display(function () {
            return TransportRecharge::RECHARGE_PAYMENT;
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

        $grid->disableCreateButton();
        $grid->disableActions();
        Admin::script(
            <<<EOT

            $('tfoot').each(function () {
                $(this).insertAfter($(this).siblings('thead'));
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
