<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title uppercase">Thanh toán đơn hàng thành công</h4>
      </div>
      <div class="modal-body">
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td>Mã đơn hàng</td>
                    <td>{{ $order_raw->order_number ?? "" }}</td>
                </tr>
                <tr>
                    <td>Tổng tiền thanh toán</td>
                    <td>{{ isset($order_raw->final_total_price) ? number_format($order_raw->final_total_price) : "" }} VND</td>
                </tr>
                <tr>
                    <td>Khách hàng thanh toán</td>
                    <td>{{ isset($order_raw->paymentCustomer->name) ? $order_raw->paymentCustomer->name : "" }}</td>
                </tr>
                <tr>
                    <td>Số dư</td>
                    <td>{{ isset($order_raw->paymentCustomer->wallet) ? number_format($order_raw->paymentCustomer->wallet) : "" }} VND</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                      @php
                        $route = '#';
                        if (isset($order_raw->paymentCustomer->id)) {
                          $route = route('customers.recharge', $order_raw->paymentCustomer->id);
                        }  
                      @endphp
                      <button data-href="{{ $route }}" class="btn btn-sm btn-success" id="btn-recharge">
                        <i class="fa fa-plus"></i> &nbsp;
                        Cộng tiền vào ví
                      </button>
                    </td>
                </tr>
            </tbody>
        </table>
      </div>
    </div>

  </div>
</div>