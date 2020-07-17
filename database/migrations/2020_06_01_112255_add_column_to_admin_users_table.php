<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnToAdminUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('admin_users', function (Blueprint $table) {
            $table->string('email')->nullable();
            $table->string('phone_number')->nullable();
            $table->string('wallet')->nullable()->default(0);
            $table->string('address')->nullable();
            $table->integer('is_customer')->nullable()->default(1);
            $table->string('symbol_name')->nullable();
            $table->integer('ware_house_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('admin_users', function (Blueprint $table) {
            $table->dropColumn('phone_number');
            $table->dropColumn('wallet');
            $table->dropColumn('email');
            $table->dropColumn('address');
            $table->dropColumn('is_customer');
            $table->dropColumn('symbol_name');
            $table->dropColumn('ware_house_id');
        });
    }
}
