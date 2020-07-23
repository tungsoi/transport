<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTransportOrderItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transport_order_items', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('order_id')->nullable();
            $table->string('cn_code')->nullable();
            $table->string('price_service')->nullable()->default(0);
            $table->string('kg')->nullable();
            $table->string('volume')->nullable();
            $table->string('cublic_meter')->nullable();
            $table->string('advance_drag')->nullable();
            $table->string('total_price')->nullable()->default(0);
            $table->integer('warehouse_cn')->nullable()->comment('0: chua ve kho tq, 1: da ve kho tq')->default(0);
            $table->string('warehouse_cn_date')->nullable();
            $table->integer('warehouse_vn')->nullable()->comment('0: chua ve kho vn, 1: da ve kho vn')->default(0);
            $table->string('warehouse_vn_date')->nullable();
            $table->string('product_width')->nullable();
            $table->string('product_height')->nullable();
            $table->string('product_length')->nullable();
            $table->integer('transport_customer_id')->nullable();
            $table->integer('is_payment')->nullable()->default(0)->comment('0: chua thanh toan, 1: da thanh toan');
            $table->integer('user_id_updated')->nullable();
            $table->integer('payment_type')->nullable();
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
        Schema::dropIfExists('transport_order_items');
    }
}
