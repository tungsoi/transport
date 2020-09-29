<div class="search">
    <form id="search-form" action="{{ route('customer.search') }}" method="GET">
        <div class="col-md-12 mg-auto" style="margin: 15px;">
            <div class="row">
                
                <div class="form-group" style="padding-right: 15px; width: 20%;">
                    <label for="cn_code">Mã vận đơn</label>
                    <input type="text" 
                        name="cn_code" 
                        class="form-control input-xs" 
                        placeholder="Nhập nội dung"
                        value="{{ request('cn_code') }}">
                </div>

                <div class="form-group" style="padding-right: 15px; width: 20%;">
                    <label for="">Mã khách hàng</label>
                    <input type="text" 
                        name="username" 
                        class="form-control input-xs" 
                        placeholder="Mã khách hàng"
                        value="{{ request('username') }}">
                </div>   
                
                <div class="form-group" style="padding-right: 15px; width: 30%">
                    <label for="">Ngày về kho Trung Quốc</label>
                    <div class="row">
                        <div class="col-md-6" style="padding-right: 1px">
                            <input type="text" 
                            id="warehouse_cn_date_begin"
                            name="warehouse_cn_date_begin" 
                            class="form-control input-xs" 
                            placeholder="{{ isset($data['warehouse_cn_date_begin']) ? $data['warehouse_cn_date_begin'] : "Nhỏ nhất" }}"
                            value="{{ isset($data['warehouse_cn_date_begin']) ?? "" }}">
                        </div>
                        <div class="col-md-6" style="padding-left: 1px;">
                            <input type="text" 
                            id="warehouse_cn_date_finish"
                            name="warehouse_cn_date_finish" 
                            class="form-control input-xs"
                            value="{{ isset($data['warehouse_cn_date_finish']) ?? "" }}"
                            placeholder="{{ isset($data['warehouse_cn_date_finish']) ? $data['warehouse_cn_date_finish'] : "Lớn nhất" }}">
                        </div>
                    </div>
                </div>   

                <div class="form-group" style="padding-right: 15px; width: 30%;">
                    <label for="">Ngày về kho Việt Nam</label>
                    <div class="row">
                        <div class="col-md-6" style="padding-right: 1px">
                            <input type="text" 
                            id="warehouse_vn_date_begin"
                            name="warehouse_vn_date_begin" 
                            class="form-control input-xs" 
                            value="{{ isset($data['warehouse_vn_date_begin']) ?? "" }}"
                            placeholder="{{ isset($data['warehouse_vn_date_begin']) ? $data['warehouse_vn_date_begin'] : "Nhỏ nhất" }}">
                        </div>
                        <div class="col-md-6" style="padding-left: 1px">
                            <input type="text" 
                            id="warehouse_vn_date_finish"
                            name="warehouse_vn_date_finish" 
                            class="form-control input-xs" 
                            value="{{ isset($data['warehouse_vn_date_finish']) }}"
                            placeholder="{{ isset($data['warehouse_vn_date_finish']) ? $data['warehouse_vn_date_finish'] : "Lớn nhất" }}">
                        </div>
                    </div>
                </div>   
            </div>
            <div class="row">
                <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Tìm kiếm</button>
                <a type="reset" class="btn btn-secondary" href="/"><i class="fas fa-redo-alt"></i> Đặt lại</a>
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
                <th class="text-center">Ngày về kho TQ</th>
                <th class="text-center">Ngày về kho VN</th>
                <th class="text-center">Ngày xuất kho</th>
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