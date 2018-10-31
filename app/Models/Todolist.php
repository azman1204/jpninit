<?php
namespace App\Models;
// satu model mewakili satu table
use Illuminate\Database\Eloquent\Model; // import library
class Todolist extends Model {
    protected $table = 'todo_list';
    // validation rules
    static function rules() {
        return [
            'name' => 'required',
            'description' => 'required'
        ];
    }
    
    // custom err messages
    static function messages() {
        return [
            'name.required' => 'Nama wajib diisi',
            'description.required' => 'Desc wajib diisi juga'
        ];
    }
}