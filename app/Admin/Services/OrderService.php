<?php 

namespace App\Admin\Services;

use App\Models\TransportOrderItem;
use Encore\Admin\Facades\Admin;
use App\Customer\Services\OrderService as CustomerOrderService;
use App\User;

class OrderService 
{
    /**
     * Build data for handle china receive
     *
     * @param array $data
     * @return void
     */
    public function buildDataChinaReceive($data = []) {
        $data['warehouse_cn']           = 1;
        $data['warehouse_cn_date']      = now();
        $data['advance_drag']           = $data['advance_drag'] != "" ? str_replace(',', '', $data['advance_drag']) : 0;
        $data['kg']                     = str_replace(',', '.', $data['kg']);
        $data['user_id_updated']        = Admin::user()->id;
        $data['note']                   = 'TQ nhận';
        $data['volume']                 = TransportOrderItem::calculateVolume(
                                            $data['product_width'],
                                            $data['product_height'],
                                            $data['product_length']
                                        );
        $data['cublic_meter']           = TransportOrderItem::calculateCublicMeter(
                                            $data['product_width'],
                                            $data['product_height'],
                                            $data['product_length']
                                        );

        return $data;
    }

    public function buildDataVietnamReceive($data = []) {
        $customer = User::where('symbol_name', $data['customer_name'])->first();
        $flag = TransportOrderItem::where('cn_code', $data['cn_code'])->first();

        $data['warehouse_cn']           = 1;
        $data['warehouse_cn_date']      = $flag != null ? $flag->warehouse_cn_date : now();
        $data['advance_drag']           = $data['advance_drag'] != "" ? str_replace(',', '', $data['advance_drag']) : 0;
        $data['kg']                     = str_replace(',', '.', $data['kg']);
        $data['user_id_updated']        = Admin::user()->id;
        $data['note']                   = $data['note'] == 'TQ nhận' ? 'HN nhận' : $data['note'];
        $data['volume']                 = TransportOrderItem::calculateVolume(
                                            $data['product_width'],
                                            $data['product_height'],
                                            $data['product_length']
                                        );
        $data['cublic_meter']           = TransportOrderItem::calculateCublicMeter(
                                            $data['product_width'],
                                            $data['product_height'],
                                            $data['product_length']
                                        );
        $data['transport_customer_id']  =  $customer->id ?? null;
        $data['warehouse_vn']           =  1;
        $data['warehouse_vn_date']      =  now();
        $data['is_created']             =  $flag != null ? true : false;

        return $data;
    }

    /**
     * Build data to submit payment
     *
     * @param array $order
     * @return void
     */
    public function buildDataPayment($data = []) {
        return [
            'order_number'              =>  CustomerOrderService::generateOrderNR(),
            'order_type'                =>  2,
            'final_total_price'         =>  $data['total-money'] ?? null,
            'transport_kg'              =>  str_replace('.0', '', $data['count-kg']) ?? null,
            'transport_volume'          =>  $data['count-volumn'] ?? null,
            'transport_cublic_meter'    =>  $data['count-cublic-meter'] ?? null,
            'transport_advance_drag'    =>  isset($data['advan']) ? str_replace('.0', '', (float) $data['advan']) : 0,
            'user_created_id'           =>  Admin::user()->id,
            'internal_note'             =>  $data['internal_note'] ?? "Thanh toán",
            'user_created_name'         =>  Admin::user()->name ?? null,
            'discount_type'             =>  $data['discount_type'][0],
            'discount_value'            =>  $data['discount_kg'],
            'payment_customer_id'       =>  $data['payment_customer_id'],
            'transport_customer_id'     =>  TransportOrderItem::find($data['item_id'][0])->customer->id ?? null
        ];
    }

    public function getOrderItem($data = []) {
        $res = TransportOrderItem::where('cn_code', $data['cn_code'])->where('warehouse_cn', 1)->orderBy('id', 'desc');

        if ($res->count() > 0) {
            $data = isset($data['isPayment']) && $data['isPayment'] == 1
                    ? $res->where('warehouse_vn', 1)->where('is_payment', 0)
                    : $res->where('warehouse_vn', 0);
            $data = $data->first();
            if ($data) {
                $data->customer_name = $data->customer_name ?? "";
                $data->product_volumn = str_replace(',', '', str_replace('.00', '', $data->volume));
                $data->product_cublic_meter = str_replace(',', '', str_replace('.000', '', $data->cublic_meter));

                return $data;
            }

            return null;
        }
        
        return null;
    }

    /**
     * Check cn code is exits
     *
     * @param string $cn_code
     * @return boolean
     */
    public function isExitsCnCode($cn_code = "") {
        return TransportOrderItem::where('cn_code', $cn_code)->count() > 0 ? true : false;
    }

    public function buildDataItemPaymentUpdate($key = "", $data = []) {
        $data['sum_cublic_meter'] = !is_null($data['sum_cublic_meter']) ? $data['sum_cublic_meter'] : 0;
        $data['sum_volumn'] = !is_null($data['sum_volumn']) ? $data['sum_volumn'] : 0;
        $data['sum_kg'] = !is_null($data['sum_kg']) ? $data['sum_kg'] : 0;

        switch ($data['payment_type'][$key])
        {
            case -1: #m3
                $price_service = str_replace(',', '', $data['sum_cublic_meter']) ?? null;
                $total_price = (int) $price_service * $data['product_cublic_meter'][$key];
                break;
            case 0: #v
                $price_service = str_replace(',', '', $data['sum_volumn']) ?? null;
                $total_price = (int) $price_service * $data['product_volumn'][$key];
                break;
            case 1: #kg
                $price_service = str_replace(',', '', $data['sum_kg']) ?? null;
                $total_price = (int) $price_service * $data['kg'][$key];
                break;
        }

        return [
            'price_service'     =>  $price_service,
            'kg'                =>  $data['kg'][$key] ?? 0,
            'volume'            =>  str_replace('.00', '', $data['product_volumn'][$key]) ?? 0,
            'advance_drag'      =>  str_replace(',', '', $data['advance_drag'][$key]) ?? 0,
            'total_price'       =>  $total_price,
            'product_width'     =>  $data['product_width'][$key] ?? 0,
            'product_height'    =>  $data['product_height'][$key] ?? 0,
            'product_length'    =>  $data['product_length'][$key] ?? 0,
            'is_payment'        =>  1,
            'user_id_updated'   =>  Admin::user()->id,
            'payment_type'      =>  $data['payment_type'][$key],
            'cublic_meter'      =>  str_replace('.000', '', $data['product_cublic_meter'][$key]) ?? 0
        ];
    }
}