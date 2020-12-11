<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReportWarehousePortalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('report_warehouse_portals', function (Blueprint $table) {
            $table->increments('id');
            $table->string('date')->nullable()->comment('Ngày đầu về kho');
            $table->string('title')->nullable()->comment('Ký hiệu');
            $table->string('count')->nullable()->comment('Thực nhận');
            $table->string('weight')->nullable()->comment('Tổng cân');
            $table->string('cublic_meter')->nullable()->comment('Tổng khối');
            $table->string('offer_weight')->nullable();
            $table->string('offer_cublic_meter')->nullable();
            $table->string('line')->nullable();
            $table->string('note')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('report_warehouse_portals');
    }
}
