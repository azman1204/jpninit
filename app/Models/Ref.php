<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Ref extends Model {
    protected $table = 'ref';
    
    // generate dropdown html
    static function dropdown($cat = 'cms', $name='', $selected='') {
        $refs = self::where('cat', $cat)->get();
        $str = "<select name='$name' id='$name' class='form-control'>";
        $str .= "<option value='0'>--Sila Pilih--</option>";
        foreach($refs as $ref) {
            $s = $selected === $ref->code ? 'selected' : '';
            $str .= "<option value='{$ref->code}' $s>{$ref->descr}</option>";
        }
        $str .= '</select>';
        return $str;
    }
    
    // validation rules
    static function rules() {
        return [
            'code' => 'required',
            'descr' => 'required'
        ];
    }
    
    // custom err messages
    static function messages() {
        return [
            'code.required' => 'Tajuk wajib diisi',
            'descr.required' => 'Keterangan wajib diisi juga'
        ];
    }
}