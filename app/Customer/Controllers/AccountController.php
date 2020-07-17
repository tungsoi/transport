<?php

namespace App\Customer\Controllers;

use App\Models\TransportRecharge;
use App\Models\Warehouse;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\User;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;

class AccountController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;

    public function __construct()
    {
        $this->title = 'Thông tin người dùng';
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {   
        $id = Admin::user()->id;
        $show = new Show(User::findOrFail($id));

        $show->name('Họ và tên');
        $show->email();
        $show->phone_number('Số điện thoại');
        $show->address('Địa chỉ');
        $show->wallet('Số dư ví')->as(function () {
            return number_format($this->wallet);
        });
        $show->symbol_name('Biệt danh');
        $show->ware_house_id('Kho')->as(function () {
            return $this->warehouse->name ?? "";
        });
        $show->is_active('Trạng thái')->as(function () {
            switch($this->is_active) {
                case 1: 
                    return  'Hoạt động';
                default:
                return  'Khoá';
            }
        });
        $show->created_at(trans('admin.created_at'))->as(function () {
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });
        $show->updated_at(trans('admin.updated_at'))->as(function () {
            return date('H:i | d-m-Y', strtotime($this->updated_at));
        });
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableList();
                $tools->disableDelete();
            });;
        return $show;
    }

    public function wallet(Content $content)
    {
        return $content
            ->header($this->title)
            ->description('Lịch sử giao dịch')
            ->body($this->rechargeHistoryGrid());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function rechargeHistoryGrid()
    {
        $id = Admin::user()->id;
        $grid = new Grid(new TransportRecharge());
        $grid->model()->where('customer_id', $id)->orderBy('id', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->equal('type_recharge', 'Loại giao dịch')->select(TransportRecharge::RECHARGE);
        });

        $grid->id('ID');
        $grid->customer_id('Tên khách hàng')->display(function () {
            return $this->customer->name ?? "";
        });
        $grid->user_id_created('Nhân viên thực hiện')->display(function () {
            return $this->userCreated->name ?? "";
        });
        $grid->money('Số tiền')->display(function () {
            if ($this->money > 0) {
                return '<span class="label label-success">'.number_format($this->money) ?? "0".'</span>';
            }

            return '<span class="label label-danger">'.number_format($this->money).'</span>';
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

        $grid->disableCreateButton();
        return $grid;
    }

}
