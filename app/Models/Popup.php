<?php

namespace App\Models;

use Encore\Admin\Traits\AdminBuilder;
use Illuminate\Database\Eloquent\Model;

class Popup extends Model
{
    use AdminBuilder;
    
    /**
     * Table name
     *
     * @var string
     */
    protected $table = "popups";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'content'
    ];
}
