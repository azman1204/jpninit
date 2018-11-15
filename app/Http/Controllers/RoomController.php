<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Room;
use Illuminate\Support\Facades\Auth;
use Validator;

class RoomController extends Controller
{
    // room/index
    function index() {
        $rooms = Room::all();
        return view('forum/room/index', compact('rooms'));
    }
    
    // room/create
    function create() {
        $room = new Room();
        return view('forum/room/form', compact('room'));
    }
    
    // edit
    function edit($id) {
        $room = Room::find($id);
        return view('forum/room/form', compact('room'));
    }
    
    // save
    function save(Request $req) {
        $id = $req->input('id');
        
        if (empty($id)) {
            // insert
            $room = new Room();
            $room->created_by = Auth::user()->id;
        } else {
            // update
            $room = Room::find($id);
        }
        
        $room->title = $req->input('title');
        $room->descr = $req->input('descr');

        // validation
        $v = Validator::make($req->all(), Room::rules(), Room::messages());
        if ($v->fails()) {
            return view('forum/room/form', compact('room'))->withErrors($v);
        }
        
        $room->save();
        return redirect('room/index');
    }
    
    
    // delete
    function delete($id) {
        Room::find($id)->delete();
        return redirect('room');
    }
}
