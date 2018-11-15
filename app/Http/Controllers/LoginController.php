<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Validator;
use Illuminate\Support\Facades\Auth;
use App\Models\Pengguna;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller {
    // login form
    function login() {
        return view('login/form');
    }

    // log out
    function logout() {
        DB::connection('mysql2')
                ->table('sso')
                ->where('user_id',Auth::user()->id)
                ->delete();
        Auth::logout();
        return redirect('login');
    }

    // athenticate user id and pwd
    function auth(Request $req) {
        $userid = $req->input('userid');
        $password = $req->input('password');
        if(Auth::attempt(['userid' => $userid, 'password' => $password])) {
            // auth success
            $hash = Hash::make(date('Y-m-d H:i:s'));
            $hash = str_replace('/', '', $hash);
            DB::connection('mysql2')->table('sso')->insert([
                'user_id' => Auth::user()->id,
                'session_id' => $hash
            ]);
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
            //Auth::guard('abc');
            //if (Auth::guard('abc')->attempt(['nokp'=>'1234'])) {
                Auth::guard('abc')->login($p);
                //var_dump(Auth::guard('abc')->check());
                //var_dump(Auth::guard('abc')->user());exit;
                return redirect('home2');
            //} else {
            //    echo 'login prob';
            //}
        } else {
            echo 'ko';
        }
    }

}
