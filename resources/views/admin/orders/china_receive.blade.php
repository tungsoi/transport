<style>
    .result-search {
        max-height: 200px;
        background: white;
        z-index: 10000;
        position: absolute;
        width: 93%;
        overflow: auto;
        min-width: 537px;
    }

    .search-item {
        cursor: pointer;
        border: 1px solid #cccccc;
        padding: 10px;
    }
    .search-item:hover {
        background: whitesmoke;
    }
    #china_receive_form {
        background: white !important;
        border-top-color: #00c0ef;
        border-top: 3px solid #00c0ef;
        padding: 20px 0px;
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
        font-size: 14px;
    }
    .alert {
        margin: 15px !important;
    }
    .form-group {
        margin-bottom: 0px !important;
    }
    input {
        margin: 0px 0px 10px 0px;
    }
    .pd-0 {
        padding: 0px;
    }
</style>
<div class="col-md-12" id="china_receive_form">
    <div class="col-md-12">
        <div class="box-header with-border">
            <div class="pull-left">
                @include('admin.orders.partials.list_btn')
                @include('admin.orders.partials.vietnam_rev_btn')
                @include('admin.orders.partials.payment_btn')
            </div>
        </div>
    </div>
    <div class="col-md-12 pd-0">
        <br>
        <ul>
            <li><b>Ghi chú </b></li>
            <li>Mã vận đơn: Không được trùng nhau.</li>
            <li>Cân nặng: Được phép nhập dạng số thập phân, chú ý theo dạng 0.5 (0 chấm 5)</li>
            <li>Thao tác: Sau khi nhập thông tin xong, bấm nút enter để lưu thông tin.</li>
        </ul>
        <hr>
    </div>
    <div class="col-md-12">
        <br>
        <div class="col-lg-3">
            <div class="form-group w100p" id="date-range-group">
                <label for="" class="uppercase">Tìm kiếm</label>
                <div class="controls w100p">
                    <div class="input-prepend input-group w100p" style="width: 100% !important">
                        <input type="text" name="cn_code_search" value="" id="cn_code_search" class="form-control w100p" placeholder="Nhập mã vận đơn" style="width: 100%"/>
                    </div>
                </div>
            </div>
            <div class="result-search">
            </div>
        </div>
        <div class="col-lg-3">
            <div class="form-group w100p" id="date-range-group">
                <div class="controls w100p">
                    <div class="input-prepend input-group w100p">
                        <br>
                        <button type="button" class="btn btn-primary btn-filter" id="btn-search-order-item" style="margin-top: 5px;"><i class="fa fa-filter"></i> &nbsp; Tìm kiếm</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12" id="div-receive-china">
        
        <form class="form js-form-update-transport-order">
            <input type="hidden" name="_token" id="csrf-token" value="{{ Session::token() }}" />
            <div class="modal-body">
                <div class="row">
                    <div class="table-responsive col-md-12" style="margin-top: 20px">
                        <label for="" class="uppercase">Danh sách mã vận đơn</label>
                        <table class="table table-bordered" id="tbl-orders">
                            <thead>
                                <th>Mã vận đơn</th>
                                <th>Cân nặng (kg)</th>
                                <th>Dài (cm)</th>
                                <th>Rộng (cm)</th>
                                <th>Cao (cm)</th>
                                <th>Ứng / kéo (Tệ)</th>
                                <th></th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="text" name="cn_code[]" class="form-control cn_code" placeholder="Nhập mã vận đơn" autofocus>
                                    </td>
                                    <td>
                                        <input type="text" name="kg[]" class="form-control kg" placeholder="Nhập cân nặng" value="0" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="product_length[]" class="form-control product_length" placeholder="Nhập chiều dài" value="0" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="product_width[]" class="form-control product_width" placeholder="Nhập chiều rộng" value="0" readonly>
                                    </td>
                                    <td>
                                        <input type="number" name="product_height[]" class="form-control product_height" placeholder="Nhập chiều cao" value="0" readonly>
                                    </td>
                                    <td>
                                        <input type="text" name="advance_drag[]" class="form-control advance_drag" placeholder="Nhập ứng kéo" value="0" readonly>
                                    </td>
                                    <td>
                                        <i class="fa fa-times-circle btnRemoveItem" aria-hidden="true"></i>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<input type="hidden" name="actionStore" data-action="{{ route('transport_orders.storeOrderReceiveChina') }}">

<script src="{{ asset('rongdo/pages/china_receive.js') }}"></script>
