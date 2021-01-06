<?php

namespace App\Admin\Controllers\ReportWarehouse;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Models\ReportWarehouse;
use Encore\Admin\Facades\Admin;
use Illuminate\Foundation\Console\Presets\React;
use Illuminate\Http\Request;

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
        $grid->model()->orderBy('created_at', 'desc')->orderBy('order', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->date('date', "Ngày về kho")->date();
            $filter->like('title', "Ký hiệu");
        });

        $grid->column('date',"Ngày về kho")->width(150);
        $grid->column('order',"STT")->width(64)->editable();
        $grid->column('title', "Ký hiệu")->width(138)->editable();
        $grid->column('weight',"Cân nặng")->width(121)->editable()->totalRow();
        $grid->column('lenght','Dài (cm)')->width(100)->editable();
        $grid->column('width','Rộng (cm)')->width(100)->editable();
        $grid->column('height','Cao (cm)')->width(100)->editable();
        $grid->column('cublic_meter', 'Mét khối')->width(100)->editable();
        $grid->column('line', 'Line')->width(100)->editable();
        $grid->created_at(trans('admin.created_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });

        // setup
        $grid->paginate(200);
        $grid->disableActions();


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
        $form->setAction(route('report_warehouses.storeDetail'));

        $form->display('id', __('ID'));
        $form->date('date', "Ngày về kho")->default(now());
        $form->text('title', "Ký hiệu");

        $form->html(function () {
            return view('admin.report-warehouse')->render();
        });

        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        // callback before save

        return $form;
    }

    public function storeDetail(Request $request) {
        $data = $request->all();

        unset($data['order'][0]);
        unset($data['weight'][0]);
        unset($data['lenght'][0]);
        unset($data['width'][0]);
        unset($data['height'][0]);
        unset($data['line'][0]);

        $size = sizeof($data['order']);

        for ($i = 1; $i <= $size; $i++) {
            $res = [
                'date'  =>  $data['date'],
                'order' =>  $data['order'][$i],
                'title' =>  $data['title'],
                'weight'    =>  $data['weight'][$i],
                'lenght'    =>  $data['lenght'][$i],
                'width'    =>  $data['width'][$i],
                'height'    =>  $data['height'][$i],
                'cublic_meter'    => number_format( ($data['lenght'][$i]*$data['width'][$i]*$data['height'][$i]) / 1000000, 4),
                'line'    =>  $data['line'][$i],
            ];

            ReportWarehouse::firstOrCreate($res);
        }

        admin_toastr('Lưu thành công', 'success');
        return redirect()->route('report_warehouses.index');
    }

    public function updateDetail($id, Request $request) {
        ReportWarehouse::find($request->pk)->update([
            $request->name  =>  $request->value
        ]);

        return response()->json([
            'status' =>  true,
            'message'   =>  'Lưu thành công'
        ]);

    }
}
