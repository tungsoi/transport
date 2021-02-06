<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnWarehouseIdToTransportOrderItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('transport_order_items', function (Blueprint $table) {
            if (! Schema::hasColumn('transport_order_items', 'ware_house_id')) {
                $table->integer('ware_house_id')->nullable();
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
        Schema::table('transport_order_items', function (Blueprint $table) {
            if (Schema::hasColumn('transport_order_items', 'ware_house_id')) {
                $table->dropColumn('ware_house_id');
            }
        });
    }
}
