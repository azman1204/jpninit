<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class EdocCat extends Model {
    // validation rules
    static function rules() {
        return [
            'name' => 'required'
        ];
    }
    
    // custom err messages
    static function messages() {
        return [
            'name.required' => 'Tajuk wajib diisi'
        ];
    }
}