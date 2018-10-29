<?php
namespace App\Http\Controllers;
use App\Todolist;

class TodoController extends Controller {
    // senaraikan semua todo list
    function listing() {
        // return an array of all obj(data)
        $td = Todolist::all(); // select * from todo_list
        //dd($td); // die dump
        return view('todo/list', compact('td'));
    }
}