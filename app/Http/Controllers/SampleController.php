<?php
namespace App\Http\Controllers;
class SampleController extends Controller {
    function first() {
        return "My First content from controller";
    }
    
    function second() {
        // call view with data
        $arr = ['warna' => 'Biru', 'jantina' => 'Lelaki'];
        $no = [1,2,3,4,5];
        $tkh = date('d/m/Y H:i:s');
        return view('hola', compact('tkh', 'no'))
                ->with('nama', 'Azman')
                ->with('alamat', 'Puchong')
                ->withUmur(25)
                ->with($arr);
    }
    
    // $id = mesti sama seperti dalam route {id}
    function third($id, $nama = '') {
        return "ID Pengguna = $id dan nama = $nama";
    }
} 

