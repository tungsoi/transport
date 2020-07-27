@if (Admin::user()->can('order.payment') )
<a href="{{ route('transport_orders.payments') }}" class="btn btn-sm btn-danger active"  target="_blank">
    <i class="fa fa-money"></i>
    <span class="hidden-xs">&nbsp;Thanh toán</span>
</a>
@endif