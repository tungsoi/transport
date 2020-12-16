<?php

namespace App\Admin\Controllers\ReportWarehouse;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Models\ReportWarehouse;
use Encore\Admin\Facades\Admin;

class DetailController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;

    public function __construct()
    {
        $this->title = 'NHẬP KG ĐẦU VÀO ALILOGI';
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ReportWarehouse());
        $grid->model()->orderBy('date', 'desc')->orderBy('order', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->date('date', "Ngày về kho")->date();
            $filter->like('title', "Ký hiệu");
        });

        $grid->quickCreate(function (Grid\Tools\QuickCreate $create) {
            $create->date('date',"Ngày về kho");
            $create->text('order',"STT");
            $create->text('title', "Ký hiệu");
            $create->text('weight',"Cân nặng");
            $create->text('lenght','Dài (cm)');
            $create->text('width','Rộng (cm)');
            $create->text('height','Cao (cm)');
            $create->text('cublic_meter', 'Mét khối');
            $create->text('line', 'Line');
        });

        $grid->column('date',"Ngày về kho")->width(150);
        $grid->column('order',"STT")->width(64);
        $grid->column('title', "Ký hiệu")->width(138);
        $grid->column('weight',"Cân nặng")->width(121); // ->totalRow();
        $grid->column('lenght','Dài (cm)')->width(100);
        $grid->column('width','Rộng (cm)')->width(100);
        $grid->column('height','Cao (cm)')->width(100);
        $grid->column('cublic_meter', 'Mét khối')->width(100); //->totalRow();
        $grid->column('line', 'Line')->width(100);
        $grid->created_at(trans('admin.created_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });

        // setup
        $grid->paginate(200);

        // style
        Admin::style('
            .quick-create input#date {
                width: 150px !important;
            }
            .quick-create input#order {
                width: 64px !important;
            }
            .quick-create input#title {
                width: 100px !important;
            }
            .quick-create input#weight {
                width: 100px !important;
            }
            .quick-create input#lenght {
                width: 100px !important;
            }
            .quick-create input#width {
                width: 100px !important;
            }
            .quick-create input#height {
                width: 100px !important;
            }
            .quick-create input#cublic_meter {
                width: 100px !important;
            }
            .quick-create input#line {
                width: 100px !important;
            }
        
        ');


        // script
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
        $show = new Show(ReportWarehouse::findOrFail($id));

        $show->field('id', trans('admin.id'));
        $show->title(trans('admin.title'));
        $show->order(trans('admin.order'));
        $show->field('created_at', trans('admin.created_at'));
        $show->field('updated_at', trans('admin.updated_at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ReportWarehouse);

        $form->display('id', __('ID'));
        $form->date('date', "Ngày về kho")->default(now());
        $form->text('order', "STT");
        $form->text('title', "Ký hiệu");
        $form->text('weight', "Cân nặng");
        $form->text('lenght', 'Dài (cm)');
        $form->text('width', 'Rộng (cm)');
        $form->text('height', 'Cao (cm)');
        $form->text('cublic_meter', 'Mét khối');
        $form->text('line', 'Line');

        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        return $form;
    }
}
