<?php

namespace App\Console\Commands;

use App\Models\ReportWarehouse;
use Illuminate\Console\Command;

class FormatOrderColumnReportWarehouse extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'format:order';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $rows = ReportWarehouse::all();

        foreach ($rows as $row) {
            if (strlen($row->order) == 1) {
                echo $row->title . "-" . $row->order. "\n";
                $row->order = str_pad($row->order, 2, '0', STR_PAD_LEFT);
                $row->save();
            }
        }
    }
}
