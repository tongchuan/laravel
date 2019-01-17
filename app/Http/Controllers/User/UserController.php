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
  public function showProfile(){
    return 'showProfile';
  }
  public function login(){
    $cookie = $request->cookie('test');
    return $cookie.'343434343434';
    // if($cookie){
    //     $data = null;
    //     $data['message'] = '请登录';
    //     return $data;
    // }
  }
}

?>