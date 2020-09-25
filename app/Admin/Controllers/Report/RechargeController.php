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

class RechargeController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;

    public function __construct()
    {
        $this->title = 'Báo cáo nạp tài khoản';
    }

    public function index(Content $content)
    {
        return $content
            ->header($this->title)
            ->description('Số tiền khách hàng nạp vào tài khoản')
            ->row(function (Row $row) {
                $row->column(12, function (Column $column)
                {
                    $title = "Thống kê tiền nạp khách hàng theo tháng 2020";
                    $dataArray = [];
                    for ($i = 1; $i <= 12; $i++) {
                        $rows = TransportRecharge::whereYear('created_at', '=', '2020')
                                ->whereMonth('created_at', '=', $i)
                                ->where('type_recharge', TransportRecharge::RECHARGE_MONEY)
                                ->sum('money');

                        $dataArray[] = $rows;
                    }
                    $dataMoney = implode(",", $dataArray);

                    $dataArrayBank = [];
                    for ($i = 1; $i <= 12; $i++) {
                        $rows = TransportRecharge::whereYear('created_at', '=', '2020')
                                ->whereMonth('created_at', '=', $i)
                                ->where('type_recharge', TransportRecharge::RECHARGE_BANK)
                                ->sum('money');

                        $dataArrayBank[] = $rows;
                    }
                    $dataBank = implode(",", $dataArrayBank);

                    $column->append(view('admin.charts.recharge', compact('title', 'dataMoney', 'dataBank')));
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
        $grid->model()->whereIn('type_recharge', [TransportRecharge::RECHARGE_MONEY, TransportRecharge::RECHARGE_BANK])->orderBy('id', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->equal('type_recharge', 'Loại giao dịch')->select(TransportRecharge::RECHARGE);
        });

        $grid->id('ID');
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

        $grid->tools(function (Grid\Tools $tools) {
            $tools->append('<a href="'.route('reports.recharges').'" class="btn btn-sm btn-danger" title="Tất cả">
                <i class="fa fa-dollar"></i>
                <span class="hidden-xs">&nbsp;Tất cả</span>
            </a>');

            $tools->append('<a href="'.route('reports.recharges').'?&type_recharge=0" class="btn btn-sm btn-warning" title="Nạp tiền mặt">
                <i class="fa fa-dollar"></i>
                <span class="hidden-xs">&nbsp;Nạp tiền mặt</span>
            </a>');
            $tools->append('<a href="'.route('reports.recharges').'?&type_recharge=1" class="btn btn-sm btn-success" title="Nạp tiền chuyển khoản">
                <i class="fa fa-dollar"></i>
                <span class="hidden-xs">&nbsp;Nạp tiền chuyển khoản</span>
            </a>');
        });

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
