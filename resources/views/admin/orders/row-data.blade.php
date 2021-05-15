@if (isset($items) && sizeof($items) > 0)

@foreach ($items as $item)
<tr data-key="{{ $item['key'] }}" class="">
    <td class="column-order.order_number">
        <span class="label label-primary">{{ $item['order_number'] }}</span> <br> <br> 
        <span class="label label-info">{{ $item['symbol_name'] }}</span>
    </td>
    <td class="column-status">
    <span class="label label-{{ App\Models\Aloorder\OrderItem::LABEL[$item['status']] }}">{{ App\Models\Aloorder\OrderItem::STATUS[$item['status']] }}</span><br> <br><b><a href="{{ $item['product_link'] }}" target="_blank"> Link sản phẩm </a></b>
    </td>
    <td class="column-created_at">{{ $item['created_at'] }}</td>
    <td class="column-product_image">
        <img src="{{ "https://aloorder.vn/storage/admin/".$item['product_image'] }}" alt="" width="100px" class="product-image" style="cursor: pointer">
    </td>
    <td class="column-product_size">{{ $item['product_size'] }}</td>
    <td class="column-product_color">{{ $item['product_color'] }}</td>
    <td class="column-qty">{{ $item['qty'] }}</td>
    <td class="column-qty_reality">{{ $item['qty_reality'] }}</td>
    <td class="column-price">{{ $item['price'] }}</td>
    <td class="column-purchase_cn_transport_fee">{{ $item['purchase_cn_transport_fee'] }}</td>
    <td class="column-total_price">{{ $item['total_price'] }}</td>
    <td class="column-weight">{{ $item['weight'] }}</td>
    <td class="column-weight_date">{{ $item['weight_date'] }}</td>
    <td class="column-cn_code">{{ $item['cn_code'] }}</td>
    <td class="column-cn_order_number">{{ $item['cn_order_number'] }}</td>
    <td class="column-customer_note">{{ $item['customer_note'] }}</td>
    <td class="column-admin_note">{{ $item['admin_note'] }}</td>
    <td class="column-__actions__">
        <a class="grid-row-edit btn btn-primary btn-xs btn-confirm-receive-vietnam" target="_blank" data-id="{{ $item['key'] }}">
            <i class="fa fa-check"></i> &nbsp; Xác nhận đã về kho VN
       </a>
    </td>
 </tr>

@endforeach

@endif


<script>
    $(document).on('click', '.product-image', function () {
        $(this).parent().dialog();
    })
</script>