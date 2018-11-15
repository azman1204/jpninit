<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use Illuminate\Support\Facades\Auth;
use Validator;

class PostController extends Controller {
    // list semua post
    function index($room_id, Request $req) {
        $req->session()->put('room_id', $room_id);
        $posts = Post::where('room_id', $room_id)->get();
        return view('forum/post/index', compact('posts'));
    }

    // form
    function create() {
        $post = new Post();
        return view('forum/post/form', compact('post'));
    }

    // edit
    function edit($id) {
        $post = Post::find($id);
        return view('forum/post/form', compact('post'));
    }

    // save
    function save(Request $req) {
        if (empty($req->id)) {
            // insert
            $post = new Post();
        } else {
            // update
            $post = Post::find($req->id);
        }

        $post->content = $req->content;
        $post->post_by = Auth::user()->id;
        $post->room_id = $req->session()->get('room_id');
        
        // validation
        $v = Validator::make($req->all(), Post::rules(), Post::messages());
        if ($v->fails()) {
            return view('forum/post/form', compact('post'))->withErrors($v);
        }

        $post->save();
        return redirect('post/index/'.$post->room_id);
    }

    // delete
    function delete($id) {
        $post = Post::find($id);
        $post->delete();
        return redirect('post/index/'.$post->room_id);
    }
}