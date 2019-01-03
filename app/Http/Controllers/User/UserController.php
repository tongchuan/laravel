<?php
namespace App\Http\Controllers\User;
use DB;
use App\Http\Controllers\Controller;
class UserController extends Controller 
{
  public function __construct()
  {
  }
  public function index()
  {
    // return 'select * from user';
      $users = DB::select('select * from user');
      // return var_dump($users);
      return view('user.index', ['users' => $users]);
  }
}

?>