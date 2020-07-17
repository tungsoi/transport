<?php

namespace App\Customer\Controllers\Auth;

use App\Http\Controllers\Controller;

class LoginController extends Controller {
    public function login() {
        return view('customer.auth.login');
    }
}