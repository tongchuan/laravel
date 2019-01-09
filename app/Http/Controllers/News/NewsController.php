<?php
namespace App\Http\Controllers\News;
use DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
class NewsController extends Controller 
{
  public function __construct()
  {
    $this->table = 't_news';
  }
  public function index(Request $request)
  {
      // $news_type = DB::select('select * from t_news_type');
      $news = DB::select('select * from t_news');
      return var_dump($news);
      // return view('user.index', ['users' => $users]);
  }
  public function add(Request $request){
    // DB::insert('insert into')
    return var_dump($request->query());
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