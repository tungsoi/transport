<?php

namespace App\Admin\Actions\Customer;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class OrderHistory extends RowAction
{   
    /**
     * Public name actions
     *
     * @var string
     */
    public $name = 'Danh sách đơn hàng';

    /**
     * Customer id
     *
     * @var [type]
     */
    protected $customer_id;

    /**
     * Constructator
     *
     * @param [type] $customer_id
     */
    public function __construct($customer_id)
    {
        $this->customer_id = $customer_id;
    }

    /**
     * Href of this actions
     *
     * @return void
     */
    public function href()
    {
        return route('customers.orderHistory', $this->customer_id);
    }

}