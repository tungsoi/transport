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

class OwedController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;

    public function __construct()
    {
        $this->title = 'Báo cáo công nợ';
    }

    public function index(Content $content)
    {
        return $content
            ->header($this->title)
            ->description('Danh sách')
            ->row(function (Row $row) {
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
        $grid = new Grid(new User);
        $grid->model()
        ->where('is_customer', 1)->orderBy('wallet', 'asc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->like('name', 'Họ và tên');
            $filter->like('email');
            $filter->like('phone_number', 'SDT');
            $filter->equal('ware_house_id', 'Kho')->select(Warehouse::where('is_active', 1)->get()->pluck('name', 'id'));
        });

        $grid->header(function ($query) {

            $owed = $query->sum('wallet');
            return '<h4>Công nợ khách hàng tạm tính hiện tại: <span style="color:red">'. number_format($owed) ."</span> (VND)</h4>";
        });

        $grid->rows(function (Grid\Row $row) {
            $row->column('number', ($row->number+1));
        });
        $grid->column('number', 'STT');
        $grid->symbol_name('Mã khách hàng');
        $grid->name('Họ và tên')->editable();
        $grid->email()->editable();
        $grid->phone_number('SDT')->editable();
        $grid->ware_house_id('Kho')->display(function () {
            return $this->warehouse->name ?? "";
        });
        $grid->wallet('Số dư ví (VND)')->display(function () {
            if ($this->wallet > 0) {
                return '<span class="label label-success">'.number_format($this->wallet) ?? "0".'</span>';
            }

            return '<span class="label label-danger">'.number_format($this->wallet).'</span>';
        });
        $grid->address('Địa chỉ')->editable();
        $grid->is_active('Trạng thái')->display(function () {
            switch($this->is_active) {
                case 1: 
                    return  '<span class="label label-success">Hoạt động</span>';
                default:
                return  '<span class="label label-danger">Khoá</span>';
            }
        });
        $grid->created_at(trans('admin.created_at'))->display(function () {
            return $this->created_at != "" ? date('H:i | d-m-Y', strtotime($this->created_at)) : "";
        });
        $grid->updated_at(trans('admin.updated_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->updated_at));
        });
        $grid->paginate(50);
        $grid->actions(function ($actions) {
            $actions->disableEdit();
            $actions->disableView();
            $actions->disableDelete();
        });
        $grid->disableActions();
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
