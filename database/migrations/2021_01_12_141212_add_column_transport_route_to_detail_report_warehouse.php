<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnTransportRouteToDetailReportWarehouse extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('report_warehouses', function (Blueprint $table) {
            if (! Schema::hasColumn('report_warehouses', 'transport_route')) {
                $table->integer('transport_route')->nullable();
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
            //
        });
    }
}
