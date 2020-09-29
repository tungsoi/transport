<?php

namespace App\Customer\Services;

use App\Models\TransportOrderItem;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class OrderService {

    /**
     * Function search cn code in home page of customer
     *
     * @param array $data
     * @return array
     */
    public function search($data = [])
    {
        $data['cn_code'] = isset($data['cn_code']) ? $data['cn_code'] : null;
        $data['username'] = isset($data['username']) ? $data['username'] : null;

        if ($data['cn_code'] == "" && $data['username'] == "") { return []; }
        else {
            $result = TransportOrderItem::where('cn_code', 'like', "%".$data['cn_code']."%")
                    ->where('customer_name', 'like', "%".$data['username']."%");

            if ($data['warehouse_cn_date_begin'] != null) {
                $data['warehouse_cn_date_begin'] = date('Y-m-d 00:00:00', strtotime($data['warehouse_cn_date_begin']));
                $result->where('warehouse_cn_date', '>=', $data['warehouse_cn_date_begin']);
            }

            if ($data['warehouse_cn_date_finish'] != null) {
                $data['warehouse_cn_date_finish'] = date('Y-m-d 00:00:00', strtotime($data['warehouse_cn_date_finish']));
                $result->where('warehouse_cn_date', '<=', $data['warehouse_cn_date_finish']);
            }

            if ($data['warehouse_vn_date_begin'] != null) {
                $data['warehouse_vn_date_begin'] = date('Y-m-d 00:00:00', strtotime($data['warehouse_vn_date_begin']));
                $result->where('warehouse_vn_date', '>=', $data['warehouse_vn_date_begin']);
            }

            if ($data['warehouse_vn_date_finish'] != null) {
                $data['warehouse_vn_date_finish'] = date('Y-m-d 00:00:00', strtotime($data['warehouse_vn_date_finish']));
                $result->where('warehouse_vn_date', '<=', $data['warehouse_vn_date_finish']);
            }

            return $result->orderBy('is_payment', 'desc')->orderBy('created_at', 'asc')->get();
        }
    }

    /**
     * Sub query cncode and username
     *
     * @param [type] $query
     * @param [type] $data
     * @param [type] $column
     * @return query
     */
    protected function subWhereCnCodeAndUserName($query, $data, $column)
    {
        if (!empty($data['start_date'])) {
            $query->whereDate($column, '>=', Carbon::parse($data['start_date'])->startOfDay());
        }
        if (!empty($data['end_date'])) {
            $query->whereDate($column, '<=', Carbon::parse($data['end_date'])->endOfDay());
        }
        if (!empty($data['cn_code'])) {
            $query->where('cn_code', 'LIKE', '%' . $data['cn_code'] . '%');
        }
        if (!empty($data['username'])) {
            $query->where('admin_users.symbol_name', 'like', '%'.$data['username'].'%');
        }
    }

    /**
     * Generate order number
     * @return string
     */
    public static function generateOrderNR()
    {
        $letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y', 'W', 'J', 'Z'];
        $orderObj = DB::table('orders')->whereRaw('LENGTH(order_number) < 7')->select('order_number')->latest('id')->first();
        if ($orderObj) {
            $orderNumber = $orderObj->order_number;
            $firstOrderNumber = $orderNumber[0];
            $removed1char = substr($orderNumber, 1);
            $generateOrder_nr = str_pad((string)($removed1char + 1), 4, "0", STR_PAD_LEFT);
            $key = array_search($firstOrderNumber, $letters);
            if ((int)$removed1char === 9999) {
                $key++;
                $generateOrder_nr = str_pad('1', 4, "0", STR_PAD_LEFT);
            }
            $generateOrder_nr = $letters[$key] . $generateOrder_nr;
        } else {
            $generateOrder_nr = 'A' . str_pad('1', 4, "0", STR_PAD_LEFT);
        }
        return $generateOrder_nr;
    }
}