<?php

namespace App\Admin\Actions\Order;

use App\Models\Files;
use App\Support\Common;
use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;

class UploadImport extends Action
{
    public $name = 'File';
    protected $selector = '.upload-invoice-register';

    public function handle(Request $request)
    {
        $key = 'invoice-register';
        if (request()->hasFile($key)) {
            $file = request()->file($key);
            $file_size = $file->getSize();
            $filename = $file->getClientOriginalName();
            $extension = $file->getClientOriginalExtension();
            $filename = str_replace('.' . $extension, '', $filename);
            $filename = 'test';
            $file_path = 'reports/IBS/InvoiceRegister/' . date('Y/m');
            //$filename = md5($filename) . '.' . $file->getExtension();
            \Storage::disk('bav_s3')->put($file_path . '/' . $filename, $file->get());
            $field = [
                'file_path' => $file_path,
                'file_name' => $filename,
                'file_size' => $file_size,
                'file_type' => 8,
                'status' => 0,
            ];
            $file_new = Files::create($field);
            if ($file_new) {
                $pushJob = new PushJob($file_new->id);
                dispatch($pushJob);
            }
            return $this->response()->success("Upload file thành công. Vui lòng đợi hệ thống cập nhật dữ liệu.")->refresh();
        }
        return $this->response()->error("Upload file không thành công : Bạn chưa chọn file upload")->refresh();
    }

    public function form()
    {
        $this->file('invoice-register', 'File danh sách');
    }

    public function html()
    {
        $name = trans($this->name);
        $selector = ltrim($this->selector, '.');
        $form_style = config('admin.form-style');
        return <<<HTML
        <a href="#" class="btn btn-sm btn-info active {$selector}" noloading>
            <i class="fa fa-upload"></i>
            <span class="hidden-xs">&nbsp;Import MVĐ (Kho TQ)</span>
        </a>
HTML;
    }
}
