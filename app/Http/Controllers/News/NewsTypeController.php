<?php
namespace App\Http\Controllers\News;
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
    $data = null;
    $data['input'] = $request->input();
    $data['name'] = $request->input('name','name1111');
    $data['path'] = $request->path();
    $data['url'] = $request->url();
    $data['fullUrl'] = $request->fullUrl();
    $data['method'] = $request->method();
    $data['isMethod'] = $request->isMethod('post');
    $data['all'] = $request->all();
    // $name = $request->input('products.0.name'); 数组
    $data['query'] = $request->query();
    $data['name'] = $request->name;
    return json_encode($data)；
    // if ($request->has(['name', 'email'])) {
    // if ($request->has('name')) {
        // 是否存在
    // }
    // json_decode(json)
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