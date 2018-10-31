<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Article;
use Validator;

class ArticleController extends Controller
{
    // list
    function listing() {
        $arts = Article::all();
        return view('article/list', compact('arts'));
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
        
        if (empty($id)) {
            // insert
            $art = new Article();
        } else {
            // update
            $art = Article::find($id);
        }
        
        $art->title = $title;
        $art->content = $content;
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
