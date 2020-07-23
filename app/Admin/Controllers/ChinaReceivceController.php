<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;

class ChinaReceivceController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title;
    protected $description;

    public function __construct()
    {
        $this->title = 'Trung Quốc Nhận';
        $this->description = 'Tạo mới';
    }

    /**
     * Build index view
     *
     * @param Content $content
     * @return void
     */
    public function index(Content $content)
    {
        return Admin::content(function (Content $content) {
            $content->header($this->title);
            $content->description($this->description);
            $content->view('admin.orders.china_receive');
        });
    }
}
