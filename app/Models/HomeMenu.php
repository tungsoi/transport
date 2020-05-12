<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HomeMenu extends Model
{
    /**
     * Table name
     *
     * @var string
     */
    protected $table = "home_menus";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = ['title', 'order'];
}
