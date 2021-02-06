<?php

namespace App\Models;

use Encore\Admin\Traits\AdminBuilder;
use Illuminate\Database\Eloquent\Model;

class ReportWarehouse extends Model
{
    use AdminBuilder;
    
    const LINE = [
        'BAO',
        'KIỆN'
    ];
    
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
        'transport_route',
        'warehouse_id'
    ];

    public function details() {
        return $this->hasMany('App\Models\ReportWarehouse', 'id', 'id');
    }

    public function transportRoute() {
        return $this->hasMany('App\Models\TransportRoute', 'id', 'transport_route');
    }

    public function warehouse() {
        return $this->hasOne('App\Models\Warehouse', 'id', 'warehouse_id');
    }
}
