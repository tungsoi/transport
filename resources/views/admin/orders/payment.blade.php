<style>
    #payment_form {
        background: white;
        border-top-color: #00c0ef;
        border-top: 3px solid #00c0ef;
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
        font-size: 10px;
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
</style>
<div class="col-lg-12" id="payment_form">
<form action="{{ route('transport_orders.paymentTransportOrder') }}" method="POST"  enctype="multipart/form-data" class="form js-form-update-transport-order" id="frm-payment">
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
                            <th class="uppercase">Cân nặng (kg)</th>
                            <th class="uppercase">Dài (cm)</th>
                            <th class="uppercase">Rộng (cm)</th>
                            <th class="uppercase">Cao (cm)</th>
                            <th class="uppercase">Mét khối</th>
                            <th class="uppercase">V / 6000</th>
                            <th class="uppercase">Ứng / kéo (Tệ)</th>
                            <th class="uppercase"></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="stt">
                                    <span class="stt">1</span>
                                </td>
                                <td>
                                    <input type="hidden" name="item_id[]">
                                    <input type="text" name="cn_code[]" class="form-control cn_code" placeholder="Nhập mã vận đơn" autofocus required="required">
                                </td>
                                <td>
                                    <input type="text" name="customer_name[]" class="form-control" placeholder="Nhập tên khách hàng">
                                </td>
                                <td>
                                    <select id="" class="form-control payment_type" name="payment_type[]">
                                        <option value="1" selected>Khối lượng</option>
                                        <option value="0">V/6000 (DxRxC/6.000)</option>
                                        <option value="-1">Mét khối (DxRxC/1.000.000)</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="text" name="kg[]" class="form-control" placeholder="Nhập cân nặng" value="0" >
                                </td>
                                <td>
                                    <input type="number" name="product_length[]" class="form-control" placeholder="Nhập chiều dài" value="0" >
                                </td>
                                <td>
                                    <input type="number" name="product_width[]" class="form-control" placeholder="Nhập chiều rộng" value="0" >
                                </td>
                                <td>
                                    <input type="number" name="product_height[]" class="form-control" placeholder="Nhập chiều cao" value="0" >
                                </td>
                                <td>
                                    <input type="text" name="product_cublic_meter[]" class="form-control product_cublic_meter" placeholder="Thể tích" value="0" >
                                </td>
                                <td>
                                    <input type="text" name="product_volumn[]" class="form-control product_volumn" placeholder="Thể tích" value="0" >
                                </td>
                                <td>
                                    <input type="text" name="advance_drag[]" class="form-control advance_drag" placeholder="Nhập ứng kéo" >
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
                                    <select id="" class="form-control discount_type" name="discount_type[]">
                                        <option value="1" selected>Giảm đi</option>
                                        <option value="0">Tăng lên</option>
                                    </select>
                                </td>
                                <td align="center" style="width: 30%">
                                    <select id="" class="form-control discount_method" name="discount_method[]">
                                        <option value="1" selected>Khối lượng</option>
                                    </select>
                                </td>
                                <td align="right"  style="width: 40%">                                        
                                    <input type="number" name="discount_kg" class="form-control discount_kg" placeholder="Nhập giá trị" value="" >
                                </td>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="table-responsive col-lg-12" style="margin-top: 20px">
                    <label for="" class="uppercase">Chi tiết thanh toán <h5>(Tỷ giá hiện tại: 1 tệ = {{ $vnd }} VND)</h5></label>
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
            <button type="submit" class="btn btn-primary js-button-submit" id="btnSubmit">Thanh toán</button>
            <a href="" class="btn btn-default" data-dismiss="modal">Quay lại</a>
        </div>
    </form>
</div>

<input type="hidden" class="exchange_rate" name="exchange_rate" value="{{ $vnd ?? 0 }}">
<script type="text/javascript" src="https://unpkg.com/default-passive-events"></script>


