<?php
namespace App\Http\Controllers;

class StaffController extends Controller {
    public function search() {
        return view('staff.search');
    }
    
    public function view() {
        return view('staff.view');
    }
}