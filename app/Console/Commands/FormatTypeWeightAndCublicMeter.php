<?php

namespace App\Console\Commands;

use App\Models\ReportWarehouse;
use Illuminate\Console\Command;

class FormatTypeWeightAndCublicMeter extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'format:report-warhouse';

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
            echo $row->title. "\n";
            $row->weight = str_replace(',', '.', $row->weight);
            $row->cublic_meter = str_replace(',', '.', $row->cublic_meter);
            $row->save();
        }
    }
}
