<div class="search">
    <form id="search-form" action="{{ route('customer.search') }}" method="GET">
        <div class="col-md-12 mg-auto">
            <div class="row">
                <div class="col-md-6">
                    <div class="input-group mb-2">
                        <div class="col-md-3">
                            <label for="">Mã vận đơn TQ</label>
                        </div>
                        <div class="col-md-9">
                            <input type="text" 
                                name="cn_code" 
                                class="form-control input-xs" 
                                placeholder="Mã vận đơn TQ"
                                value="{{ request('cn_code') }}">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group mb-2">
                        <div class="col-md-3">
                            <label for="">Mã khách hàng</label>
                        </div>
                        <div class="col-md-9">
                            <input type="text" 
                                name="username" 
                                class="form-control input-xs" 
                                placeholder="Mã khách hàng"
                                value="{{ request('username') }}">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="input-group mb-2">
                        <div class="col-md-3">
                            <label for="">Ngày bắt đầu </label>
                        </div>
                        <div class="col-md-9">
                            <input type="date" 
                                id="start_date" 
                                name="start_date" 
                                class="form-control input-xs" 
                                placeholder="Ngày bắt đầu"
                                value="{{ request('start_date') }}">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group mb-2">
                        <div class="col-md-3">
                            <label for="">Ngày kết thúc </label>
                        </div>
                        <div class="col-md-9">
                            <input type="date" 
                                id="end_date"
                                name="end_date" 
                                class="form-control input-xs" 
                                placeholder="Ngày kết thúc"
                                value="{{ request('end_date') }}">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">

                    <hr>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Tìm kiếm</button>
                    <a type="reset" class="btn btn-secondary" href="/"><i class="fas fa-redo-alt"></i> Đặt lại</a>
                </div>
            </div>
        </div>
    </form>
</div>

<div class="container-fluid mg-t-20">
    <div class="table-responsive">
      <table class="table table-bordered" id="tbl_search_result">
        <thead>
            <tr>
                <th class="text-center">STT</th>
                <th class="text-center">Mã vận đơn TQ</th>
                <th class="text-center">Mã khách hàng</th>
                <th class="text-center">Cân nặng (kg)</th>
                <th class="text-center">Chiều dài (cm)</th>
                <th class="text-center">Chiều rộng (cm)</th>
                <th class="text-center">Chiều cao (cm)</th>
                <th class="text-center">Tiền ứng kéo (Tệ)</th>
                <th class="text-center">Về kho TQ</th>
                <th class="text-center">Về kho VN</th>
                <th class="text-center">Xuất kho</th>
            </tr>
        </thead>
        <tbody class="text-center">
            @if(isset($orderItem) && !empty($orderItem) && $orderItem->count() > 0)
                @foreach($orderItem as $key => $item)
                    <tr>
                        <td>{{ $key + 1 }}</td>
                        <td>{{ $item['cn_code'] }}</td>
                        <td>{{ $item->customer_name ?? null }}</td>
                        <td>{{ $item->kg }}</td>
                        <td>{{ $item->product_length }}</td>
                        <td>{{ $item->product_width }}</td>
                        <td>{{ $item->product_height }}</td>
                        <td>{{ $item->advance_drag }}</td>
                        <td>
                            <span class="badge {{ $item['warehouse_cn'] == 1 ? 'bg-green' : 'bg-red'  }}">
                                {{ $item['warehouse_cn'] == 1 ? 'Đã về kho' : 'Chưa về kho'  }}
                            </span>
                            <p>{{ $item['warehouse_cn_date'] ? date('H:i / d-m-Y', strtotime($item['warehouse_cn_date'])) : ''  }}</p>
                        </td>
                        <td>
                            <span class="badge {{ $item['warehouse_vn'] == 1 ? 'bg-green' : 'bg-red'  }}">
                                {{ $item['warehouse_vn'] == 1 ? 'Đã về kho' : 'Chưa về kho'  }}
                            </span>
                            <p>{{ $item['warehouse_vn_date'] ? date('H:i / d-m-Y', strtotime($item['warehouse_vn_date'])) : ''  }}</p>
                        </td>
                        <td>
                            <span class="badge {{ $item['is_payment'] == 1 ? 'bg-green' : 'bg-red'  }}">
                                {{ $item['is_payment'] == 1 ? 'Đã xuất' : 'Chưa xuất'  }}
                            </span>
                            <p>{{ $item['is_payment'] == 1 ? date('H:i / d-m-Y', strtotime($item->order->created_at)) : ''  }}</p>
                        </td>
                    </tr>
                @endforeach
            @else
                <td colspan="11">Không có dữ liệu (Nhập dữ liệu để tìm kiếm mã vận đơn)</td>
            @endif
        </tbody>
      </table>
    </div>
  </div>