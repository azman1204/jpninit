<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Reply;
use App\Models\Post;
use Illuminate\Support\Facades\Auth;
use Validator;

class ReplyController extends Controller
{
    // list
    function index($post_id, Request $req) {
        $req->session()->put('post_id', $post_id);
        $replies = Reply::where('post_id', $post_id)->get();
        $post = Post::find($post_id);
        return view('forum/reply/index', compact('replies','post'));
    }
    
    // form
    function create() {
        $reply = new Reply();
        return view('forum/reply/form', compact('reply'));
    }
    
    // edit
    function edit($id) {
        $reply = Reply::find($id);
        return view('forum/reply/form', compact('reply'));
    }
    
    // save
    function save(Request $req) {
        $id = $req->input('id');       
        if (empty($id)) {
            $reply = new Reply();
        } else {
            $reply = Reply::find($id);
        }
        
        $reply->content = $req->content;
        $reply->post_id = $req->session()->get('post_id');
        $reply->reply_by = Auth::user()->id;
        // validation
        $v = Validator::make($req->all(), Reply::rules(), Reply::messages());
        if ($v->fails()) {
            return view('forum/reply/form', compact('reply'))->withErrors($v);
        }
        
        $reply->save();
        return redirect('reply/index/'.$reply->post_id);
    }
    
    // delete
    function delete($id) {
        $reply = Reply::find($id);
        $reply->delete();
        return redirect('reply/index/'.$reply->post_id);
    }
}