<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Role extends Model {
    // return true = user ada priv, false = tiada priv
    static function isPriv($priv_id) {
        $user = Auth::user(); // return obj / model user yg login
        $role = $user->role;
        $priv = self::where('priv_id', $priv_id)
                ->where('role_id', $role)->first();
        if ($priv) {
            return true;
        } else {
            return false;
        }
    }
}