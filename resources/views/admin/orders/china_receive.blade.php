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
    .alert {
        margin: 15px !important;
    }
    .form-group {
        margin-bottom: 0px !important;
    }
    input {
        margin: 0px 0px 10px 0px;
    }
</style>
<div class="col-lg-12" id="china_receive_form">
    <div class="col-lg-12">
        <ul>
            <li><b>Ghi chú </b></li>
            <li>Mã vận đơn: Không được trùng nhau.</li>
            <li>Cân nặng: Được phép nhập dạng số thập phân, chú ý theo dạng 0.5 (0 chấm 5)</li>
            <li>Thao tác: Sau khi nhập thông tin xong, bấm nút enter để lưu thông tin.</li>
        </ul>
        <hr>
    </div>
    <div class="col-lg-12">
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
    <div class="col-lg-12" id="div-receive-china">
        
        <form class="form js-form-update-transport-order">
            <input type="hidden" name="_token" id="csrf-token" value="{{ Session::token() }}" />
            <div class="modal-body">
                <div class="row">
                    <div class="table-responsive col-lg-12" style="margin-top: 20px">
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
                                        <input type="text" name="kg[]" class="form-control kg" placeholder="Nhập cân nặng" value="0">
                                    </td>
                                    <td>
                                        <input type="number" name="product_length[]" class="form-control product_length" placeholder="Nhập chiều dài" value="0">
                                    </td>
                                    <td>
                                        <input type="number" name="product_width[]" class="form-control product_width" placeholder="Nhập chiều rộng" value="0">
                                    </td>
                                    <td>
                                        <input type="number" name="product_height[]" class="form-control product_height" placeholder="Nhập chiều cao" value="0">
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
            </div>
        </form>
    </div>
</div>
<input type="hidden" name="actionStore" data-action="{{ route('transport_orders.storeOrderReceiveChina') }}">


{{-- script --}}
<script>
    $(document).on('keydown','#tbl-orders input', function(e) {
        if (e.which == 13) {
            e.preventDefault();
            $('input[name="cn_code[]"]').parent().find('.error').remove();
            if ($(this).attr('name') == 'cn_code[]')
            {   
                $(this).parent().next().children().val('');
                $(this).parent().next().children().focus();
            } else {
                e.preventDefault();

                let data = $(this);
                let parent = $(this).parent().parent();
                let cn_code = parent.find('.cn_code').val();
                if (cn_code != "")
                {
                    let codearr = $('.cn_code');
                    let flag = 0;
                    for (let v = 0; v <= codearr.length; v++)
                    {
                        if (cn_code == codearr.eq(v).val() && codearr.eq(v).val() != "")
                        {   
                            flag++;
                            
                        }

                        if (flag >= 2)
                        {
                            codearr.eq(v).parent().find('.error').remove();
                            codearr.eq(v).parent().append('<span class="error">Mã vận đơn đã được dùng, không được sử dụng lại.</span>');
                            codearr.eq(v).focus();
                            return false;
                        }
                    }

                    // console.log(codearr);
                    let kg = parent.find('.kg').val();
                    let product_length = parent.find('.product_length').val();
                    let product_width = parent.find('.product_width').val();
                    let product_height = parent.find('.product_height').val();
                    let advance_drag = parent.find('.advance_drag').val();
                    parent.find('.error').remove();
                    if (kg == "")
                    {
                        parent.find('.kg').parent().find('.error').remove();
                        parent.find('.kg').parent().append('<span class="error">Nhập cân nặng</span>');
                        parent.find('.kg').focus();
                        return false;
                    } else if (product_length == "") {
                        parent.find('.product_length').parent().find('.error').remove();
                        parent.find('.product_length').parent().append('<span class="error">Nhập chiều dài</span>');
                        parent.find('.product_length').focus();
                        return false;
                    } else if (product_width == "") {
                        parent.find('.product_width').parent().find('.error').remove();
                        parent.find('.product_width').parent().append('<span class="error">Nhập chiều rộng</span>');
                        parent.find('.product_width').focus();
                        return false;
                    } else if (product_height == "") {
                        parent.find('.product_height').parent().find('.error').remove();
                        parent.find('.product_height').parent().append('<span class="error">Nhập chiều cao</span>');
                        parent.find('.product_height').focus();
                        return false;
                    } else if (advance_drag == "") {
                        parent.find('.advance_drag').parent().find('.error').remove();
                        parent.find('.advance_drag').parent().append('<span class="error">Nhập ứng kéo</span>');
                        parent.find('.advance_drag').focus();
                        return false;
                    } else {
                        parent.find('.kg').parent().find('.error').remove();
                        $.ajax({
                            type: 'GET',
                            url: '/admin/transport_orders/store_transport_order_recive_china',
                            data: {
                                cn_code: cn_code,
                                kg: kg,
                                product_length: product_length,
                                product_width: product_width,
                                product_height: product_height,
                                advance_drag: advance_drag,
                            },
                            success: function(response) {
                                if (! response.error)
                                {
                                    $('#div-receive-china').prepend('<div class="alert alert-success">'+response.msg+'</div>');

                                    setTimeout(function (){
                                        $('#div-receive-china').find('.alert').remove();
                                    }, 5000);
                                }
                            }
                        });

                        var ele = $('#tbl-orders tbody tr').last().clone();
                        ele.find('input').val(0);
                        ele.find('.cn_code').val("");
                        ele.appendTo('#tbl-orders tbody');
                        ele.find('.cn_code').focus();
                        var ad = ele.find('.advance_drag');

                        $(function() {
                            $('.advance_drag').autoNumeric();
                        });
                    }

                } else {
                    parent.find('.cn_code').parent().append('<span class="error">Mã vận đơn không được trống</span>');
                }
            }
        }
    });

    $(document).on('keydown','.customer_name', function(e) {
        if (e.which == 13) {
            e.preventDefault();
            return false;
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
    

    $(function() {
        $('.advance_drag').autoNumeric();
    });

    $(document).on('click', '.btnRemoveItem', function (e){
        var tr = $('#tbl-orders tr');
        if (tr.length > 2)
        {
            $(this).parent().parent().remove();
        }
      });

    $('#btn-search-order-item').on('click', function (e)
    {
        e.preventDefault();

        $('.result-search').children().remove();
        let cn_code = $('#cn_code_search').val();

        $.ajax({
            type: 'GET',
            url: '/admin/transport_orders/search-transport-order-items',
            data: {cn_code: cn_code},
            success: function(response) {
                if (response != "")
                {   
                    $.each(response, function(index, value) {
                        let html = "<div class='search-item' data-id="+value.id+">"+value.cn_code+"</div>";
                        $('.result-search').append(html);
                    }); 
                } else {
                    let html = "<div class='search-item'>Không có mã vận đơn nào</div>";
                    $('.result-search').append(html);
                }
            }
        });
    });

    $(document).on('click', '.search-item', function (e)
    {
        e.preventDefault();
        let id = $(this).attr('data-id');
        window.location.href = '/admin/transport_order_items/'+id+'/edit';
    });

    $(document).on('click', function (e)
    {
        $('.result-search').children().remove();
    });
</script>