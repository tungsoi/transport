<?php

namespace App\Admin\Services;

use App\Models\Aloorder\OrderItem;
use App\User;

class PurchaseOrderService
{
    /**
     * Undocumented function
     *
     * @param string $cnCode
     * @return object
     */
    public function searchPurchaseOrderItem(string $cnCode = "")
    {
        # code...
        $res = OrderItem::where('cn_code', 'like', '%'.$cnCode.'%')->whereStatus(OrderItem::STATUS_PURCHASE_ITEM_ORDERED)->get();
        $data = [];

        if ($res->count() > 0) {
            foreach ($res as $item) {
                $data[] = [
                    'key'    =>  $item->id,
                    'order_number'  =>  $item->order->order_number,
                    'symbol_name'   =>  User::find($item->order->customer_id)->symbol_name,
                    'status'    =>  $item->status,
                    'created_at'    =>  date('H:i | d-m-Y', strtotime($item->created_at)),
                    'product_link'  =>  $item->product_link,
                    'product_image' =>  $item->product_image,
                    'product_size'  =>  $item->product_size,
                    'product_color' =>  $item->product_color,
                    'qty'   =>  $item->qty,
                    'qty_reality'   =>  $item->qty_reality,
                    'price' =>  number_format($item->price),
                    'purchase_cn_transport_fee' =>  number_format($item->purchase_cn_transport_fee),
                    'total_price'   =>  number_format(($item->qty_reality * $item->price) + $item->purchase_cn_transport_fee),
                    'weight'    =>  $item->weight,
                    'weight_date'   =>  $item->weight_date != null ? date('Y-m-d', strtotime($item->weight_date)) : null,
                    'cn_code'   =>  $item->cn_code,
                    'cn_order_number'   =>  $item->cn_order_number,
                    'customer_note' =>  $item->customer_note,
                    'admin_note'    =>  $item->admin_note
                ];
            }
        }

        return $data;
    }
}