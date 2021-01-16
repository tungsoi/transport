<?php

namespace App\Admin\Actions\Exporter;

use App\Models\Aloorder\PurchaseOrder;
use App\Models\Order;
use App\Models\TransportRecharge;
use App\User;
use Encore\Admin\Grid\Exporters\AbstractExporter;
use Maatwebsite\Excel\Classes\LaravelExcelWorksheet;
use Maatwebsite\Excel\Facades\Excel;

class DailyReportWarehouseExporter extends AbstractExporter
{
    public function export()
    {
        Excel::create('BAO_CAO_KG_NHAP_KHO_THEO_NGAY', function($excel) {

            $excel->sheet('Sheet1', function(LaravelExcelWorksheet $sheet) {

                $this->chunk(function ($records) use ($sheet) {
                    $rows = $records->map(function ($item) {
                        if ($item->count() > 2) {
                            return [
                                $item->date,
                            ];
                        }
                    });
                    
                    $rows->prepend($this->header());

                    $flag = 0;
                    $res = [];
                    foreach ($rows as $key => $row) {
                        if ($key > 0) {
                            $row[0] = $flag;
                        }
                        $res[] = $row;
                        $flag++;
                    }

                    $sheet->rows($res);

                });

            });

        })->export('xls');
    }

    public function header()
    {
        return [
            'STT', 
            'MÃ KHÁCH HÀNG',
            'NHÂN VIÊN THỰC HIỆN',
            'SỐ TIỀN',
            'TRẠNG THÁI',
            'NỘI DUNG GIAO DỊCH',
            'THỜI GIAN THỰC HIỆN'
        ];
    }
}