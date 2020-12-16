<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\TransportOrderItem;
use App\User;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Callout;
use Encore\Admin\Widgets\InfoBox;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Grid;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        try {
            return $content
            ->header('Bảng điều khiển')
            ->description('...')
            ->row(function (Row $row) {
                $words = 'Hệ thống đang trong quá trình triển khai và nâng cấp tính năng, mọi yêu cầu hoặc đóng góp ý kiến vui lòng gửi về địa chỉ hòm thư: thanhtung.atptit@gmail.com<br>Số điện thoại IT support: 0345.513.889';
                $row->column(12, function (Column $column) use ($words) {
                    $column->append((new Callout($words))->style('success'));
                });
            })
            ->row(function (Row $row) {
                if (Admin::user()->isRole('administrator')) {
                    $row->column(3, new InfoBox('Quản trị viên', 'users', 'aqua', 'admin/auth/users', User::where('is_customer', 0)->count()));
                    $row->column(3, new InfoBox('Khách hàng', 'book', 'green', '/admin/customers', User::where('is_customer', 1)->count()));
                    $row->column(3, new InfoBox('Mã vận đơn', 'tag', 'yellow', '/admin/transport_order_items', TransportOrderItem::all()->count()));
                    $row->column(3, new InfoBox('Đơn hàng', 'file', 'red', '/admin/transport_orders', Order::all()->count()));
                } else {
                    $row->column(12, function (Column $column) {
                        $column->append($this->grid()->render());
                    });
                }
            });
        }
        catch (\Exception $e) {
            dd($e->getMessage());
        }
       
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
        if (! isset($_GET['cn_code'])) {
            $grid->model()->where('cn_code', '0');
        }

        $grid->disableTools();
        $grid->disableExport();
        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->like('cn_code', 'Mã vận đơn');
                $filter->like('customer_name', 'Mã KH');
            });
            $filter->column(1/2, function ($filter) {
                $filter->between('warehouse_cn_date', 'Ngày về TQ')->date();
                $filter->between('warehouse_vn_date', 'Ngày về HN')->date();
            });
        });
        $grid->disableBatchActions();
        $grid->rows(function (Grid\Row $row) {
            $row->column('number', ($row->number+1));
        });
        $grid->column('number', 'STT');
        $grid->cn_code('Mã vận đơn');
        $grid->transport_customer_id('Mã khách hàng')->display(function () {
            $check_row = false;
            if ($this->warehouse_cn == 1 && $this->warehouse_vn == 1 && $this->is_payment == 0) {
                $check_row = true; // chua thanh toan ha noi nhan
            }
            $input = "<input type='hidden' class='flag' value='".$check_row."' data-item-id='".$this->id."'/>";
            if ($this->transport_customer_id == "") {
                return $this->customer_name.$input;
            }
            return $this->customer->symbol_name.$input ?? "";
        });
        $grid->kg('Cân nặng');
        $grid->product_length('Chiều dài (Cm)');
        $grid->product_width('Chiều rộng (Cm)');
        $grid->product_height('Chiều cao (Cm)');
        $grid->advance_drag('Tiền ứng kéo (Tệ)');
        $grid->warehouse_cn_date('Ngày về TQ')->display(function () {
            if ($this->warehouse_cn_date != "") {
                return "<span class='label label-success'> Đã về kho </span>" . "<br> <p>" .date('H:i | d-m-Y', strtotime($this->warehouse_cn_date))."</p>";
            }
            return "<span class='label label-warning'>Chưa về kho</span>";
        });
        $grid->warehouse_vn_date('Ngày về VN')->display(function () {
            if ($this->warehouse_vn_date != "") {
                return "<span class='label label-success'> Đã về kho </span>" . "<br> <p>" .date('H:i | d-m-Y', strtotime($this->warehouse_vn_date))."</p>";
            }
            return "<span class='label label-warning'>Chưa về kho</span>";
        });
        $grid->is_payment('Xuất kho')->display(function () {
            if ($this->is_payment == 1) {
                return "<span class='label label-success'> Đã xuất kho </span>" . "<br> <p>" .date('H:i | d-m-Y', strtotime(Order::find($this->order_id)->created_at))."</p>";
            }
            return "<span class='label label-warning'>Chưa xuất kho</span>";
        });
        $grid->paginate(100);
        $grid->disableCreateButton();
        $grid->disableActions();
        $grid->tools(function (Grid\Tools $tools) {
            $tools->append('<a id="btn-payment-code" class="btn btn-sm btn-danger" title="Thanh toán">
                <i class="fa fa-dollar"></i>
                <span class="hidden-xs">&nbsp;Thanh toán</span>
            </a>');
        });
        return $grid;
    }
}
