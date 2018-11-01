<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Validator;

class LoginController extends Controller {
    // login form
    function login() {
        return view('login/form');
    }

    // log out
    function logout() {
        
    }

    // athenticate user id and pwd
    function auth() {
        
    }

}
