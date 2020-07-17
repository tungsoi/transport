<?php

namespace App\Admin\Controllers;

use App\Models\Warehouse;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\User;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Layout\Column;

class ChinaReceivceController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;
    protected $description;

    public function __construct()
    {
        $this->title = 'Trung Quốc Nhận';
        $this->description = 'Tạo mới';
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Warehouse);

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->like('name', 'Tên kho');
            $filter->like('address', 'Địa chỉ');
        });

        $grid->id('ID');
        $grid->name('Tên kho')->editable();
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
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });
        $grid->updated_at(trans('admin.updated_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->updated_at));
        });

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
        $show = new Show(Warehouse::findOrFail($id));

        $show->id('ID');
        $show->name('Tên Kho');
        $show->address('Địa chỉ');
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
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Warehouse);
        $form->text('name', 'Tên Kho')->rules('required');
        $form->text('address', 'Địa chỉ');
        $form->select('is_active', 'Trạng thái')->options(User::STATUS)->default(1)->rules('required');

        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        return $form;
    }

    public function index(Content $content)
    {
        return $content
            ->header($this->title)
            ->description($this->description)
            ->row(function (Row $row) {
                $row->column(12, function (Column $column)
                {
                    $column->append(view('admin.orders.china_receive'));
                });
            });
    }
}
