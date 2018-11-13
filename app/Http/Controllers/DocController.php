<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Edoc;
use Illuminate\Support\Facades\Auth;
use Validator;
use Illuminate\Support\Facades\Storage;

class DocController extends Controller {
    function view($id) {
        $doc = Edoc::find($id);
        return Storage::download('public/doc/'.$doc->hash_name, $doc->doc_name);
    }
    
    // form
    function form($id_cat) {
        $doc = new Edoc();
        return view('edoc/form', compact('doc','id_cat'));
    }

    // edit
    function edit($id) {
        $doc = Edoc::find($id);
        $id_cat = $doc->id_cat;
        return view('edoc/form', compact('doc', 'id_cat'));
    }

    // save
    function save(Request $req) {
        $id = $req->input('id');
        if (empty($id)) {
            // insert
            $doc = new Edoc();
        } else {
            // update
            $doc = Edoc::find($id);
        }
        $doc->name = $req->input('name');
        $doc->descr = $req->input('descr');
        $doc->id_cat = $req->input('id_cat');
        $doc->created_by = Auth::user()->id;
        
        if($req->file('doc')) {
            // default storage = storage/app
            $hname= $req->file('doc')->hashName();
            $oriname = $req->file('doc')->getClientOriginalName();
            $doc->doc_name = $oriname;
            $doc->hash_name = $hname;
            $req->file('doc')->store('public/doc');
        }
        
        // validation
        $v = Validator::make($req->all(), Edoc::rules(), Edoc::messages());
        if ($v->fails()) {
            $id_cat = $doc->id_cat;
            return view('edoc/form', compact('doc','id_cat'))->withErrors($v);
        }

        $doc->save();
        return redirect('edoc/list/'.$doc->id_cat);
    }
    
    // delete
    function delete($id) {
        $doc = Edoc::find($id);
        $doc->delete();
        return redirect('edoc/list/'.$doc->id_cat);
    }

}
