<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Article;

class ArticleController extends Controller
{
    // list
    function listing() {
        $arts = Article::all();
        return view('article/list', compact('arts'));
    }
    
    // form
    function show() {
        return view('article/form');
    }
    
    // edit
    function edit($id) {
        return view('article/form');
    }
    
    // save
    function save() {
        return redirect('article/list');
    }
    
    
    // delete
    function delete($id) {
        return redirect('article/list');
    }
}
