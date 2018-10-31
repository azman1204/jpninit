<?php
namespace App\Http\Controllers;
use App\Models\Todolist;
use Illuminate\Http\Request;
use Validator;

class TodoController extends Controller {
    // senaraikan semua todo list
    function listing() {
        // return an array of all obj(data)
        $td = Todolist::all(); // select * from todo_list
        //dd($td); // die dump
        return view('todo/list', compact('td'));
    }
    
    // show form
    function show() {
        $td = new Todolist();
        return view('todo/form', compact('td')); // resources/views/todo/form.blade.php
    }
    
    // save / update form
    function save(Request $req) {
        // baca input dari form
        $id = $req->input('id');
        $name = $req->input('name');
        $desc = $req->input('description');
        
        if (empty($id)) {
            // insert
            $td = new Todolist();
        } else {
            // update
            $td = Todolist::find($id);
        }
        
        $td->name = $name;
        $td->description = $desc;
        
        // validation .. data dari form vs rules
        $v = Validator::make($req->all(), Todolist::rules(), Todolist::messages());
        if ($v->fails()) {
            return view('todo/form', compact('td'))->withErrors($v);
        }
        
        $td->save();
        return redirect('todo/list');
        //return "$name $desc";
    }
    
    // edit form
    function edit($id) {
        $td = Todolist::find($id);
        return view('todo/form', compact('td'));
    }
    
    // delete data
    function delete($id) {
        $td = Todolist::find($id);
        $td->delete();
        return redirect('todo/list');
    }
}