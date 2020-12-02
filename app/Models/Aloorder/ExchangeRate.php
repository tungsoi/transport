<?php

namespace App\Models\Aloorder;

use Encore\Admin\Traits\AdminBuilder;
use Illuminate\Database\Eloquent\Model;

class ExchangeRate extends Model
{
    use AdminBuilder;

    protected $connection = 'aloorder';
    
    /**
     * Table name
     *
     * @var string
     */
    protected $table = "exchange_rates";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = [
        'vnd',
        'ndt'
    ];
}
