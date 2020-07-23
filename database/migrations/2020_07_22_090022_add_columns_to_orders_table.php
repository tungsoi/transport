<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnsToOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('deposited_at')->nullable();
            $table->string('internal_note')->nullable();
            $table->string('user_created_name')->nullable();
            $table->string('customer_name')->nullable();
            $table->string('discount_value')->nullable();
            $table->string('discount_method')->nullable();
            $table->string('discount_type')->nullable();
            $table->string('success_at')->nullable();
            $table->string('is_discounted')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('orders', function (Blueprint $table) {
            //
        });
    }
}
