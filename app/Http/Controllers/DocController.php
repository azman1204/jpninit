<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Edoc;
use Illuminate\Support\Facades\Auth;
use Validator;

class DocController extends Controller {
    // form
    function form($id_cat) {
        $doc = new Edoc();
        return view('edoc/form', compact('doc','id_cat'));
    }

    // edit
    function edit($id) {
        $art = Article::find($id);
        return view('article/form', compact('art'));
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
        // validation
        $v = Validator::make($req->all(), Edoc::rules(), Edoc::messages());
        if ($v->fails()) {
            return view('edoc/form', compact('doc'))->withErrors($v);
        }

        $doc->save();
        return redirect('edoc/list/'.$doc->id_cat);
    }

    // delete
    function delete($id) {
        return redirect('article/list');
    }

}
