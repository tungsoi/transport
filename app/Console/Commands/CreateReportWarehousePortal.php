<?php

namespace App\Console\Commands;

use App\Models\ReportWarehouse;
use App\Models\ReportWarehousePortal;
use App\Models\ScheduleLog;
use Illuminate\Console\Command;

class CreateReportWarehousePortal extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'report-warehouse:portal';

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
        try {
            $report_warehouses = ReportWarehouse::select('title')->groupBy('title')->get();

            foreach ($report_warehouses as $report_warehouse) {
                echo $report_warehouse->title . "\n";
                $data = $this->buildData($report_warehouse->title);
                
                $flag = ReportWarehousePortal::whereTitle($report_warehouse->title)->first();
                if ($flag) {
                    // update
                    ReportWarehousePortal::find($flag->id)->update([
                        'date'  =>  $data['date'],
                        'title' =>  $data['title'],
                        'count' =>  $data['count'],
                        'weight'  =>    $data['weight'],
                        'cublic_meter'  =>  $data['cublic_meter'],
                        'line'  =>  $data['line']
                    ]);
                }
                else {
                    // create
                    ReportWarehousePortal::create($data);
                }
                
            }

            ScheduleLog::create([
                'code'  =>  'Tính dữ liệu báo cáo nhập kho theo lô hàng'
            ]);
        }
        catch (\Exception $e) {
            dd($e->getMessage());
        }
        
    }

    public function buildData($title = "") {
        $raw = ReportWarehouse::whereTitle($title)->first();

        return [
            'date'  =>  ReportWarehouse::whereTitle($title)->orderBy('date', 'asc')->first()->date,
            'title' =>  $title,
            'count' =>  ReportWarehouse::whereTitle($title)->count(),
            'weight'  =>  ReportWarehouse::whereTitle($title)->sum('weight'),
            'cublic_meter'  =>  ReportWarehouse::whereTitle($title)->sum('cublic_meter'),
            'offer_weight'  =>  0,
            'offer_cublic_meter'    =>  0,
            'line'  =>  ReportWarehouse::whereTitle($title)->orderBy('date', 'asc')->first()->line,
            'note'  =>  "",
        ];
    }
}
