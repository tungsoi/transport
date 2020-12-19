<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ReportWarehouse extends Model
{
    /**
     * Table name
     *
     * @var string
     */
    protected $table = "report_warehouses";

    /**
     * Fields
     *
     * @var array
     */
    protected $fillable = [
        'date',
        'order',
        'title',
        'weight',
        'lenght',
        'width',
        'height',
        'cublic_meter',
        'line',
    ];

    public function details() {
        return $this->hasMany('App\Models\ReportWarehouse', 'id', 'id');
    }
}
