<?php

namespace App\Admin\Controllers\Report;

use App\Models\Warehouse;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\User;
use App\Admin\Actions\Customer\Recharge;
use App\Admin\Actions\Customer\RechargeHistory;
use App\Admin\Actions\Customer\OrderHistory;
use App\Admin\Actions\Customer\OrderPayment;
use App\Models\RongDoUser;
use App\Models\TransportOrderItem;
use App\Models\TransportRecharge;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CustomerController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;

    public function __construct()
    {
        $this->title = 'Thống kê chi tiết khách hàng';
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User);
        $grid->model()->where('is_customer', 1)->orderBy('id', 'desc');

        $grid->filter(function($filter) {
            $filter->expand();
            $filter->disableIdFilter();
            $filter->like('name', 'Họ và tên');
            $filter->like('symbol_name', 'Mã khách hàng');
            $filter->like('email');
            $filter->like('phone_number', 'SDT');
            $filter->equal('ware_house_id', 'Kho')->select(Warehouse::where('is_active', 1)->get()->pluck('name', 'id'));
        });

        $grid->header(function ($query) {

            $owed = $query->where('wallet' , '<', 0)->sum('wallet');
            $color = $owed > 0 ? 'green' : 'red';

            return '<h4>Công nợ khách hàng hiện tại: <span style="color:'.$color.'">'. number_format($owed) ."</span> (VND)</h4>";
        });

        $grid->rows(function (Grid\Row $row) {
            $row->column('number', ($row->number+1));
        });
        $grid->column('number', 'STT');

        $grid->name('Họ và tên');
        $grid->symbol_name('Mã khách hàng');
        $grid->email();
        $grid->phone_number('SDT');
        $grid->ware_house_id('Kho')->display(function () {
            return $this->warehouse->name ?? "";
        });
        $grid->wallet('Số dư ví (VND)')->display(function () {
            if ($this->wallet > 0) {
                return '<span class="label label-success">'.number_format($this->wallet) ?? "0".'</span>';
            }

            return '<span class="label label-danger">'.number_format($this->wallet).'</span>';
        });
        
        $grid->sumKg('Tổng cân')->display(function () {
            return $this->getSumWeightByCustomerSymbolName($this->symbol_name);
        });
        $grid->sumCublicMeter('Tổng khối')->display(function () {
            return $this->getSumCublicMeterByCustomerSymbolName($this->symbol_name);
        });
        $grid->sumMoneyPayment('Tổng tiền đã thanh toán (VND)')->display(function () {
            return number_format($this->getSumMoneyPayment($this->symbol_name)) ?? "";
        });
        $grid->sumMoneyRecharge('Tổng tiền đã nạp (VND)')->display(function () {
            $recharge_money = TransportRecharge::where('customer_id', $this->id)->where('type_recharge', TransportRecharge::RECHARGE_MONEY)->sum('money');
            $recharge_bank = TransportRecharge::where('customer_id', $this->id)->where('type_recharge', TransportRecharge::RECHARGE_BANK)->sum('money');

            return "Tiền mặt: " . "<b>".number_format($recharge_money)."</b>" 
            . "<br>" ."Chuyển khoản: " . "<b>".number_format($recharge_bank)."</b>"
            . "<br>" ."Tổng cộng: " . "<b>".number_format($recharge_bank + $recharge_money)."</b>" ;
        });
        $grid->actions(function ($actions) {
            $actions->add(new Recharge($this->row->id));
            $actions->add(new RechargeHistory($this->row->id));
            $actions->add(new OrderHistory($this->row->id));
            $actions->add(new OrderPayment($this->row->id));

            $actions->disableDelete();
        });
        $grid->paginate(20);

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
        $show = new Show(User::findOrFail($id));

        $show->id('ID');
        $show->name('Họ và tên');
        $show->email();
        $show->phone_number('SDT');
        $show->ware_house_id('Kho')->as(function () {
            return $this->warehouse->name ?? "";
        });
        $show->wallet('Số dư ví (VND)')->as(function () {
            return number_format($this->wallet);
        });
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
        $form = new Form(new User);
        $form->text('name', 'Họ và tên')->rules('required');
        $form->text('email')->rules('required');
        $form->text('phone_number', 'SDT')->rules('required');
        $form->select('ware_house_id', 'Kho')->options(Warehouse::where('is_active', 1)->get()->pluck('name', 'id'))->rules('required');
        $form->text('address', 'Địa chỉ');
        $form->select('is_active', 'Trạng thái')->options(User::STATUS)->default(1)->rules('required');

        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        return $form;
    }

    public function rechargeForm($id) {
        $form = new Form(new TransportRecharge);
        $user = User::find($id);

        $form->setAction(route('customers.rechargeStore'));
        $form->divider('Thông tin khách hàng');
        $form->display('name', 'Họ và tên')->default($user->name);
        $form->display('email', 'Email')->default($user->email);
        $form->display('phone_number', 'Số điện thoại')->default($user->phone_number);
        $form->display('wallet', 'Số dư hiện tại')->default(number_format($user->wallet));
        $form->divider('Nạp tiền');
        $form->currency('money', 'Số tiền cần nạp')->rules('required')->symbol('VND')->default(0)->digits(0);
        $form->select('type_recharge', 'Loại hành động')->options(TransportRecharge::RECHARGE)->default(1)->rules('required')
        ->help('Trường hợp Hoàn tiền hoặc trừ tiền, yêu cầu ghi rõ nội dung: Lý do, Đơn hàng, ...');
        $form->textarea('content', 'Nội dung')->default('Nạp tiền vào ví khách hàng thông qua hình thức chuyển khoản.');
        $form->hidden('user_id_created')->default(Admin::user()->id);
        $form->hidden('customer_id')->default($id);
        $form->disableEditingCheck();
        $form->disableCreatingCheck();
        $form->disableViewCheck();

        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
            $tools->disableList();
            $tools->append('<a href="'.route('customers.index').'" class="btn btn-sm btn-default" title="Danh sách">
                <i class="fa fa-list"></i>
                <span class="hidden-xs">&nbsp;Danh sách</span>
            </a>');
        });
        
        return $form;
    }

    public function recharge($id, Content $content)
    {
        return $content
            ->header($this->title)
            ->description('Nạp tiền')
            ->body($this->rechargeForm($id));
    }

    public function rechargeStore(Request $request) {
        DB::beginTransaction();
        try {
            $data = $request->all();
            TransportRecharge::create($data);

            $customer = User::find($data['customer_id']);
            $wallet = $customer->wallet;
            switch ($data['type_recharge']) {
                case TransportRecharge::DEDUCTION:
                    $customer->wallet = (int) $wallet - (int) $data['money'];
                    $customer->save();
                    break;
                default:
                    $customer->wallet = (int) $wallet + (int) $data['money'];
                    $customer->save();
                    break;
            }

            DB::commit();
            admin_success(TransportRecharge::RECHARGE[$data['type_recharge']], 'Số tiền: '.number_format($data['money'])." - Khách hàng: ".$customer->name." - Số dư ví sau giao dịch: ".number_format($customer->wallet)) ." (VND)";
        } catch (\Exception $e) {
            DB::rollBack();
            admin_error('Nạp tiền không thành công', $e->getMessage());
        }

        return redirect()->route('customers.index');
    }

    public function rechargeHistory($id, Content $content)
    {
        return $content
            ->header($this->title)
            ->description('Lịch sử giao dịch')
            ->body($this->rechargeHistoryGrid($id));
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function rechargeHistoryGrid($id)
    {
        $grid = new Grid(new TransportRecharge);
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
