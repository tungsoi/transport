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
    // DB::beginTransaction();
    if ($request->ajax()) {
        try {
            $item_id = $request->item_id;

            $item = OrderItem::find($item_id);
            $item->status = OrderItem::STATUS_PURCHASE_WAREHOUSE_VN;
            $item->save();

            $order = PurchaseOrder::find($item->order_id);

            if ($order->totalWarehouseVietnamItems() == $order->sumQtyRealityItem() && $order->status != PurchaseOrder::STATUS_SUCCESS) {
                $order->status = PurchaseOrder::STATUS_SUCCESS;
                $order->save();

                $deposited = $order->deposited; // số tiền đã cọc
            $total_final_price = $order->totalBill() * $order->current_rate; // tổng tiền đơn hiện tại

            $customer = User::find($order->customer_id);
                $wallet = $customer->wallet;
                if ($deposited <= $total_final_price) {
                    # Đã cọc < tổng đơn -> còn lại : tổng đơn - đã cọc
                    # -> trừ tiền của khách số còn lại

                    $owed = $total_final_price - $deposited;
                    $customer->wallet = $wallet - $owed;
                    $customer->save();
                } else {

                # Đã cọc > tổng đơn
                    # -> còn lại: đã cọc - tổng đơn
                    # -> cộng lại trả khách

                    $owed = $deposited - $total_final_price;
                    $customer->wallet = $wallet + $owed;
                    $customer->save();
                }

                TransportRecharge::create([
                'customer_id'       =>  $order->customer_id,
                'user_id_created'   =>  1,
                'money'             =>  $owed,
                'type_recharge'     =>  TransportRecharge::PAYMENT_ORDER,
                'content'           =>  'Thanh toán đơn hàng mua hộ. Mã đơn hàng '.$order->order_number,
                'order_type'        =>  TransportRecharge::TYPE_ORDER
            ]);
            }

            // DB::commit();
    
            return response()->json([
            'error' =>  false
        ]);
        } catch (\Exception $e) {
            // DB::rollBack();

            return response()->json([
            'error' =>  true,
            'msg'   =>  $e->getMessage()
        ]);
        }
    }
    
});