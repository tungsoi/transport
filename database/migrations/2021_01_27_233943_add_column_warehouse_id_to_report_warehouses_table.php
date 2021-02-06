<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnWarehouseIdToReportWarehousesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('report_warehouses', function (Blueprint $table) {
            if (! Schema::hasColumn('report_warehouses', 'warehouse_id')) {
                $table->integer('warehouse_id')->nullable();
            }
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('report_warehouses', function (Blueprint $table) {
            if (Schema::hasColumn('report_warehouses', 'warehouse_id')) {
                $table->dropColumn('warehouse_id');
            }
        });
    }
}
