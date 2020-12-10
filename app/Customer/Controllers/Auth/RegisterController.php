<?php

namespace App\Customer\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\District;
use App\Models\Province;
use App\User;
use Encore\Admin\Facades\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller {
    public function register() {
        if (Admin::user()) {
            return redirect()->route('admin.home');
        }

        $provinces = Province::all();
        $districts = District::all();

        return view('customer.auth.register', compact('provinces', 'districts'));
    }

    public function postRegister(Request $request) {
        $this->validator($request->all())->validate();
        $data = $request->all();

        $user = User::create([
            'username'  =>  $data['email'],
            'password'  =>  bcrypt($data['password']),
            'name'      =>  $data['symbol_name'],
            'email'     =>  $data['email'],
            'phone_number'  =>  $data['mobile'],
            'wallet'    =>  0,
            'is_customer'   =>  1,
            'symbol_name'   =>  $data['symbol_name'],
            'ware_house_id' =>  null,
            'is_active' =>  1,
            'address'  =>   $data['address'],
            'province'  =>  $data['province'],
            'district'  =>  $data['district']
        ]);

        DB::connection('aloorder')->table('admin_role_users')->insert([
            'user_id'   =>  $user->id,
            'role_id'   =>  2
        ]);

        DB::connection('alilogi')->table('admin_role_users')->insert([
            'user_id'   =>  $user->id,
            'role_id'   =>  2
        ]);

        return redirect()->route('admin.login')->with('register', 'Đăng ký thành công');
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'symbol_name' => 'required|unique:admin_users,symbol_name',
            'email' => 'email|unique:admin_users,email',
            'password' => 'required|required_with:password_confirmation|same:password_confirmation',
            'mobile'    =>  'required'
        ]);
    }
}