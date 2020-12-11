<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReportWarehousesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('report_warehouses', function (Blueprint $table) {
            $table->increments('id');
            $table->string('date')->nullable();
            $table->string('order')->nullable();
            $table->string('title')->nullable();
            $table->string('weight')->nullable();
            $table->string('lenght')->nullable();
            $table->string('width')->nullable();
            $table->string('height')->nullable();
            $table->string('cublic_meter')->nullable();
            $table->string('line')->nullable();
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
        Schema::dropIfExists('report_warehouses');
    }
}
