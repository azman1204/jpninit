<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Edoc extends Model {
    // validation rules
    static function rules() {
        return [
            'title' => 'required',
            'content' => 'required'
        ];
    }
    
    // custom err messages
    static function messages() {
        return [
            'title.required' => 'Tajuk wajib diisi',
            'content.required' => 'Kandungan wajib diisi juga'
        ];
    }
}