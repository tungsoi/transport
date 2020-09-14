<?php

namespace App\Customer\Controllers;

use App\Customer\Services\OrderService;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Http\Controllers\Controller;
use App\Models\Popup;
use App\Models\TransportOrderItem;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;

    public function __construct()
    {
        $this->title = trans('admin.menu_titles.name');
    }

    public function index(Request $request) {
        $service = new OrderService;
        $orderItem = $service->search($request->all());
        $popup = Popup::first();
        return view('customer.index', compact('orderItem', 'popup'));
    }  

     /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new TransportOrderItem());
        
        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->like('title', trans('admin.title'));
        });

        $grid->id(trans('admin.id'));
        $grid->created_at(trans('admin.created_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->created_at));
        });
        $grid->updated_at(trans('admin.updated_at'))->display(function () {
            return date('H:i | d-m-Y', strtotime($this->updated_at));
        });

        return $grid;
    }
}
