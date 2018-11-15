<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Post extends Model {
    // validation rules
    static function rules() {
        return [];
    }
    
    // custom err messages
    static function messages() {
        return [];
    }
}