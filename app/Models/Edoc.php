<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Edoc extends Model {
    // validation rules
    static function rules() {
        return [
            'name' => 'required',
            'descr' => 'required',
            'id_cat' => 'required'
        ];
    }
    
    // custom err messages
    static function messages() {
        return [
            'name.required' => 'Nama wajib diisi',
            'descr.required' => 'Keterangan wajib diisi juga'
        ];
    }
}