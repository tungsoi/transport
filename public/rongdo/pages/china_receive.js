$(document).on('ready pjax:success', function() {
    var pathname = window.location.pathname;
    if (pathname == '/admin/transport_orders/china_receives') {
        console.log('China receive !');
        $(document).on('keydown','#china_receive_form #tbl-orders input', function(e) {
            if (e.which == 13) 
            {
                e.preventDefault();
                $('input[name="cn_code[]"]').parent().find('.error').remove();
                if ($(this).attr('name') == 'cn_code[]')
                {   
                    // $(this).parent().next().children().val('');
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
                                        $("#div-receive-china").prepend('<div class="alert alert-success">'+response.msg+'</div>');
                                        setTimeout(function (){
                                            $('#div-receive-china').find('.alert').remove();
                                        }, 5000);

                                        var ele = $('#tbl-orders tbody tr').last().clone();
                                        ele.find('input').val(0);
                                        ele.find('.cn_code').val("");
                                        ele.appendTo('#tbl-orders tbody');
                                        ele.find('.cn_code').focus();
                                        var ad = ele.find('.advance_drag');

                                        $(function() {
                                            $('.advance_drag').autoNumeric();
                                        });
                                    } else {
                                        $("#div-receive-china").prepend('<div class="alert alert-error">'+response.msg+'</div>');
                                        setTimeout(function (){
                                            $('#div-receive-china').find('.alert').remove();
                                        }, 5000);
                                        parent.find('.cn_code').focus();
                                    }
                                }
                            });
                        }
                    } else {
                        parent.find('.cn_code').parent().append('<span class="error">Mã vận đơn không được trống</span>');
                    }
                }
            }
        });

        $(document).on('keydown','#china_receive_form .customer_name', function(e) {
            if (e.which == 13) {
                e.preventDefault();
                return false;
            }
        });

        $('#china_receive_form form').on('focus', 'input[type=number]', function (e) {
            $(this).on('mousewheel.disableScroll', function (e) {
                e.preventDefault()
            });
        });

        $('#china_receive_form form').on('blur', 'input[type=number]', function (e) {
            $(this).off('mousewheel.disableScroll');
        });

        $('#china_receive_form form').on('focus', 'input[type=text]', function (e) {
            $(this).on('mousewheel.disableScroll', function (e) {
                e.preventDefault()
            });
        });

        $('#china_receive_form form').on('blur', 'input[type=text]', function (e) {
            $(this).off('mousewheel.disableScroll');
        });
        
        $(function() {
            $('#china_receive_form .advance_drag').autoNumeric();
        });

        $(document).on('click', '#china_receive_form .btnRemoveItem', function (e){
            var tr = $('#china_receive_form #tbl-orders tr');
            if (tr.length > 2)
            {
                $(this).parent().parent().remove();
            }
            });

        $('#china_receive_form #btn-search-order-item').on('click', function (e)
        {
            e.preventDefault();

            $('#china_receive_form .result-search').children().remove();
            let cn_code = $('#china_receive_form #cn_code_search').val();

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

        $(document).on('click', '#china_receive_form .search-item', function (e)
        {
            e.preventDefault();
            let id = $(this).attr('data-id');
            window.location.href = '/admin/transport_order_items/'+id+'/edit';
        });

        $(document).on('click', function (e)
        {
            $('#china_receive_form .result-search').children().remove();
        });
    }
});