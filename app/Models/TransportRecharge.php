<?php

namespace App\Models;

use Encore\Admin\Traits\AdminBuilder;
use Illuminate\Database\Eloquent\Model;

class TransportRecharge extends Model
{
    use AdminBuilder;
    
    /**
     * Table name
     *
     * @var string
     */
    protected $table = "transport_recharges";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = [
        'customer_id',
        'user_id_created',
        'money',
        'type_recharge',
        'content'
    ];

    const RECHARGE = [
        self::RECHARGE_MONEY    =>  'Nạp tiền mặt',
        self::RECHARGE_BANK     =>  'Nạp tiền chuyển khoản',
        self::REFUND        =>  'Hoàn tiền',
        self::DEDUCTION     =>  'Trừ tiền',
    ];

    const REFUND = 2;
    const DEDUCTION = 3;
    const RECHARGE_MONEY = 0;
    const RECHARGE_BANK = 1;
    const PAYMENT = 4;
    const RECHARGE_PAYMENT = 'Thanh toán đơn hàng';

    public function customer() {
        return $this->hasOne('App\User', 'id', 'customer_id');
    }


    public function userCreated() {
        return $this->hasOne('App\User', 'id', 'user_id_created');
    }

}
