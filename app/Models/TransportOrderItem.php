<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Traits\AdminBuilder;
use Illuminate\Database\Eloquent\Model;

class TransportOrderItem extends Model
{   
    use AdminBuilder;

    /**
     * Table name
     *
     * @var string
     */
    protected $table = "transport_order_items";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = [
        'order_id',
        'cn_code',
        'price_service',
        'kg',
        'volume',
        'advance_drag',
        'total_price',
        'warehouse_cn',
        'warehouse_cn_date',
        'warehouse_vn',
        'warehouse_vn_date',
        'transporting_vn',
        'transporting_vn_date',
        'size_product',
        'product_width',
        'product_height',
        'product_length',
        'transport_customer_id',
        'is_payment',
        'user_id_updated',
        'payment_type',
        'cublic_meter',
        'note',
        'payment_date'
    ];

    public function customer() {
        return $this->hasOne('App\Models\TransportCustomer', 'id', 'transport_customer_id');
    }

    public function userUpdated() {
        return $this->hasOne('App\User', 'id', 'user_id_updated');
    }

    const STATUS = [
        0   =>  'Đã thanh toán',
        1   =>  'Chưa thanh toán Hà Nội nhận',
        2   =>  'Trung Quốc nhận',
        3   =>  'Hà Nội nhận'
    ];

    public function paymentTypeText() {
        switch ($this->payment_type)
        {
            case self::KG:
                return self::KG_TEXT;
            case self::V:
                return self::V_TEXT;
            case self::M3:
                return self::M3_TEXT;
        }
    }

    const KG = 1;
    const V = 0;
    const M3 = -1;
    const KG_TEXT = 'Khối lượng';
    const V_TEXT = 'Thể tích';
    const M3_TEXT = 'Mét khối';

    public function order() {
        return $this->hasOne('App\Models\Order', 'id', 'order_id');
    }
}
