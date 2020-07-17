<?php

namespace App\Customer\Controllers\Auth;

use App\Http\Controllers\Controller;

class RegisterController extends Controller {
    public function register() {
        return view('customer.auth.register');
    }
}