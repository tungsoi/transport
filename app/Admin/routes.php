<?php

use Illuminate\Routing\Router;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\Route;

// ADMIN GROUP
Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');

});

// FRONTEND GROUP
Route::group([
    'prefix'        => config('admin.fe.route.prefix'),
    'namespace'     => config('admin.fe.route.namespace'),
    'middleware'    => config('admin.fe.route.middleware'),
], function (Router $router) {
    $router->resources([
        'menus' =>  'HomeMenuController'
    ]);
});