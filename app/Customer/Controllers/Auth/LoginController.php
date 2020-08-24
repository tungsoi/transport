<?php

namespace App\Customer\Controllers\Auth;

use App\Http\Controllers\Controller;

class LoginController extends Controller {
    public function login() {
        return redirect()->route('admin.login');
    }
}