<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Edoc;
use App\Models\EdocCat;
use Illuminate\Support\Facades\Auth;
use Validator;

class EdocController extends Controller {
    function editFolder($id) {
        $cat = EdocCat::find($id);
        $id = $cat->parent_id;
        return view('edoc/folder', compact('cat', 'id'));
    }
    
    function deleteFolder($id) {
        $cat = EdocCat::find($id);
        $cat->delete();
        return redirect('edoc/list/'.$cat->parent_id);
    }
    
    // show add new folder form
    // $id = parent folder id
    function folder($id='') {
        $cat = new EdocCat();
        return view('edoc/folder', compact('id', 'cat'));
    }
    
    // save form add new folder
    function SaveFolder(Request $req) {
        $id = $req->input('id');
        if (empty($id)) {
            // insert / create new
            $cat = new EdocCat();
        } else {
            // update
            $cat = EdocCat::find($id);
        }
        $cat->name = $req->input('name');
        if (! empty($req->input('parent_id'))) {
            $cat->parent_id = $req->input('parent_id');
        }
        $v = Validator::make($req->all(), $cat::rules());
        if($v->passes()) {
            // validation ok
            $cat->save();
            return redirect('edoc/list/'.$req->input('parent_id'));
        } else {
            // validation fails
            return view('edoc/folder', compact('id','cat'))->withErrors($v);
        }
    }
    
    // list
    function listing($id = '') {
        if (empty($id)) {
            // root folder
            $cats = EdocCat::whereNull('parent_id')->get();
            $docs = []; // root folder patut tak ada doc
            return view('edoc/list', compact('cats', 'docs', 'id'));
        } else {
            // sub folder
            $cats = EdocCat::where('parent_id', $id)->get();
            $docs = Edoc::where('id_cat', $id)->get();
            return view('edoc/list', compact('docs', 'cats', 'id'));
        }
    }

    // form
    function show() {
        $art = new Article();
        return view('article/form', compact('art'));
    }

    // edit
    function edit($id) {
        $art = Article::find($id);
        return view('article/form', compact('art'));
    }

    // save
    function save(Request $req) {
        $id = $req->input('id');
        $title = $req->input('title');
        $content = $req->input('content');
        $cat = $req->input('cat');
        $created_by = Auth::user()->id;

        if (empty($id)) {
            // insert
            $art = new Article();
        } else {
            // update
            $art = Article::find($id);
        }

        $art->title = $title;
        $art->content = $content;
        $art->cat = $cat;
        $art->created_by = $created_by;
        // validation
        $v = Validator::make($req->all(), Article::rules(), Article::messages());
        if ($v->fails()) {
            return view('article/form', compact('art'))->withErrors($v);
        }

        $art->save();
        return redirect('article/list');
    }

    // delete
    function delete($id) {
        return redirect('article/list');
    }

}
