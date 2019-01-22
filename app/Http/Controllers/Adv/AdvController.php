<?php

namespace App\Http\Controllers\Adv;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Exception;
class AdvController extends Controller
{
	public function __construct(){	
		parent::__construct();
		$this->table = 't_adv';
	}
    public function index(){
		$sql = "select column_name from information_schema.columns where table_name='t_adv'";
		$columns = DB::select($sql);
      return $columns;
/*var str = []
 var arr = [{"column_name":"type_id"},{"column_name":"tags"},{"column_name":"small_pic"},{"column_name":"remark"},{"column_name":"order"},{"column_name":"name"},{"column_name":"link_spic"},{"column_name":"link_bpic"},{"column_name":"link"},{"column_name":"id"},{"column_name":"delete"},{"column_name":"create_time"},{"column_name":"content"},{"column_name":"big_pic"}];
 arr.forEach((item)=>{
 	str.push('$data[\''+item.column_name+'\']=$request->input(\''+item.column_name+'\',null);')
 })
console.log(str.join('\n'))
*/
	}
	public function add(Request $request){
		$result = $this->getSuccess();
		try{
			$data = array();
			// $data['id']=$request->input('id',null);
			$data['type_id']=$request->input('type_id',null);
			$data['name']=$request->input('name',null);
			$data['tags']=$request->input('tags',null);
			$data['remark']=$request->input('remark',null);
			$data['link']=$request->input('link',null);
			$data['small_pic']=$request->input('small_pic',null);
			$data['big_pic']=$request->input('big_pic',null);
			$data['link_spic']=$request->input('link_spic',null);
			$data['link_bpic']=$request->input('link_bpic',null);
			$data['content']=$request->input('content',null);
			$data['create_time']=$request->input('create_time',null);
			$data['delete']=$request->input('delete',null);
			$data['order']=$request->input('order',null);
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
			$data['name']=$request->input('name',$db->name);
			$data['tags']=$request->input('tags',$db->tags);
			$data['remark']=$request->input('remark',$db->remark);
			$data['link']=$request->input('link',$db->link);
			$data['small_pic']=$request->input('small_pic',$db->small_pic);
			$data['big_pic']=$request->input('big_pic',$db->big_pic);
			$data['link_spic']=$request->input('link_spic',$db->link_spic);
			$data['link_bpic']=$request->input('link_bpic',$db->link_bpic);
			$data['content']=$request->input('content',$db->content);
			$data['create_time']=$request->input('create_time',$db->create_time);
			$data['delete']=$request->input('delete',$db->delete);
			$data['order']=$request->input('order',$db->order);
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
