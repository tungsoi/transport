<?php

use App\Admin\Services\PurchaseOrderService;
use App\Models\Aloorder\OrderItem;
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