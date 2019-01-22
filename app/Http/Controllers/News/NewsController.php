<?php
namespace App\Http\Controllers\News;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use Exception;
class NewsController extends Controller 
{
  public function __construct()
  {
    parent::__construct();
    $this->table = 't_news';
  }
  public function index(){
      $sql = "select column_name from information_schema.columns where table_name='t_news'";
      $columns = DB::select($sql);
      return $columns;
  }

  public function add(Request $request){
      $result = $this->getSuccess();
      try{
          $data = array();
          // $data['id']=$request->input('id',null);
          $data['type_id']=$request->input('type_id',null);
          $data['title']=$request->input('title',null);
          $data['titles']=$request->input('titles',null);
          $data['title_color']=$request->input('title_color',null);
          $data['title_seo']=$request->input('title_seo',null);
          $data['tags']=$request->input('tags',null);
          $data['tags_seo']=$request->input('tags_seo',null);
          $data['keyword']=$request->input('keyword',null);
          $data['content_nav']=$request->input('content_nav',null);
          $data['source']=$request->input('source',null);
          $data['remark']=$request->input('remark',null);
          $data['content']=$request->input('content',null);
          $data['description']=$request->input('description',null);
          $data['small_pic']=$request->input('small_pic',null);
          $data['big_pic']=$request->input('big_pic',null);
          $data['link']=$request->input('link',null);
          $data['link_spic']=$request->input('link_spic',null);
          $data['link_bpic']=$request->input('link_bpic',null);
          $data['author']=$request->input('author',null);
          $data['audit']=$request->input('audit',0);
          $data['hot']=$request->input('hot',0);
          $data['top']=$request->input('top',0);
          $data['recommend']=$request->input('recommend',0);
          $data['comm']=$request->input('comm',0);
          $data['vote']=$request->input('vote',0);
          $data['delete']=$request->input('delete',0);
          $data['order']=$request->input('order',0);
          $data['click']=$request->input('click',0);
          $data['status']=$request->input('status',0);
          $data['create_man']=$request->input('create_man',null);
          $data['create_time']=$request->input('create_time',null);
          $data['modify_man']=$request->input('modify_man',null);
          $data['modify_time']=$request->input('modify_time',null);
          $id = DB::table($this->table)->insertGetId($data);
          $data['id']=$id;
          $result['data'] = $data;
      }catch(Exception $e){
          $result = $this->getError();
          $result['message'] = $e->getMessage();
      }finally{
          return $result;
      }
  }
  public function getlist(Request $request){
      $result = $this->getSuccess();
      try{
          $where = array('0'=>array('delete','=',0));
          $parameter = $request->input('where',array());
          foreach ($parameter as $key => $value){
            $where[count($where)]=array($value['name'],$value['operat'],$value['value']);
          }
          $data = DB::table($this->table)->select()->where($where)->get();
          $result['data'] = $data;
      }catch(Exception $e){
          $result = $this->getError();
          $result['message'] = $e->getMessage();
      }finally{
          return $result;
      }
  }
  public function count($where){
    $result = DB::table($this->table)->where($where)->count();
      return $result;
  }
  public function getlistpage(Request $request){
    $result = $this->getSuccess();
    $where = array('0'=>array('delete','=',0));
    $parameter = $request->input('where',array());
    foreach ($parameter as $key => $value){
      $where[count($where)]=array($value['name'],$value['operat'],$value['value']);
    }
    $offset = $request->input('offset',0);
    $total=$this->count($where);
    $pageSize = $request->input('pagesize',10);
    $page = null;
    $page['size'] = $pageSize;
    $page['total'] = $total;
    $result['page'] = $page;
    // {"offset":0,"pagesize":10, "where":[{"name":"name","value":"zhang","operat":"="},{"name":"sex","value":"男","operat":"="}]}
    try{
      $data = DB::table($this->table)->select()->where($where)->orderBy('id', 'desc')->offset($offset)->limit($pageSize)->get();
      $result['data'] = $data;
    }catch(Exception $e){
      $result = $this->getError();
      $result['message'] = $e->getMessage();
    }finally{
      return $result;
    }
  }
  public function getitem(Request $request){
      $result = $this->getSuccess();
      try{
          $id = $request->input('id');
          if(!$id){
              throw new Exception($this->MESSAGE['modify']['update1']);
          }
          $data = DB::table($this->table)->select()->where('delete',0)->where('id',$id)->get();
          if(count($data)===0){
              throw new Exception($this->MESSAGE['modify']['update1']);
          }
          $result['data'] = $data[0];
      }catch(Exception $e){
          $result = $this->getError();
          $result['message'] = $e->getMessage();
      }finally{
          return $result;
      }
  }
  public function modify(Request $request){
      $result = $this->getSuccess();
      $result['message'] = $this->MESSAGE['modify']['update4'];
      try{
          $id = $request->input('id');
          if(!$id){
              throw new Exception($this->MESSAGE['modify']['update1']);
          }
          $dblist = DB::table($this->table)->where('id','=',$id)->get();
          if(count($dblist)===0){
              throw new Exception($this->MESSAGE['modify']['update2']);
          }
          $db = $dblist[0];
          $data = array();
          // $data['id']=$request->input('id',$db->id);
          $data['type_id']=$request->input('type_id',$db->type_id);
          $data['title']=$request->input('title',$db->title);
          $data['titles']=$request->input('titles',$db->titles);
          $data['title_color']=$request->input('title_color',$db->title_color);
          $data['title_seo']=$request->input('title_seo',$db->title_seo);
          $data['tags']=$request->input('tags',$db->tags);
          $data['tags_seo']=$request->input('tags_seo',$db->tags_seo);
          $data['keyword']=$request->input('keyword',$db->keyword);
          $data['content_nav']=$request->input('content_nav',$db->content_nav);
          $data['source']=$request->input('source',$db->source);
          $data['remark']=$request->input('remark',$db->remark);
          $data['content']=$request->input('content',$db->content);
          $data['description']=$request->input('description',$db->description);
          $data['small_pic']=$request->input('small_pic',$db->small_pic);
          $data['big_pic']=$request->input('big_pic',$db->big_pic);
          $data['link']=$request->input('link',$db->link);
          $data['link_spic']=$request->input('link_spic',$db->link_spic);
          $data['link_bpic']=$request->input('link_bpic',$db->link_bpic);
          $data['author']=$request->input('author',$db->author);
          $data['audit']=$request->input('audit',$db->audit);
          $data['hot']=$request->input('hot',$db->hot);
          $data['top']=$request->input('top',$db->top);
          $data['recommend']=$request->input('recommend',$db->recommend);
          $data['comm']=$request->input('comm',$db->comm);
          $data['vote']=$request->input('vote',$db->vote);
          $data['delete']=$request->input('delete',$db->delete);
          $data['order']=$request->input('order',$db->order);
          $data['click']=$request->input('click',$db->click);
          $data['status']=$request->input('status',$db->status);
          $data['create_man']=$request->input('create_man',$db->create_man);
          $data['create_time']=$request->input('create_time',$db->create_time);
          $data['modify_man']=$request->input('modify_man',$db->modify_man);
          $data['modify_time']=$request->input('modify_time',$db->modify_time);

          DB::table($this->table)->where('id','=',$id)->update($data);
          $result['data'] = DB::table($this->table)->where('id','=',$id)->get();
      }catch(Exception $e){
          $result = $this->getError();
          $result['message'] = $e->getMessage();
      }finally{
          return $result;
      }
  }
}

?>