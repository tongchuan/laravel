<?php
namespace App\Http\Controllers\User;
use DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
class NewsTypeController extends Controller 
{
  public function __construct()
  {
  }
  public function index(Request $request)
  {
      $news_type = DB::select('select * from t_news_type');
      // $news = DB::select('select * from t_news');
      return var_dump($news_type);
      // return view('user.index', ['users' => $users]);
  }
  public function add(Request $request){
    return var_dump($request);
  }
  public function update(Request $request){
    return var_dump($request);
  }
  public function delete(Request $request){
    return var_dump($request);
  }
  public function query(Request $request){
    return var_dump($request);
  }
}

?>