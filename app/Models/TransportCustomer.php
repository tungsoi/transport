<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TransportCustomer extends Model
{
    /**
     * Table name
     *
     * @var string
     */
    protected $table = "transport_customers";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = ['name'];
}
