@extends('customer.layouts.master')
@section('content')
<div class="container" id="container-transport">
    <div class="row">
        <div class="col-md-3"></div>   
        <div class="col-md-6">
            <form action="/action_page.php" id="login-form">
                <h2 class="tx-center tx-heading uppercase">Đăng nhập</h2>
                <div class="form-group">
                    <input type="email" class="form-control" placeholder="Địa chỉ Email" id="email">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Mật khẩu" id="pwd">
                </div>
                <div class="form-group form-check">
                    <label class="form-check-label">
                        <input class="form-check-input" type="checkbox"> Ghi nhớ
                    </label>
                </div>
                <button type="button" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
            </form>
        </div>
    </div>
</div>
@endsection