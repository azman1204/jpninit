<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
class Role extends Model {
    // return true = user ada priv, false = tiada priv
    static function isPriv($priv_id) {
        $user = Auth::user(); // return obj / model user yg login
        $roles = explode(',', $user->roles);// adm,usr
        
        $priv = self::where('priv_id', $priv_id)
                ->whereIn('role_id', $roles)
                ->first(); 
       
        if ($priv) {
            return true;
        } else {
            return false;
        }
    }
}