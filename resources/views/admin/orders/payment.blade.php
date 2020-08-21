<style>
    #payment_form {
        background: white;
        border-top-color: #00c0ef;
        border-top: 3px solid #00c0ef;
        padding: 20px 15px;
    }
    .js-remove-order-info {
        margin-top: -16px;
        margin-right: -5px;
        background-color: #000000 !important;
        text-align: center;
        z-index: 9999;
        border-radius: 50%;
        height: 21px;
        width: 21px;
        color: #ffffff !important;
    }

    thead th {
        text-align: center;
        font-size: 12px;
    }

    .btnRemoveItem {
        cursor: pointer;
        color: red;
        font-size: 18px;
    }

    .error {
        color: red;
        font-size: 12px;
    }
    #tbl-payment tr td {
        font-size: 14px;
    }
    .pd-0 {
        padding: 0px;
    }
    #tbl-payment th {
        text-transform: uppercase;
        font-size: 12px;
    }
    .customer-payment label {
        text-transform: uppercase;
    }
    .panel-error .panel-body {
        background: #bd5959;
        color: white;
    }

    .panel-success .panel-body {
        background: #419941;
        color: white;
    }
</style>

<div class="col-lg-12" id="payment_form">
    <div class="col-md-12 pd-0">
        <div class="box-header with-border">
            <div class="pull-left">
                @include('admin.orders.partials.list_btn')
                @include('admin.orders.partials.china_rev_btn')
                @include('admin.orders.partials.vietnam_rev_btn')
            </div>
        </div>
    </div>
    @if ($message = Session::get('payment-error'))
    <div class="col-md-12">
        <br>
        <div class="panel panel-error">
            <div class="panel-body">
                <label for="" class="fs-20 uppercase">
                    {{ $message }}
                </label>
            </div>
        </div>
    </div>
    @endif

    @if ($message = Session::get('payment-success'))
    <div class="col-md-12">
        <br>
        <div class="panel panel-success">
            <div class="panel-body">
                <label for="" class="fs-20 uppercase">
                    {{ $message }}
                </label>
            </div>
        </div>
    </div>
    @endif
    <div class="col-md-12 pd-0">
    <form action="{{ route('transport_orders.paymentTransportOrder') }}" method="POST"  enctype="multipart/form-data" class="form js-form-update-transport-order" id="frm-payment">
        <div class="customer-payment">
            {!! $customer !!}
        </div>
        <div class="clearfix"></div>
        <div class="form-group">
            <label for="" class="col-sm-2 control-label">Số dư ví hiện tại: </label>
            <div class="col-sm-8">
                <span class="wallet">0</span> VND
            </div>
        </div>

        <div class="clearfix row">
            <hr>
        </div>
        <input type="hidden" name="_token" id="csrf-token" value="{{ Session::token() }}" />
        <div class="modal-body">
            <div class="row">
                <div class="table-responsive col-lg-12" style="margin-top: 20px">
                    <label for="" class="uppercase">Danh sách mã vận đơn</label>
                    <table class="table table-bordered" id="tbl-orders">
                        <thead>
                            <th class="uppercase">STT</th>
                            <th class="uppercase">Mã vận đơn</th>
                            <th class="uppercase">Tên khách hàng</th>
                            <th class="uppercase" style="width: 10%;">Loại TT</th>
                            <th class="uppercase">Kg</th>
                            <th class="uppercase">Dài (cm)</th>
                            <th class="uppercase">Rộng (cm)</th>
                            <th class="uppercase">Cao (cm)</th>
                            <th class="uppercase">M3</th>
                            <th class="uppercase">V/6000</th>
                            <th class="uppercase">Ứng kéo (Tệ)</th>
                            <th class="uppercase"></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="stt">
                                    <span class="stt">1</span>
                                </td>
                                <td>
                                    <input type="hidden" name="item_id[]">
                                    <input type="text" name="cn_code[]" class="form-control cn_code" placeholder="VD: RD01" autofocus required="required">
                                </td>
                                <td>
                                    <input type="text" name="customer_name[]" class="form-control" placeholder="">
                                </td>
                                <td>
                                    <select class="form-control payment_type" name="payment_type[]">
                                        <option value="1" selected>Khối lượng</option>
                                        <option value="0">V/6000</option>
                                        <option value="-1">M3</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="text" name="kg[]" class="form-control" placeholder="Nhập cân nặng" value="0">
                                </td>
                                <td>
                                    <input type="number" name="product_length[]" class="form-control" placeholder="Nhập chiều dài" value="0">
                                </td>
                                <td>
                                    <input type="number" name="product_width[]" class="form-control" placeholder="Nhập chiều rộng" value="0">
                                </td>
                                <td>
                                    <input type="number" name="product_height[]" class="form-control" placeholder="Nhập chiều cao" value="0">
                                </td>
                                <td>
                                    <input type="text" name="product_cublic_meter[]" class="form-control product_cublic_meter" placeholder="M3" value="0">
                                </td>
                                <td>
                                    <input type="text" name="product_volumn[]" class="form-control product_volumn" placeholder="V/6000" value="0">
                                </td>
                                <td>
                                    <input type="text" name="advance_drag[]" class="form-control advance_drag" placeholder="Nhập ứng kéo" value="0">
                                </td>
                                <td>
                                    <i class="fa fa-times-circle btnRemoveItem" aria-hidden="true"></i>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group" id="date-range-group">
                        <label for="" class="uppercase">Ghi chú</label>
                        <textarea name="internal_note" id="internal_note" rows="3" style="width: 100%" placeholder="Nhập vào ghi chú cho đơn thanh toán" class="form-control"></textarea>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="table-responsive col-lg-12" style="margin-top: 20px">
                    <label for="" class="uppercase">Giảm trừ cân nặng</label>
                    <table class="table table-bordered" id="tbl-discount-kg">
                        <tbody>
                            <tr>
                                <td align="center" style="width: 30%">
                                    <select class="form-control discount_type" name="discount_type[]">
                                        <option value="1" selected>Giảm đi</option>
                                        <option value="0">Tăng lên</option>
                                    </select>
                                </td>
                                <td align="center" style="width: 30%">
                                    <select class="form-control discount_method" name="discount_method[]">
                                        <option value="1" selected>Khối lượng</option>
                                    </select>
                                </td>
                                <td align="right"  style="width: 40%">                                        
                                    <input type="number" name="discount_kg" class="form-control discount_kg" placeholder="Nhập giá trị" value="0" >
                                </td>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="table-responsive col-lg-12" style="margin-top: 20px">
                    <label for="" class="uppercase">Chi tiết thanh toán <h6><i>(Tỷ giá hiện tại: 1 tệ = {{ $vnd }} VND)</i></h6></label>
                    <table class="table table-bordered" id="tbl-payment">
                        <thead>
                            <th style="width: 25%"></th>
                            <th style="width: 25%">Số lượng</th>
                            <th style="widht: 25%">Đơn giá (Tệ)</th>
                            <th style="width: 25%">Thành tiền (Tệ)</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td align="center">Tổng khối lượng (kg)</td>
                                <td align="right">
                                    <span class="lb-sum-kg" name="lb-sum-kg">0</span>
                                    <input type="hidden" name="count-kg" class="count-kg" value="">
                                </td>
                                <td>
                                    <input type="text" name="sum_kg" class="form-control sum_kg" placeholder="Nhập đơn giá kg">
                                </td>
                                <td align="right">
                                    <input type="text" name="total_kg" class="form-control total_kg" placeholder="Thành tiền kg" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">Tổng V/6000</td>
                                <td align="right">
                                    <span class="lb-sum-volumn" name="lb-sum-volumn">0</span>
                                    <input type="hidden" name="count-volumn" class="count-volumn" value="">
                                </td>
                                <td>
                                    <input type="text" name="sum_volumn" class="form-control sum_volumn" placeholder="Nhập đơn giá V/6000" >
                                </td>
                                <td align="right">
                                    <input type="text" name="total_volumn" class="form-control total_volumn" placeholder="Thành tiền V/6000" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">Tổng mét khối (m3)</td>
                                <td align="right">
                                    <span class="lb-sum-cublic-meter" name="lb-sum-cublic-meter">0</span>
                                    <input type="hidden" name="count-cublic-meter" class="count-cublic-meter" value="">
                                </td>
                                <td>
                                    <input type="text" name="sum_cublic_meter" class="form-control sum_cublic_meter" placeholder="Nhập đơn giá mét khối" >
                                </td>
                                <td align="right">
                                    <input type="text" name="total_cublic_meter" class="form-control total_cublic_meter" placeholder="Thành tiền mét khối" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">Tổng ứng kéo</td>
                                <td>
                                    <span class="advan" name="advan[]"></span>
                                    <input type="hidden" name="advan" class="advan">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">Tổng tiền</td>
                                <td>
                                    <span class="total_money" name="total_money[]"></span>
                                    <input type="hidden" name="total-money" class="total-money">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
           
        <div class="modal-footer clearfix">
            <button type="submit" class="btn btn-danger js-button-submit" id="btnSubmit">Thanh toán</button>
            <a href="" class="btn btn-default" data-dismiss="modal">Quay lại</a>
        </div>
    </form>
    <input type="hidden" class="exchange_rate" name="exchange_rate" value="{{ $vnd ?? 0 }}">
    </div>
</div>

<?php 
    $order_raw = Session::get('order_raw');
?>

@if (isset($order_raw) && !is_null($order_raw))
    @include('admin.orders.partials.modal', [
        'order_raw'     =>  $order_raw
    ])
@endif

<script type="text/javascript" src="https://unpkg.com/default-passive-events"></script>

<script src="{{ asset('rongdo/autoNumeric42.js') }}"></script>
<script src="{{ asset('rongdo/pages/payment.js') }}"></script>

<script>
    $(window).load(function() {
        $('#myModal').modal('show');
    });

    $('#myModal').on('hidden.bs.modal', function (e) {
        window.location.reload();
    })

    $(document).on('click', '#btn-recharge', function() {
        let href = $(this).attr('data-href');
        $('#myModal').modal('hide');
        window.location.href = href;
    });
</script>