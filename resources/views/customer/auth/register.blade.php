@extends('customer.layouts.master')
@section('content')
<style>
    .error {
        color: red;
    }
    .help-block {
        color: red;
    }
    input {
        margin-bottom: 5px;
    }
    .option-hide {
        display: none;
    }
</style>
<div class="container" id="container-transport">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <form action="{{ route('customer.postRegister') }}" id="register-form" method="post">
                {{ csrf_field() }}
                <h2 class="tx-center tx-heading uppercase">Đăng ký</h2>
                
                <div class="form-group{{ $errors->has('symbol_name') ? ' has-error' : '' }}">
                    <label for="symbol_name" class="col-md-4 control-label">Mã khách hàng <span class="error">(*)</span></label>

                    <div class="col-md-12">
                        <input id="symbol_name" type="text" class="form-control" 
                            name="symbol_name" value="{{ old('symbol_name') }}" 
                            placeholder="VD: thuyanh234" autofocus>
                        
                        <i class="">
                            <i class="fa fa-info-circle" aria-hidden="true"></i> 
                            Mã khách hàng là mã khách ghi trên kiện hàng để kho có thể phân loại được. Mã khách hàng để bên cạnh tên người nhận tiếng trung.
                        </i> <br>

                        @if ($errors->has('symbol_name'))
                            <span class="help-block">
                                <strong>{{ $errors->first('symbol_name') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                    <label for="email" class="col-md-4 control-label">E-Mail  <span class="error">(*)</span></label>

                    <div class="col-md-12">
                        <input id="email" type="email" class="form-control" 
                            name="email" 
                            value="{{ old('email') }}" 
                            placeholder="VD: abc@gmail.com"
                            >

                        @if ($errors->has('email'))
                            <span class="help-block">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>
                
                <div class="form-group{{ isset($errors) && $errors->has('province') ? ' has-error' : '' }}">
                    <label for="address" class="col-md-4 control-label">Địa chỉ  <span class="error">(*)</span></label>
                    <div class="col-md-12">

                        <select name="province" id="province" class="form-control" value={{ old('province')}}>
                            <option value="" checked>{{ trans('admin.province') }}</option>
                            @foreach ($provinces as $province)
                                <option value="{{ $province->province_id }}">{{ $province->name }}</option>
                            @endforeach
                        </select>
                        @if (isset($errors) && $errors->has('province'))
                            <label id="province-error" class="error" for="province" >{{ $errors->first('province') }}</label>
                        @endif
                    </div>
                </div>

                <div class="form-group{{ isset($errors) && $errors->has('district') ? ' has-error' : '' }}">
                    <div class="col-md-12">
                        <select name="district" id="district" class="form-control">
                            <option value="" checked>{{ trans('admin.district') }}</option>
                            @foreach ($districts as $district)
                                <option value="{{ $district->district_id }}" class="option-hide" data-parent-province={{$district->province_id}}
                                    >{{ $district->name }}</option>
                            @endforeach
                        </select>
                        @if (isset($errors) && $errors->has('district'))
                            <label id="district-error" class="error" for="district">{{ $errors->first('district') }}</label>
                        @endif
                    </div>
                </div>

                <div class="form-group{{ $errors->has('address') ? ' has-error' : '' }}">
                   
                    <div class="col-md-12">
                        <input id="address" type="text" class="form-control" 
                            name="address" 
                            value="{{ old('address') }}" 
                            placeholder="Số nhà, tên đường"
                            >

                        @if ($errors->has('address'))
                            <span class="help-block">
                                <strong>{{ $errors->first('address') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <div class="form-group{{ $errors->has('mobile') ? ' has-error' : '' }}">
                    <label for="mobile" class="col-md-4 control-label">Số điện thoại  <span class="error">(*)</span></label>

                    <div class="col-md-12">
                        <input id="mobile" type="text" class="form-control" 
                            name="mobile" 
                            value="{{ old('mobile') }}" 
                            placeholder="..."
                            >

                        @if ($errors->has('mobile'))
                            <span class="help-block">
                                <strong>{{ $errors->first('mobile') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                    <label for="password" class="col-md-4 control-label">Mật khẩu  <span class="error">(*)</span></label>

                    <div class="col-md-12">
                        <input id="password" type="password" class="form-control" 
                            name="password" 
                            
                            placeholder="Mật khẩu">

                        @if ($errors->has('password'))
                            <span class="help-block">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <div class="form-group">
                    <label for="password-confirm" class="col-md-4 control-label">Mật khẩu xác nhận</label>

                    <div class="col-md-12">
                        <input id="password-confirm" type="password" 
                            class="form-control" 
                            name="password_confirmation" 
                            placeholder="Mật khẩu xác nhận"
                            >
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-6 col-md-offset-4">
                        <button type="submit" class="btn btn-primary">
                            Đăng ký
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection

@section('script')
<script>
    $(document).ready(function() {
        $('#province').on('change', function () {
            let province_id = $(this).val();
            $('#district option').removeClass("option-hide");
            $('#district option').addClass("option-hide");
            $('#district option[data-parent-province="'+province_id+'"]').removeClass("option-hide");
            console.log(province_id);
        });
    });
</script>
@endsection