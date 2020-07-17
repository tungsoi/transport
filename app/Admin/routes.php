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
    $router->get('/customers/{id}/recharge', 'CustomerController@recharge')->name('customers.recharge');
    $router->post('/customers/recharge', 'CustomerController@rechargeStore')->name('customers.rechargeStore');
    $router->get('/customers/{id}/recharge-history', 'CustomerController@rechargeHistory')->name('customers.rechargeHistory');
    $router->get('/customers/{id}/order-history', 'CustomerController@orderHistory')->name('customers.orderHistory');

    // report
    $router->get('/reports/refunds', 'Report\RefundController@index')->name('reports.refund');
    $router->get('/reports/oweds', 'Report\OwedController@index')->name('reports.oweds');
    $router->get('/reports/recharges', 'Report\RechargeController@index')->name('reports.recharges');
    $router->get('/reports/deductions', 'Report\DeductionController@index')->name('reports.deductions');
    $router->get('/reports/totals', 'Report\TotalController@index')->name('reports.totals');
    $router->get('/reports/customers', 'Report\CustomerController@index')->name('reports.customers');

    // transport_orders
    $router->get('/transport_orders/vietnam_receives', 'VietNamReceivceController@index')->name('transport_orders.vietnam_receives');
    $router->get('/transport_orders/china_receives', 'ChinaReceivceController@index')->name('transport_orders.china_receives');
    $router->get('/transport_orders/payments', 'PaymentOrderController@index')->name('transport_orders.payments');
    $router->get('/transport_orders/get-data-transport-order-items', 'TransportOrderController@getDataTransportOrderItems')->name('transport_orders.getDataTransportOrderItems');
    $router->get('/transport_orders/store_transport_order_recive_china', 'TransportOrderController@storeOrderReceiveChina')->name('transport_orders.storeOrderReceiveChina');
    $router->get('/transport_orders/search-transport-order-items', 'TransportOrderController@searchTransportOrderItems')->name('transport_orders.searchTransportOrderItems');
    $router->post('/transport_orders/storeTransportOrder', 'TransportOrderController@storeTransportOrder')->name('transport_orders.storeTransportOrder');
    $router->post('/transport_orders/payment', 'TransportOrderController@paymentTransportOrder')->name('transport_orders.paymentTransportOrder');

    $router->resources([
        'customers'     =>  'CustomerController',
        'warehouses'    =>  'WareHouseController',
        'transport_order_items' =>  'TransportOrderItemController',
        'transport_orders'  =>  'TransportOrderController'
    ]);

});


// HOME GROUP
Route::group([
    'prefix'        => config('admin.customer.prefix'),
    'namespace'     => config('admin.customer.namespace'),
    'middleware'    => config('admin.customer.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('customer.home');
    $router->get('search', 'HomeController@index')->name('customer.search');
    $router->get('login', 'Auth\LoginController@login')->name('customer.login');
    $router->get('register', 'Auth\RegisterController@register')->name('customer.register');
    $router->get('/admin/customer/information', 'AccountController@index')->name('customer.information');
    $router->get('/admin/customer/wallet', 'AccountController@index')->name('customer.wallet');
    $router->get('/admin/customer/history', 'AccountController@index')->name('customer.wallet');
    $router->get('/admin/customer/message', 'AccountController@index')->name('customer.wallet');

});
