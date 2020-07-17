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
</style>

{{-- content --}}
<div class="col-lg-12" id="vietnam_receive_form">
    <div class="col-lg-12">
        <ul>
            <li><b>Ghi chú </b></li>
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
                    <label for="" class="fs-20">
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
                                <span class="bolder uppercase">Tên Khách hàng</span>
                            </strong>
                        </div>
                        <div>
                            <input name="customer_name" 
                            type="text" 
                            oninvalid="this.setCustomValidity('Vui lòng nhập đầy đủ tên khách hàng')" 
                            class="form-control customer_name" 
                            placeholder="Tên khách hàng" 
                            required=""
                            oninput="setCustomValidity('')">
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
                                        <input type="text" name="note[]" class="form-control note" placeholder="Nhập ghi chú" value="">
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
                    <button type="submit" class="btn btn-primary js-button-submit">Xác nhận</button>
                    <a href="" class="btn btn-default" data-dismiss="modal">Quay lại</a>
                </div>
            </div>
        </form>
    </div>
</div>
{{-- end content --}}

{{-- script --}}
<script>
    $(document).on('keydown', 'input[name="cn_code[]"]', function (e) {
        if (e.which == 13) { // button enter
            e.preventDefault();
            let cn_code = $(this).val();
            let tr = $(this).parent().parent();
            $('.js-button-submit').removeAttr('disabled');

            let codearr = $('input[name="cn_code[]"]');
            let flag = 0;
            for (let v = 0; v <= codearr.length; v++) {
                if (cn_code == codearr.eq(v).val() && codearr.eq(v).val() != "") {   
                    flag++;
                }

                if (flag >= 2) {
                    codearr.eq(v).parent().find('.error').remove();
                    codearr.eq(v).parent().append('<span class="error">Mã vận đơn đã được dùng, không được sử dụng lại.</span>');
                    codearr.eq(v).focus();
                    $('.js-button-submit').attr('disabled', 'disabled');
                    return false;
                }
            }
            $.ajax({
                type: 'GET',
                url: '/admin/transport_orders/get-data-transport-order-items',
                data: {cn_code: cn_code},
                success: function(response) {
                    // console.log(response);
                    tr.children().find('input[name="item_id[]"]').val('');
                    tr.children().find('input[name="customer_name[]"]').val('');
                    tr.children().find('input[name="kg[]"]').val('');
                    tr.children().find('input[name="product_length[]"]').val('');
                    tr.children().find('input[name="product_width[]"]').val('');
                    tr.children().find('input[name="product_height[]"]').val('');
                    tr.children().find('input[name="advance_drag[]"]').val('');
                    tr.children().find('input[name="note[]"]').val('');
                    tr.children().find('input[name="product_volumn[]"]').val('');
                    tr.children().find('input[name="product_cublic_meter[]"]').val('');

                    tr.children().find('input[name="cn_code[]"]').parent().find('.error').remove();

                    if (response != "")
                    {
                        tr.children().find('input[name="cn_code[]"]').val(response.cn_code);
                        tr.children().find('input[name="item_id[]"]').val(response.id);
                        tr.children().find('input[name="customer_name[]"]').val(response.customer_name);
                        tr.children().find('input[name="kg[]"]').val(response.kg);
                        tr.children().find('input[name="product_length[]"]').val(response.product_length);
                        tr.children().find('input[name="product_width[]"]').val(response.product_width);
                        tr.children().find('input[name="product_height[]"]').val(response.product_height);
                        tr.children().find('input[name="advance_drag[]"]').val(response.advance_drag);
                        tr.children().find('input[name="note[]"]').val(response.note);
                        tr.children().find('input[name="product_volumn[]"]').val(response.product_volumn);
                        tr.children().find('input[name="product_cublic_meter[]"]').val(response.product_cublic_meter);

                        $(function() {
                            $('.advance_drag').autoNumeric();
                        });
                    } else {
                        tr.children().find('input[name="cn_code[]"]').parent().append('<span class="error">Mã vận đơn không tổn tại</span>');
                    }
                }
            });
        }
});

    $(document).on('blur', '.js-cn-code-ip', function (e) {
        let value = $(this).val();
        let ts = $(this);
        if (value != '') {
            $.ajax({
                type: 'GET',
                url: '/admin/transport-orders/check-exist-transport-code',
                data: {transportCode: value},
                success: function(response) {
                    if (response && response.status != false) {
                        if (response.exist == true) {
                            $(ts).closest('div').find('.js-noti-transport-code').html('Mã vận đơn TQ đã về kho VN, vui lòng nhập mã khác');
                            $('.js-button-submit').addClass('hidden');
                        } else {
                            $(ts).closest('div').find('.js-noti-transport-code').html('');
                            $('.js-button-submit').removeClass('hidden');
                        }
                    }
                }
            });
        }
    });

    $(document).on('keydown','#tbl-orders input', function(e) {
        if (e.which == 13) {
            e.preventDefault();
            // return false;
            var ele = $('#tbl-orders tbody tr').last().clone();
            ele.find('input').val(0);
            ele.find('.cn_code').val("");

            let stt = ele.find('.stt').html();
            ele.find('.stt').html(Number(stt)+1);
            ele.appendTo('#tbl-orders tbody');
            ele.find('.cn_code').focus();
            var ad = ele.find('.advance_drag');

            $(function() {
                $('.advance_drag').autoNumeric();
            });
        }
    });

    $(document).on('keydown','.customer_name', function(e) {
        if (e.which == 13) {
            e.preventDefault();
            return false;
        }
    });

    $(function() {
        $('.advance_drag').autoNumeric();
    });

    $(document).on('click', '.btnRemoveItem', function (e){
        var tr = $('#tbl-orders tr');
        if (tr.length > 2) {
            $(this).parent().parent().remove();
        }
    });

    $('form').on('focus', 'input[type=number]', function (e) {
        $(this).on('mousewheel.disableScroll', function (e) {
            e.preventDefault()
        });
    });
    $('form').on('blur', 'input[type=number]', function (e) {
        $(this).off('mousewheel.disableScroll');
    });
    $('form').on('focus', 'input[type=text]', function (e) {
        $(this).on('mousewheel.disableScroll', function (e) {
            e.preventDefault()
        });
    });
    $('form').on('blur', 'input[type=text]', function (e) {
        $(this).off('mousewheel.disableScroll');
    });
</script>