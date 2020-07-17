<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    /**
     * Table name
     *
     * @var string
     */
    protected $table = "orders";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = [
        'order_number',
        'customer_id',
        'supporter_id',
        'transport_receive_type',
        'purchase_cn_transport_code',
        'purchase_vn_transport_code',
        'purchase_total_items_price',
        'status',
        'confirm_date',
        'purchase_service_fee',
        'purchase_cn_transport_fee',
        'purchase_vn_transport_fee',
        'final_total_price',
        'min_deposit',
        'deposited',
        'admin_note',
        'order_type',
        'shop_name',
        'purchase_cn_to_vn_fee',
        'is_discounted',
        'customer_note',
        'surcharge',  // phụ phí
        'warehouse_id',
        'is_count',
        'is_close_wood',
        'transport_price_service',
        'transport_kg',
        'transport_volume',
        'transport_pay_type',
        'transport_advance_drag',
        'transport_vn_code',
        'support_warehouse_id',
        'supporter_order_id',
        'price_weight',
        'current_rate',
        'order_at',
        'to_vn_at',
        'transport_size_product',
        'price_negotiate',
        'transport_cublic_meter',
        'deposit_default',
        'purchase_service_fee_percent',
        'user_created_id',
        'deposited_at',
        'internal_note',
        'user_created_name',
        'customer_name',
        'discount_value',
        'discount_method',
        'discount_type',
        'success_at'
    ];

    public function items() {
        return $this->hasMany('App\Models\TransportOrderItem', 'order_id', 'id');
    }

    public function paymentTypeText($order) {
        $item = $order->items->first();
        switch ($item->payment_type)
        {
            case self::KG:
                return self::KG_TEXT;
            case self::V:
                return self::V_TEXT;
            case self::M3:
                return self::M3_TEXT;
        }
    }

    public static function getPriceService($order) {
        return $order->items->first()->price_service ? $order->items->first()->price_service : "";
    }

    const KG = 1;
    const V = 0;
    const M3 = -1;
    const KG_TEXT = 'Khối lượng';
    const V_TEXT = 'Thể tích';
    const M3_TEXT = 'Mét khối';

    public function getSumKg() {
        return number_format($this->items->where('payment_type', self::KG)->sum('kg'), 2);
    }

    public function getSumKgDiscount() {
        return $this->discount_type == 1 ?  (- (int) $this->discount_value) : (int) $this->discount_value;
    }

    public function getSumKgAfterDiscount() {
        return number_format($this->getSumKg() + $this->getSumKgDiscount(), 2);
    }

    public function getSumVolume() {
        return number_format($this->items->where('payment_type', self::V)->sum('volume'), 2);
    }

    public function getSumCublicMeter() {
        return number_format($this->items->where('payment_type', self::M3)->sum('cublic_meter'), 3);
    }

    public function userCreated() {
        return $this->hasOne('App\User', 'id', 'user_created_id');
    }

    public function getSumItemAdvanceDrag() {
        return number_format($this->items->sum('advance_drag'), 2);
    }

    public function getTotalPriceOrder() {
        $priceKg = $this->items->where('payment_type', self::KG)->first();
        $totalKg = $priceKg ? $priceKg->price_service * $this->getSumKg() : 0;


        $priceV = $this->items->where('payment_type', self::V)->first();
        $totalV = $priceV ? $priceV->price_service * $this->getSumVolume() : 0;


        $priceM3 = $this->items->where('payment_type', self::M3)->first();
        $totalM3 = $priceM3 ? $priceM3->price_service * $this->getSumCublicMeter() : 0;

        return (int) ($totalKg + $totalV + $totalM3);
    }

    public function getDetailSumKg() {
        return $this->getSumKgDiscount() > 0 ? (" + " . $this->getSumKgDiscount()) : $this->getSumKgDiscount();
    }

    public function getDetailMoneySumKg() {
        return number_format($this->getSumKg() * $this->items->first()->price_service)." + ".number_format($this->getSumKgDiscount() * $this->items->first()->price_service);
    }
}
