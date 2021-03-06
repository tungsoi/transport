<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnsNoteToReportWarehousesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('report_warehouses', function (Blueprint $table) {
            if (! Schema::hasColumn('report_warehouses', 'note')) {
                $table->text('note')->nullable();
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
