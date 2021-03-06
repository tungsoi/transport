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

    // $router->get('/', function () {
    //     return redirect()->route('admin.home');
    // });
    $router->get('/', 'HomeController@index')->name('admin.home');
    $router->get('/customers/{id}/recharge', 'CustomerController@recharge')->name('customers.recharge');
    $router->post('/customers/recharge', 'CustomerController@rechargeStore')->name('customers.rechargeStore');
    $router->get('/customers/{id}/recharge-history', 'CustomerController@rechargeHistory')->name('customers.rechargeHistory');
    $router->get('/customers/{id}/order-history', 'CustomerController@orderHistory')->name('customers.orderHistory');
    $router->get('/customers/{id}/order-payment', 'CustomerController@orderPayment')->name('customers.orderPayment');

    // report
    $router->get('/reports/refunds', 'Report\RefundController@index')->name('reports.refund');
    $router->get('/reports/oweds', 'Report\OwedController@index')->name('reports.oweds');
    $router->get('/reports/recharges', 'Report\RechargeController@index')->name('reports.recharges');
    $router->get('/reports/deductions', 'Report\DeductionController@index')->name('reports.deductions');
    $router->get('/reports/totals', 'Report\TotalController@index')->name('reports.totals');
    $router->get('/reports/customers', 'Report\CustomerController@index')->name('reports.customers');
    $router->get('/reports/punishs', 'Report\PunishController@index')->name('reports.punishs');

    # redirect route use for report group
    $router->get('/reports/customers/{id}/edit', function ($id) {
        return redirect()->route('customers.edit', $id);
    });

    $router->get('/reports/customers/{id}', function ($id) {
        return redirect()->route('customers.show', $id);
    });

    // transport_orders
    $router->get('/transport_orders/vietnam_receives', 'VietNamReceivceController@index')->name('transport_orders.vietnam_receives');
    $router->get('/transport_orders/china_receives', 'ChinaReceivceController@index')->name('transport_orders.china_receives');
    $router->get('/transport_orders/payments', 'PaymentOrderController@index')->name('transport_orders.payments');
    $router->get('/transport_orders/get-data-transport-order-items', 'TransportOrderController@getDataTransportOrderItems')->name('transport_orders.getDataTransportOrderItems');
    $router->get('/transport_orders/store_transport_order_recive_china', 'TransportOrderController@storeOrderReceiveChina')->name('transport_orders.storeOrderReceiveChina');
    $router->get('/transport_orders/search-transport-order-items', 'TransportOrderController@searchTransportOrderItems')->name('transport_orders.searchTransportOrderItems');
    $router->post('/transport_orders/storeTransportOrder', 'TransportOrderController@storeTransportOrder')->name('transport_orders.storeTransportOrder');
    $router->post('/transport_orders/payment', 'TransportOrderController@paymentTransportOrder')->name('transport_orders.paymentTransportOrder');
    $router->get('/transport_orders/get-data-payment-customer-id', 'TransportOrderController@getDataPaymentCustomer')->name('transport_orders.getDataPaymentCustomer');

    // customer
    $router->get('/profiles/information', 'ProfileController@infomation')->name('profiles.information');
    $router->get('/profiles/wallet', 'ProfileController@wallet')->name('profiles.wallet');
    $router->get('/profiles/list-items', 'ProfileController@history')->name('profiles.history');
    $router->get('/profiles/list-orders', 'ProfileController@orderPayment')->name('profiles.historyOrder');
    $router->get('/profiles/list-orders/{id}', 'ProfileController@orderPaymentDetail')->name('profiles.orderPaymentDetail');
    $router->get('/profiles/messages', 'ProfileController@message')->name('customer.message');
    $router->get('/profiles/messages/create', 'ProfileController@messageCreate')->name('customer.messageCreate');

    // post
    $router->get('/posts/fetch/{id}', 'PostController@fetch')->name('posts.fetch');

    // report_warehouses
    $router->post('/report_warehouses/storeDetail', 'ReportWarehouse\\DetailController@storeDetail')->name('report_warehouses.storeDetail');
    $router->put('/report_warehouses/{id}', 'ReportWarehouse\\DetailController@updateDetail')->name('report_warehouses.updateDetail');
    // $router->post('/report_warehouses/{id}', 'ReportWarehouse\\DetailController@updateEditable')->name('report_warehouses.updateEditable');

    $router->resources([
        'customers'             =>  'CustomerController',
        'warehouses'            =>  'WareHouseController',
        'transport_order_items' =>  'TransportOrderItemController',
        'transport_orders'      =>  'TransportOrderController',
        'profiles'              =>  'ProfileController',
        'messages'              =>  'MessageController',
        'popups'                =>  'PopupController',
        'posts'                 =>  'PostController',
        'schedule_logs'         =>  'ScheduleLogController',
        'exchange_rates'        =>  'ExchangeRateController',
        'report_warehouses'     =>  'ReportWarehouse\DetailController',
        'report_warehouse_portal'     =>  'ReportWarehouse\PortalController',
        'report_warehouse_daily'     =>  'ReportWarehouse\DailyController',
        'transport_routes'  =>  'ReportWarehouse\TransportRouteController',
        'report_warehouse_route'    =>  'ReportWarehouse\ReportRouteController'
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
    $router->post('register', 'Auth\RegisterController@postRegister')->name('customer.postRegister');
});
