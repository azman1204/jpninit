<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Edoc;
use App\Models\EdocCat;
use Illuminate\Support\Facades\Auth;
use Validator;

class EdocController extends Controller
{
    // list
    function listing($id = '') {
        if(empty($id)) {
            $cats = EdocCat::whereNull('parent_id')->get();
        } else {
            $cats = EdocCat::where('parent_id', $id)->get();
            if (count($cats) > 0) {
                // ada child
            } else {
                // tak ada child / senarai docs
                $docs = Edoc::where('id_cat', $id)->get();
                return view('edoc/list', compact('docs'));
            }
        }
        return view('edoc/list', compact('cats'));
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
