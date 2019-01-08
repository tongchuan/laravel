<?php
namespace App\Http\Controllers\News;
use DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
class NewsTypeController extends Controller 
{
  public function __construct()
  {
    $this->table = 't_news_type';
  }
  public function index(Request $request)
  {
      $news_type = DB::select('select * from t_news_type');
      // $news = DB::select('select * from t_news');
      return var_dump($news_type);
      // return view('user.index', ['users' => $users]);
  }
  public function add(Request $request){

    $data = array();
    $data["parentid"]=$request->input("parentid",null);
    $data["name"]=$request->input("name",null);
    $data["cnname"]=$request->input("cnname",null);
    $data["enname"]=$request->input("enname",null);
    $data["link_nav"]=$request->input("link_nav",null);
    $data["content_nav"]=$request->input("content_nav",null);
    $data["tags"]=$request->input("tags",null);
    $data["tags_seo"]=$request->input("tags_seo",null);
    $data["keyword"]=$request->input("keyword",null);
    $data["remark"]=$request->input("remark",null);
    $data["small_pic"]=$request->input("small_pic",null);
    $data["big_pic"]=$request->input("big_pic",null);
    $data["link"]=$request->input("link",null);
    $data["link_spic"]=$request->input("link_spic",null);
    $data["link_bpic"]=$request->input("link_bpic",null);
    $data["show"]=$request->input("show",0);
    $data["status"]=$request->input("status",0);
    $data["hot"]=$request->input("hot",0);
    $data["top"]=$request->input("top",0);
    $data["recommend"]=$request->input("recommend",0);
    $data["comm"]=$request->input("comm",0);
    $data["vote"]=$request->input("vote",0);
    $data["delete"]=$request->input("delete",0);
    $data["create_man"]=$request->input("create_man",null);
    $data["create_time"]=$request->input("create_time",null);
    $data["modify_man"]=$request->input("modify_man",null);
    $data["modify_time"]=$request->input("modify_time",null);
// DB::table('users')->insert(
//     ['email' => 'john@example.com', 'votes' => 0]
// );
    // $data= json_decode(json_encode($data), ture);
    $id = DB::table($this->table)->insertGetId(
        $data
    );
    $data['id']=$id;
    return json_encode($data);
    // $sql = "insert into ".$this->table."(`parentid`,`name`,`cnname`,`enname`,`link_nav`,`content_nav`,`tags`,`tags_seo`,`keyword`,`remark`,`small_pic`,`big_pic`,`link`,`link_spic`,`link_bpic`,`show`,`status`,`hot`,`top`,`recommend`,`comm`,`vote`,`delete`,`create_man`,`create_time`,`modify_man`,`modify_time`)"
    // $data = null;
    // $data['input'] = $request->input();
    // $data['name'] = $request->input('name','name1111');
    // $data['path'] = $request->path();
    // $data['url'] = $request->url();
    // $data['fullUrl'] = $request->fullUrl();
    // $data['method'] = $request->method();
    // $data['isMethod'] = $request->isMethod('post');
    // $data['all'] = $request->all();
    // // $name = $request->input('products.0.name'); 数组
    // $data['query'] = $request->query();
    // $data['name'] = $request->name;
    return json_encode($data);
    // if ($request->has(['name', 'email'])) {
    // if ($request->has('name')) {
        // 是否存在
    // }
    // json_decode(json)
    return var_dump($request);
  }
  public function update(Request $request,$id){
    $data = array();
    $data["parentid"]=$request->input("parentid",null);
    $data["name"]=$request->input("name",null);
    $data["cnname"]=$request->input("cnname",null);
    $data["enname"]=$request->input("enname",null);
    $data["link_nav"]=$request->input("link_nav",null);
    $data["content_nav"]=$request->input("content_nav",null);
    $data["tags"]=$request->input("tags",null);
    $data["tags_seo"]=$request->input("tags_seo",null);
    $data["keyword"]=$request->input("keyword",null);
    $data["remark"]=$request->input("remark",null);
    $data["small_pic"]=$request->input("small_pic",null);
    $data["big_pic"]=$request->input("big_pic",null);
    $data["link"]=$request->input("link",null);
    $data["link_spic"]=$request->input("link_spic",null);
    $data["link_bpic"]=$request->input("link_bpic",null);
    $data["show"]=$request->input("show",0);
    $data["status"]=$request->input("status",0);
    $data["hot"]=$request->input("hot",0);
    $data["top"]=$request->input("top",0);
    $data["recommend"]=$request->input("recommend",0);
    $data["comm"]=$request->input("comm",0);
    $data["vote"]=$request->input("vote",0);
    $data["delete"]=$request->input("delete",0);
    $data["create_man"]=$request->input("create_man",null);
    $data["create_time"]=$request->input("create_time",null);
    $data["modify_man"]=$request->input("modify_man",null);
    $data["modify_time"]=$request->input("modify_time",null);
    DB::table($this->table)
      ->where('id',$id)
      ->update($data)
    return var_dump($request);
  }
  public function delete(Request $request,$id){
    // DB::table($this->table)->where('id', '<', 100)->delete();
    return DB::table($this->table)->where('id', $id)->delete();
    // return var_dump($request);

  }
  public function query(Request $request){
    return json_decode(DB::table($this->table)-get());
    // return var_dump($request);
  }
}

?>