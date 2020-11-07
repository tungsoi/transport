<?php

namespace App\Admin\Controllers;

use App\Models\Aloorder\OrderItem;
use App\Models\Aloorder\PurchaseOrder;
use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Grid;

class VietNamReceivceController extends AdminController
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
        $this->title = 'Hà Nội Nhận';
        $this->description = 'Tạo mới';
    }

    /**
     * Build index view
     *
     * @param Content $content
     * @return void
     */
    public function index(Content $content)
    {
        return $content
        ->header($this->title)
        ->description($this->description)
        ->body(function (Row $row) {
            $row->column(12, function (Column $column) {
                $column->append((new Box('DANH SÁCH SẢN PHẨM', view('admin.orders.vietnam_receive')->render())));
            });

            $row->column(12, function (Column $column) {
                $column->append((new Box('DỮ LIỆU ALO ORDER', view('admin.orders.table_link_order_items'))));
            });
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    public function grid_bk()
    {
        $grid = new Grid(new OrderItem());
        $grid->model()->where('status', '!=', OrderItem::PRODUCT_NOT_IN_CART)->orderBy('created_at', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->where(function ($query) {
                    $orders = PurchaseOrder::where('order_number', 'like', "%{$this->input}%")->get()->pluck('id');
    
                    $query->whereIn('order_id', $orders);
                
                }, 'Mã đơn hàng');
                $filter->equal('customer_id', 'Mã khách hàng')->select(User::whereIsCustomer(1)->get()->pluck('symbol_name', 'id'));
            });
            $filter->column(1/2, function ($filter) {
                $filter->like('cn_code', 'Mã vận đơn');
                $filter->like('cn_order_number', 'Mã giao dịch');
            });
            
        });
        $grid->fixColumns(6);
        $grid->rows(function (Grid\Row $row) {
            $row->column('number', ($row->number+1));
        });
        $grid->column('number', 'STT');
        $grid->order()->order_number('Mã đơn hàng')->help('Mã đơn hàng mua hộ')->label('primary');
        $grid->id('Mã SP')->display(function () {
            return "SPMH-".str_pad($this->id, 5, 0, STR_PAD_LEFT);
        });
        $grid->column('customer_name', 'Mã khách hàng')->display(function () {
            return $this->customer->symbol_name ?? "";
        })->help('Mã khách hàng');
        $grid->status('Trạng thái')->display(function () {
            $html = "<span class='label label-".OrderItem::LABEL[$this->status]."'>".OrderItem::STATUS[$this->status]."</span>";
            $html .= "<br> <br>";
            $html .= '<b><a href="'.$this->product_link.'" target="_blank"> Link sản phẩm </a></b>';
            return $html;
        });
        $grid->created_at(trans('admin.created_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });
        $grid->column('product_image', 'Ảnh sản phẩm')->lightbox(['width' => 50, 'height' => 50]);
        $grid->product_size('Kích thước')->display(function () {
            return $this->product_size != "null" ? $this->product_size : null;
        })->editable();
        $grid->product_color('Màu')->editable();
        $grid->qty('Số lượng')->editable();
        $grid->qty_reality('Số lượng thực đặt')->editable();
        $grid->price('Giá (Tệ)')->editable();
        $grid->purchase_cn_transport_fee('VCND TQ (Tệ)')->display(function () {
            return $this->purchase_cn_transport_fee ?? 0;
        })->help('Phí vận chuyển nội địa Trung quốc')->editable();
        $grid->column('total_price', 'Tổng tiền (Tệ)')->display(function () {
            $totalPrice = ($this->qty_reality * $this->price) + $this->purchase_cn_transport_fee ;
            return number_format($totalPrice) ?? 0; 
        })->help('= Số lượng thực đặt x Giá (Tệ) + Phí vận chuyển nội địa (Tệ)');
        $grid->weight('Cân nặng (KG)')->help('Cân nặng lấy từ Alilogi')->editable();
        $grid->weight_date('Ngày vào KG')->help('Ngày vào cân sản phẩm ở Alilogi')->display(function () {
            return $this->weight_date != null ? date('Y-m-d', strtotime($this->weight_date)) : null;
        })->editable('date');
        $grid->cn_code('Mã vận đơn Alilogi')->editable();
        $grid->cn_order_number('Mã giao dịch')->editable();
        $grid->customer_note('Khách hàng ghi chú')->style('width: 100px')->editable();
        $grid->admin_note('Admin ghi chú')->editable();

        $grid->disableCreateButton();
        
        $grid->tools(function (Grid\Tools $tools) {
            // $tools->append(new Ordered());
            // $tools->append(new WarehouseVietnam());
            // $tools->batch(function ($batch) {
            //     $batch->disableDelete();
            // });
        });
        $grid->actions(function ($actions) {
            $actions->disableView();
            // $actions->disableEdit();
            $actions->disableDelete();
        });
        $grid->paginate(100);

        return $grid;
    }
}
