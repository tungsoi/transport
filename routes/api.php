<?php

use App\Admin\Services\PurchaseOrderService;
use App\Models\Aloorder\OrderItem;
use App\Models\Aloorder\PurchaseOrder;
use App\Models\TransportRecharge;
use App\User;
use Encore\Admin\Facades\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/search-order-item', function (Request $request) {
    $cn_code = $request->cn_code;
    $service = new PurchaseOrderService();
    $items = $service->searchPurchaseOrderItem($cn_code);

    return view('admin.orders.row-data', compact('items'))->render();
});

Route::post('/confirm-receive-vietnam', function (Request $request) {
    DB::beginTransaction();
    try {
        $item_id = $request->item_id;

        $item = OrderItem::find($item_id);
        $item->status = OrderItem::STATUS_PURCHASE_WAREHOUSE_VN;
        $item->save();

        $order = PurchaseOrder::find($item->order_id);
        if ($order->warehouseVietnamItems() == $order->totalItems()) {
            $order->status = PurchaseOrder::STATUS_SUCCESS;
            $order->save();

            $deposited = $order->deposited;
            $total_final_price = $order->final_total_price;

            $owed = $total_final_price - $deposited;

            $customer = User::find($order->customer_id);
            $wallet = $customer->wallet;
            $customer->wallet = $wallet - $owed;
            $customer->save();

            TransportRecharge::create([
                'customer_id'       =>  $order->customer_id,
                'user_id_created'   =>  Admin::user()->id,
                'money' =>  $owed > 0 ? $owed : -($owed),
                'type_recharge' =>  TransportRecharge::PAYMENT_ORDER,
                'content'   =>  'Thanh toán đơn hàng mua hộ. Mã đơn hàng '.$order->order_number.". Số tiền " . number_format($owed),
                'order_type'    =>  TransportRecharge::TYPE_ORDER
            ]);
        }

        DB::commit();
    
        return response()->json([
            'error' =>  false
        ]);
    } catch (\Exception $e) {
        DB::rollBack();

        return response()->json([
            'error' =>  true,
            'msg'   =>  $e->getMessage()
        ]);
    }
    
});