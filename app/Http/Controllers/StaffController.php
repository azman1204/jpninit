<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Pengguna;

class StaffController extends Controller {
    public function search(Request $req) {
        if($req->has('nama')) {
            // on click btn search
            $p = Pengguna::all();
            return view ('staff.search', compact('p'));
        } else {
            // user click on menu staff dir
            return view('staff.search');
        }
    }
    
    public function view() {
        return view('staff.view');
    }
}