<script src="{{ asset('rongdo/autoNumeric42.js') }}"></script>
<script !src="">
    function GetURLParameter(sParam) {
       var sPageURL = window.location.search.substring(1);
       var sURLVariables = sPageURL.split('&');
       for (var i = 0; i < sURLVariables.length; i++){
           var sParameterName = sURLVariables[i].split('=');
           if (sParameterName[0] == sParam)
           {
               return sParameterName[1];
           }
       }
   }

   var tech = GetURLParameter('payment_in_list_code');
   if (tech != undefined)
   {
       var res = tech.split(",");
       res = jQuery.grep(res, function(n){ return (n); });

       for (var i = 0; i < res.length; i++)
       {
           cloneTr();
           let input = $('input[name="cn_code[]"]').eq(i);
           let parent = input.parent();
           let tr = input.parent().parent();
           $('input[name="cn_code[]"]').eq(i).val(res[i]);
           let stt = i;
           $.ajax({
               type: 'GET',
               url: '/admin/transport-orders/get-data-transport-order-items',
               data: {cn_code: res[i], isPayment: 1},
               success: function(response) {
                   if (response && response.status != false) {
                       parent.find('.error').remove();
                       // console.log(stt);
                       tr.children().find('.stt').text(stt+1);
                       tr.children().find('input[name="item_id[]"]').val(response.id);
                       tr.children().find('input[name="customer_name[]"]').val(response.customer_name);
                       tr.children().find('input[name="kg[]"]').val(response.kg);
                       tr.children().find('input[name="product_length[]"]').val(response.product_length);
                       tr.children().find('input[name="product_width[]"]').val(response.product_width);
                       tr.children().find('input[name="product_height[]"]').val(response.product_height);
                       tr.children().find('input[name="advance_drag[]"]').val(response.advance_drag);
                       tr.children().find('input[name="product_volumn[]"]').val(response.product_volumn);
                       tr.children().find('input[name="product_cublic_meter[]"]').val(response.product_cublic_meter);
                       
                       checkCustomer();
                       handle();
                   } 
               }
           });
       }
   }

   var exchange_rate = Number( $('.exchange_rate').val());

   $(document).on('keyup', 'input[name="kg[]"]', function (e)
   {
       handle();
   });

   $(document).on('keyup', 'input[name="product_length[]"]', function (e)
   {
       changeVolumnAndCublicMeter($(this));
       handle();
   });

   $(document).on('keyup', 'input[name="product_height[]"]', function (e)
   {
       changeVolumnAndCublicMeter($(this));
       handle();
   });

   $(document).on('keyup', 'input[name="product_width[]"]', function (e)
   {
       changeVolumnAndCublicMeter($(this));
       handle();
   });

   function changeVolumnAndCublicMeter(ele)
   {
       var parent = ele.parent().parent();
       var length = parent.children().find('input[name="product_length[]"]').val();
       var width = parent.children().find('input[name="product_width[]"]').val();
       var height = parent.children().find('input[name="product_height[]"]').val();

       var volumn = parseFloat(( Number (length) * Number (width) * Number (height) ) / 6000).toFixed(4);
       var cublic_meter =  parseFloat(( Number (length) * Number (width) * Number (height) ) / 1000000).toFixed(4);

       parent.children().find('input[name="product_volumn[]"]').val(volumn);
       parent.children().find('input[name="product_cublic_meter[]"]').val(cublic_meter);
   }

   $(document).on('keydown','.cn_code', function(e) {
       if (e.which == 13) {
           e.preventDefault();
           var pastedData = $(this).val();
           var tr = $(this).parent().parent();
           var parent = $(this).parent();

           let codearr = $('.cn_code');
           let flag = 0;
           for (let v = 0; v <= codearr.length; v++)
           {
               if (pastedData == codearr.eq(v).val() && codearr.eq(v).val() != "")
               {   
                   flag++;
                   
               }

               if (flag >= 2)
               {
                   $(this).parent().find('.error').remove();
                   $(this).parent().append('<span class="error">Mã vận đơn đã được dùng, không được sử dụng lại.</span>');
                   $(this).focus();
                   $('.js-button-submit').attr('disabled', 'disabled');
                   return false;
               }
           }

           $.ajax({
               type: 'GET',
               url: '/admin/transport_orders/get-data-transport-order-items',
               data: {cn_code: pastedData, isPayment: 1},
               success: function(response) {
                   if (response && response.status != false) {
                       parent.find('.error').remove();
                       fillData(response, tr);
                       checkCustomer();
                       cloneTr();
                       handle();
                   } else {
                       parent.find('.error').remove();
                       parent.append('<span class="error"> Mã vận đơn không đúng hoặc chưa về kho HN hoặc đã được thanh toán</span>')
                       resetTrChildren(tr);
                   }
               }
           });

           return false;
       }
   });

   function checkCustomer()
   {
       $('#tbl-orders').parent().find('.error').remove();
       var input =  $('input[name="customer_name[]"]');
       var temp = true;

       for ($i = 0; $i < input.length; $i++)
       {
           for ($y = 1; $y < input.length; $y++)
           {
               if (input.eq($i).val() != "" && input.eq($y).val() != "" && input.eq($i).val() != input.eq($y).val())
               { 
                   temp = false;
                   break;
                   
                   
               }

           }
       }

       if (temp)
       {
           $('#tbl-orders').parent().find('.error').remove();
           $('#btnSubmit').removeAttr('disabled');
       } else {
           $('#btnSubmit').attr('disabled', 'disabled');
           $('#tbl-orders').parent().append('<span class="error">Khách hàng không giống nhau. Không thể thanh toán.</span>');
       }
   }

   function handle()
   {
       handleKg();
       handleVolumn();
       handleCublicMeter();
       handleAdvance();
       total_money();
   }

   function cloneTr()
   {
       var clone = $('#tbl-orders tbody tr').last().clone();
       clone.children().find('.stt').text($('#tbl-orders tbody tr').length+1);

       // console.log($('#tbl-orders tbody tr').length);
       clone.children().find('input[name="cn_code[]"]').val("");
       clone.children().find('input[name="item_id[]"]').val("");
       clone.children().find('input[name="customer_name[]"]').val("");
       clone.children().find('input[name="kg[]"]').val("");
       clone.children().find('input[name="product_length[]"]').val(0);
       clone.children().find('input[name="product_width[]"]').val(0);
       clone.children().find('input[name="product_height[]"]').val(0);
       clone.children().find('input[name="advance_drag[]"]').val("");
       clone.children().find('input[name="product_volumn[]"]').val(0);
       clone.children().find('input[name="product_cublic_meter[]"]').val(0);
       clone.appendTo('#tbl-orders tbody');
       clone.find('.cn_code').focus();
   }

   function resetTrChildren(tr)
   {
       tr.children().find('input[name="item_id[]"]').val("");
       tr.children().find('input[name="customer_name[]"]').val("");
       tr.children().find('input[name="kg[]"]').val("");
       tr.children().find('input[name="product_length[]"]').val(0);
       tr.children().find('input[name="product_width[]"]').val(0);
       tr.children().find('input[name="product_height[]"]').val(0);
       tr.children().find('input[name="advance_drag[]"]').val("");
       tr.children().find('input[name="product_volumn[]"]').val(0);
       tr.children().find('input[name="product_cublic_meter[]"]').val(0);
   }

   function fillData(response, tr)
   {
       tr.children().find('input[name="item_id[]"]').val(response.id);
       tr.children().find('input[name="customer_name[]"]').val(response.customer_name);
       tr.children().find('input[name="kg[]"]').val(response.kg);
       tr.children().find('input[name="product_length[]"]').val(response.product_length);
       tr.children().find('input[name="product_width[]"]').val(response.product_width);
       tr.children().find('input[name="product_height[]"]').val(response.product_height);
       tr.children().find('input[name="advance_drag[]"]').val(response.advance_drag);
       tr.children().find('input[name="product_volumn[]"]').val(response.product_volumn);
       tr.children().find('input[name="product_cublic_meter[]"]').val(response.product_cublic_meter);
   }

   $(document).on('keydown', function(e) {
       if (e.which == 13) {
           e.preventDefault();
       }
   });

   $(function() {
       // new AutoNumeric.multiple('.advance_drag', {
       //     decimalPlaces: 0
       // });

        new AutoNumeric.multiple('.sum_kg', {
            decimalPlaces: 0
        });

        new AutoNumeric.multiple('.sum_volumn', {
            decimalPlaces: 0
        });

        new AutoNumeric.multiple('.total_kg', {
            decimalPlaces: 0
        });

        new AutoNumeric.multiple('.sum_cublic_meter', {
            decimalPlaces: 0
        });
   });

   function handleKg()
   {
       var input = $('.payment_type');
       var sum = 0;
       for ($i = 0; $i < input.length; $i++)
       {
           var ele = input.eq($i);
           var value = ele.val();

           if (value == 1)
           {
               var parent = ele.parent().parent();
               var ele_kg = parent.children().find('input[name="kg[]"]');
               var value_kg = ele_kg.val();

               sum += Number(value_kg);
           }
       }

       $('.lb-sum-kg').html(sum);
       $('.count-kg').val(sum);
       
       // thanh tien
       var price = $('.sum_kg').val();
       price = parseFloat(price.replace(/,/g, ''));

       var total_kg = Number(sum) * Number(price);

       $('.total_kg').val(total_kg);

       new AutoNumeric.multiple('.total_kg', {
           decimalPlaces: 0
        });

   }

   function handleAdvance()
   {
       var input = $('.advance_drag');
       var sum = 0;
       for ($i = 0; $i < input.length; $i++)
       {
           var ele = input.eq($i);
           var value = ele.val();

           var parent = ele.parent().parent();
           var ele_kg = parent.children().find('input[name="advance_drag[]"]');
           var value_kg = ele_kg.val();

           value_kg = parseFloat(value_kg.replace(/,/g, ''));

           if (!isNaN(value_kg))
           {
               sum += value_kg;
           }
           // if (value_kg != undefined || value_kg != null)
           // {
           //     sum += value_kg;
           // }
       }   

       sum *= exchange_rate;

       // console.log(sum);
       
       $('.advan').html(sum);
       // $('.count-kg').val(sum);
       
       // thanh tien
       // var price = $('.sum_kg').val();
       // price = parseFloat(price.replace(/,/g, ''));

       // var total_kg = Number(sum) * Number(price);

       // $('.total_kg').val(total_kg);

       new AutoNumeric.multiple('.advan', {
           decimalPlaces: 0
       });
   }

   function handleVolumn()
   {
       var input = $('.payment_type');
       var sum = 0;
       for ($i = 0; $i < input.length; $i++)
       {
           var ele = input.eq($i);
           var value = ele.val();

           if (value == 0)
           {
               var parent = ele.parent().parent();
               var ele_volumn = parent.children().find('input[name="product_volumn[]"]');
               var value_volumn = ele_volumn.val();

               sum += Number(value_volumn);
           }
       }

       $('.lb-sum-volumn').html(sum);
       $('.count-volumn').val(sum);

        // thanh tien
       var price = $('.sum_volumn').val();
       price = parseFloat(price.replace(/,/g, ''));

       var total_volumn = Number(sum) * Number(price);

       $('.total_volumn').val(total_volumn);

       new AutoNumeric.multiple('.total_volumn', {
           decimalPlaces: 0
       });
   }

   function handleCublicMeter()
   {
       var input = $('.payment_type');
       var sum = 0;
       for ($i = 0; $i < input.length; $i++)
       {
           var ele = input.eq($i);
           var value = ele.val();

           if (value == -1)
           {
               var parent = ele.parent().parent();
               var ele_meter = parent.children().find('input[name="product_cublic_meter[]"]');
               var value_meter = ele_meter.val();

               sum += Number(value_meter);
           }
       }

       $('.lb-sum-cublic-meter').html(sum);
       $('.count-cublic-meter').val(sum);

        // thanh tien
       var price = $('.sum_cublic_meter').val();
       price = parseFloat(price.replace(/,/g, ''));

       var total_cublic_meter = Number(sum) * Number(price);

       $('.total_cublic_meter').val(total_cublic_meter);

       new AutoNumeric.multiple('.total_cublic_meter', {
           decimalPlaces: 0
       });
   }

     $(document).on('click', '.btnRemoveItem', function (e){
       // $(this).parent().parent().remove();
       var tr = $('#tbl-orders tr');
       var code = $(this).parent().parent().children().find('.cn_code').val();
       
       if (tr.length > 2)
       {
           var par = $(this).parent().parent();
           // 

           par.remove();
       }  
       if (code != "")
       {
           resetTotalDiv();
           handle();
       }

       checkCustomer();
     });

     $(document).on('change', '.payment_type', function(e) {
       handle();
     });

     $(document).on('keyup', '.sum_kg', function (e)
     {
       total_kg();
     });

     $(document).on('keyup', '.sum_volumn', function (e)
     {
       total_volumn();
     });

     $(document).on('keyup', '.sum_cublic_meter', function (e)
     {
       total_cublic_meter();
     });

     function total_kg()
     {
       var sum_kg = $('.lb-sum-kg').html();
       sum_kg = parseFloat(sum_kg);

       var price = $('.sum_kg').val();
       price = parseFloat(price.replace(/,/g, ''));

       var total_kg = Number(sum_kg) * Number(price);

       $('.total_kg').val(total_kg);

       new AutoNumeric.multiple('.total_kg', {
           decimalPlaces: 0
       });

       total_money();
     }

     function total_cublic_meter()
     {
       var sum_cublic_meter = $('.lb-sum-cublic-meter').html();
       sum_cublic_meter = parseFloat(sum_cublic_meter);

       var price = $('.sum_cublic_meter').val();
       price = parseFloat(price.replace(/,/g, ''));

       var total_cublic_meter = Number(sum_cublic_meter) * Number(price);

       $('.total_cublic_meter').val(total_cublic_meter);

       new AutoNumeric.multiple('.total_cublic_meter', {
           decimalPlaces: 0
       });

       total_money();
     }

     function total_volumn()
     {
       var sum_volumn = $('.lb-sum-volumn').html();
       sum_volumn = parseFloat(sum_volumn);

       var price = $('.sum_volumn').val();
       price = parseFloat(price.replace(/,/g, ''));

       var total_volumn = Number(sum_volumn) * Number(price);

       $('.total_volumn').val(total_volumn);

       new AutoNumeric.multiple('.total_volumn', {
           decimalPlaces: 0
       });

       total_money();
     }

     function total_money ()
     {
         var total_kg = $('.total_kg').val();
         
         if (total_kg == "")
         {
           total_kg = 0;
         } else {
           total_kg = parseFloat(total_kg.replace(/,/g, ''));
         }

         var total_volumn = $('.total_volumn').val();
         
         if (total_volumn == "")
         {
           total_volumn = 0;
         } else {
           total_volumn = parseFloat(total_volumn.replace(/,/g, ''));
         }

         var total_cublic_meter = $('.total_cublic_meter').val();
         
         if (total_cublic_meter == "")
         {
           total_cublic_meter = 0;
         } else {
           total_cublic_meter = parseFloat(total_cublic_meter.replace(/,/g, ''));
         }

         var total_advane = $('.advan').attr('value');
         
         if (total_advane == "")
         {
           total_advane = 0;
         } else {
           total_advane = parseFloat(total_advane.replace(/,/g, ''));
         }
         $('.advan').val(total_advane);

         var total_money = total_kg + total_volumn + total_cublic_meter + total_advane;

        $('.total_money').html(total_money);
        $('.total-money').val(total_money);

        new AutoNumeric.multiple('.total_money', {
           decimalPlaces: 0
       });
     }

     function total_advane()
     {
       
     }

     function resetTotalDiv()
     {
         $('.lb-sum-kg').html(0);
         $('.lb-sum-volumn').html(0);
         $('.lb-sum-cublic-meter').html(0);
         
         $('.total_kg').val("");
         $('.total_volumn').val("");
         $('.total_cublic_meter').val("");
         $('.total_money').html(0);
     }

     $('#btnSubmit').on('click', function (e)
     {
         e.preventDefault();
           var input =  $('input[name="cn_code[]"]');
           var temp = true;

           for ($i = 0; $i < input.length; $i++)
           {
               for ($y = 1; $y < input.length; $y++)
               {
                   if (input.eq($i).val() == "")
                   { 
                       input.eq($i).parent().parent().find('.btnRemoveItem').click();
                   }

               }
           }

           $('#frm-payment').submit();
     });

    $(document).on('keyup', 'input[name="discount_kg"]', function (e)
    {
        discount();
    });

   function discount ()
   {
       let discount_kg = $('input[name="discount_kg"]').val(); // giá trị giảm trừ
       let type = $('.discount_type').val(); // loại giảm trừ
       let total_kg = $('span[name="lb-sum-kg"]').html(); // tổng cân hiện tại

       var input = $('.payment_type');
       var sum = 0;
       let sum_kg = 0;
       let sum_volumn = 0;
       let sum_cublic_meter = 0;
       for ($i = 0; $i < input.length; $i++)
       {
           var ele = input.eq($i);
           var value = ele.val();

           if (value == 1) // kg
           {
               var parent = ele.parent().parent();
               var ele_kg = parent.children().find('input[name="kg[]"]');
               var value_kg = ele_kg.val();

               sum_kg += Number(value_kg);
           } else if (value == 0) // v/6000
           {
               var parent = ele.parent().parent();
               var ele_volume = parent.children().find('input[name="product_volumn[]"]');
               var value_kg = ele_kg.val();

               sum_volumn += Number(value_kg);
           } else { // m3
               var parent = ele.parent().parent();
               var ele_kg = parent.children().find('input[name="product_cublic_meter[]"]');
               var value_kg = ele_kg.val();

               sum_cublic_meter += Number(value_kg);
           }
       }

       if (type == '1') // giam
       {
           if ($('.discount_method').val() == 1) // kg
           {
               let total_kg_after_discount = (Number(sum_kg) - Number(discount_kg)).toFixed(1);
               $('.lb-sum-kg').html(total_kg_after_discount);
               $('.count-kg').val(total_kg_after_discount);
           } else if ($('.discount_method').val() == 0) // v/6000
           {
               let total_kg_after_discount = Number(sum_volumn) - Number(discount_kg);
               $('.lb-sum-volumn').html(total_kg_after_discount);
               $('.count-volumn').val(total_kg_after_discount);
           } else { // m3
               let total_kg_after_discount = Number(sum_cublic_meter) - Number(discount_kg);
               $('.lb-sum-cublic-meter').html(total_kg_after_discount);
               $('.count-cublic-meter').val(total_kg_after_discount);
           }

       } else if (type == '0') // tang
       {
           if ($('.discount_method').val() == 1) // kg
           {
               let total_kg_after_discount = (Number(sum_kg) + Number(discount_kg)).toFixed(1);
               $('.lb-sum-kg').html(total_kg_after_discount);
               $('.count-kg').val(total_kg_after_discount);
           } else if ($('.discount_method').val() == 0) // v/6000
           {
               let total_kg_after_discount = Number(sum_volumn) + Number(discount_kg);
               $('.lb-sum-volumn').html(total_kg_after_discount);
               $('.count-volumn').val(total_kg_after_discount);
           } else { // m3
               let total_kg_after_discount = Number(sum_cublic_meter) + Number(discount_kg);
               $('.lb-sum-cublic-meter').html(total_kg_after_discount);
               $('.count-cublic-meter').val(total_kg_after_discount);
           }
       }
   }

   $(document).on('change', '.discount_type', function (e)
   {
       resetTotalDiv();
       handle();
       discount();
   });

   $(document).on('change', '.discount_method', function (e)
   {
       resetTotalDiv();
       handle();
       discount();
   });
</script>