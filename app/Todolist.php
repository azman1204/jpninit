<?php
namespace App;
// satu model mewakili satu table
use Illuminate\Database\Eloquent\Model; // import library
class Todolist extends Model {
    protected $table = 'todo_list';
}