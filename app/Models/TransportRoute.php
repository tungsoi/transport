<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TransportRoute extends Model
{
    /**
     * Table name
     *
     * @var string
     */
    protected $table = 'transport_routes';

    /**
     * Fie
     *
     * @var array
     */
    protected $fillable = [
        'title'
    ];
}
