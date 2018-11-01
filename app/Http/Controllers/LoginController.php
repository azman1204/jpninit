<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Validator;
use Illuminate\Support\Facades\Auth;
use App\Models\Pengguna;

class LoginController extends Controller {
    // login form
    function login() {
        return view('login/form');
    }

    // log out
    function logout() {
        Auth::logout();
        return redirect('login');
    }

    // athenticate user id and pwd
    function auth(Request $req) {
        $userid = $req->input('userid');
        $password = $req->input('password');
        if(Auth::attempt(['userid' => $userid, 'password' => $password])) {
            // auth success
            return redirect('home');
        } else {
            // auth fail
            return view('login.form');
        }
    }
    
    function auth2() {
        $pwd = base64_encode(sha1('1234', true));
        $p = Pengguna::where('nokp', '1234')
                ->where('katalaluan',$pwd)->first();
        if ($p) {
            echo 'ok';
            Auth::login($p);
            return redirect('home2');
        } else {
            echo 'ko';
        }
    }

}
