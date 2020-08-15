@extends('customer.layouts.master')
@section('content')
<div class="container" id="container-transport">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <form action="/action_page.php" id="register-form">
                <h2 class="tx-center tx-heading uppercase">Đăng ký</h2>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Họ và tên">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Biệt danh">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Địa chỉ email">
                </div>
                <div class="form-group">
                    <input type="pasword" class="form-control" placeholder="Mật khẩu">
                </div>
                <div class="form-group">
                    <input type="pasword" class="form-control" placeholder="Mật khẩu xác nhận">
                </div>
                <button type="button" class="btn btn-primary"><i class="fas fa-edit"></i> Đăng ký</button>
            </form>
        </div>
    </div>
</div>
@endsection