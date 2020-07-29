{{-- style css --}}
<style>
    #vietnam_receive_form {
        background: white;
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
        font-size: 14px;
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
    .panel-body {
        background: green;
        color: white;
    }
    .panel {
        margin: 15px;
    }
    .panel-error .panel-body {
        background: #bd5959;
    }
    .pd-0 {
        padding: 0px;
    }
</style>

<div class="col-lg-12" id="vietnam_receive_form">
    <div class="col-md-12">
        <div class="box-header with-border">
            <div class="pull-left">
                @include('admin.orders.partials.list_btn')
                @include('admin.orders.partials.china_rev_btn')
                @include('admin.orders.partials.payment_btn')
            </div>
        </div>
    </div>
    <div class="col-lg-12 pd-0">
        <br>
        <ul>
            <li><b>Ghi chú </b></li>
            <li>Mã khách hàng: Yêu cầu nhập đúng biệt danh khi tạo tài khoản cho khách hàng.</li>
            <li>Mã vận đơn: Chỉ sử dụng được các mã chưa được nhận tại Hà Nội, chưa thanh toán.</li>
            <li>Cân nặng: Được phép nhập dạng số thập phân, chú ý theo dạng 0.5 (0 chấm 5)</li>
            <li>Thao tác: Sau khi nhập mã vận đơn, bấm nút enter để tải thông tin.</li>
        </ul>
        <hr>
    </div>
    @if ($message = Session::get('notification'))
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <label for="" class="fs-20 uppercase">
                        {{ $message }}
                    </label>
                </div>
            </div>
        </div>
    @endif

    @if ($message =  Session::get('invalid-customer'))
        <div class="col-md-12">
            <div class="panel panel-error">
                <div class="panel-body">
                    <label for="" class="fs-20 uppercase">
                        {{ $message }}
                    </label>
                </div>
            </div>
        </div>
    @endif
    <div class="col-lg-12">
        <form action="{{ route('transport_orders.storeTransportOrder') }}" method="POST"  enctype="multipart/form-data" class="form js-form-update-transport-order">
            <input type="hidden" name="_token" id="csrf-token" value="{{ Session::token() }}" />
            <div class="modal-body">
                <div class="row">
                    <div class="receive-content col-lg-4">
                        <div>
                            <strong>
                                <span class="bolder uppercase">Mã Khách hàng</span>
                            </strong>
                            <i>(VD: TUNGHN)</i>
                        </div>
                        <div>
                            <input name="customer_name" 
                            type="text" 
                            oninvalid="this.setCustomValidity('Vui lòng nhập đầy đủ tên khách hàng')" 
                            class="form-control customer_name" 
                            placeholder="Tên khách hàng" 
                            required=""
                            oninput="setCustomValidity('')"
                            value="{{ old('customer_name') }}">
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="table-responsive col-lg-12" style="margin-top: 20px">
                        <label for="">Danh sách mã vận đơn</label>
                        <table class="table table-bordered" id="tbl-orders">
                            <thead>
                                <th>STT</th>
                                <th>Mã vận đơn</th>
                                <th>Cân nặng (kg)</th>
                                <th>Dài (cm)</th>
                                <th>Rộng (cm)</th>
                                <th>Cao (cm)</th>
                                <th>Ứng / kéo (Tệ)</th>
                                <th>Ghi chú</th>
                                <th></th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <span class="stt">1</span>
                                    </td>
                                    <td>
                                        <input type="text" name="cn_code[]" class="form-control cn_code" placeholder="Nhập mã vận đơn" autofocus>
                                    </td>
                                    <td>
                                        <input type="text" name="kg[]" class="form-control" placeholder="Nhập cân nặng" value="">
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
                                        <input type="text" name="advance_drag[]" class="form-control advance_drag" placeholder="Nhập ứng kéo" value="">
                                    </td>
                                    <td>
                                        <input type="text" name="note[]" class="form-control note" placeholder="Nhập ghi chú" value="HN nhận">
                                    </td>
                                    <td>
                                        <i class="fa fa-times-circle btnRemoveItem" aria-hidden="true"></i>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer clearfix">
                    <button type="submit" class="btn btn-danger js-button-submit">Xác nhận</button>
                    <a href="{{ route('transport_orders.index') }}" class="btn btn-default" data-dismiss="modal">Quay lại</a>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="{{ asset('rongdo/pages/vietnam_receive.js') }}"></script>