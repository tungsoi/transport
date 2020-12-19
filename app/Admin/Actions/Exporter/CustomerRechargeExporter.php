<?php

namespace App\Admin\Actions\Exporter;

use App\Models\Aloorder\PurchaseOrder;
use App\Models\Order;
use App\Models\TransportRecharge;
use App\User;
use Encore\Admin\Grid\Exporters\AbstractExporter;
use Maatwebsite\Excel\Classes\LaravelExcelWorksheet;
use Maatwebsite\Excel\Facades\Excel;

class CustomerRechargeExporter extends AbstractExporter
{
    public function export()
    {
        Excel::create('BAO_CAO_NAP_TAI_KHOAN', function($excel) {

            $excel->sheet('Sheet1', function(LaravelExcelWorksheet $sheet) {

                $this->chunk(function ($records) use ($sheet) {
                    $rows = $records->map(function ($item) {

                        return [
                            0,
                            User::find($item->customer_id)->symbol_name ?? "",
                            User::find($item->user_id_created)->name ?? "",
                            number_format($item->money),
                            TransportRecharge::ALL_RECHARGE[$item->type_recharge],
                            $item->content,
                            date('H:i | d-m-Y', strtotime($item->created_at))
                        ];
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