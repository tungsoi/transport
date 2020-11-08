
    $(document).on('ready pjax:success', function() {
        var pathname = window.location.pathname;
        if (pathname == '/admin/transport_orders/vietnam_receives') {
            console.log('Vietnam receive !');
            $(document).on('keydown', '#vietnam_receive_form input[name="cn_code[]"]', function (e) {
                if (e.which == 13) {
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
                        url: '/api/search-order-item',
                        data: {cn_code: cn_code},
                        success: function(response) {
                            $('#purchase-order-table tbody').prepend(response);
                        }
                    });
                    
                    $.ajax({
                        type: 'GET',
                        url: '/admin/transport_orders/get-data-transport-order-items',
                        data: {cn_code: cn_code},
                        success: function(response) {

                            console.log(response);
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

                                // $(function() {
                                //     $('.advance_drag').autoNumeric();
                                // });
                            } else {
                                tr.children().find('input[name="cn_code[]"]').parent().append('<span class="error">Mã vận đơn không tổn tại</span>');
                            }
                        }
                    });

                    
                }
            });

            $(document).on('blur', '#vietnam_receive_form .js-cn-code-ip', function (e) {
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

            $(document).on('keydown','#vietnam_receive_form #tbl-orders input', function(e) {
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

                    // $(function() {
                    //     $('.advance_drag').autoNumeric();
                    // });
                }
            });

            $(document).on('keydown','#vietnam_receive_form .customer_name', function(e) {
                if (e.which == 13) {
                    e.preventDefault();
                    return false;
                }
            });

            // $(function() {
            //     $('.advance_drag').autoNumeric();
            // });

            $(document).on('click', '#vietnam_receive_form .btnRemoveItem', function (e){
                var tr = $('#tbl-orders tr');
                if (tr.length > 2) {
                    $(this).parent().parent().remove();
                }
            });

            $('#vietnam_receive_form form').on('focus', 'input[type=number]', function (e) {
                $(this).on('mousewheel.disableScroll', function (e) {
                    e.preventDefault()
                });
            });

            $('#vietnam_receive_form form').on('blur', 'input[type=number]', function (e) {
                $(this).off('mousewheel.disableScroll');
            });

            $('#vietnam_receive_form form').on('focus', 'input[type=text]', function (e) {
                $(this).on('mousewheel.disableScroll', function (e) {
                    e.preventDefault()
                });
            });

            $('#vietnam_receive_form form').on('blur', 'input[type=text]', function (e) {
                $(this).off('mousewheel.disableScroll');
            });
        }

        $(document).on('click', '.btn-confirm-receive-vietnam', function () {
            console.log('confirm');
            $(this).removeClass('btn-primary');
            $(this).addClass('btn-success');
            $(this).html('<i class="fa fa-check"></i> &nbsp; Đã xác nhận');
            $.ajax({
                type: 'POST',
                url: '/api/confirm-receive-vietnam',
                data: {
                    item_id: $(this).data('id')
                },
                success: function(response) {
                    if (response.error == false) {
                        toastr.success('Đã xác nhận hàng về kho Việt Nam thành công.');
                    } else {
                        alert('Xảy ra lỗi: ' + response.msg);
                    }
                }
            });
        });
    });