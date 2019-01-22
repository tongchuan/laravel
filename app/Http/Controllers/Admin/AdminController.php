<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Response;
use DB;
use Exception;
// use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Cookie;

class AdminController extends Controller
{
    public function __construct(){	
		parent::__construct();
		$this->table = 't_admin';
	}
	public function index(){
		// echo Hash::make('zhang');
		// exit;// order by COLUMN_NAME desc
		$sql = "select column_name from information_schema.columns where table_name='t_admin'";
		$columns = DB::select($sql);
      return $columns;
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
			$data['username']=$request->input('username',$db->username);
			$data['password']=$request->input('password',$db->password);
			$data['name']=$request->input('name',$db->name);
			$data['enname']=$request->input('enname',$db->enname);
			$data['age']=$request->input('age',$db->age);
			$data['sex']=$request->input('sex',$db->sex);
			$data['birthday']=$request->input('birthday',$db->birthday);
			$data['mobile']=$request->input('mobile',$db->mobile);
			$data['mobile2']=$request->input('mobile2',$db->mobile2);
			$data['tel']=$request->input('tel',$db->tel);
			$data['tel2']=$request->input('tel2',$db->tel2);
			$data['company_tel']=$request->input('company_tel',$db->company_tel);
			$data['email']=$request->input('email',$db->email);
			$data['address']=$request->input('address',$db->address);
			$data['company']=$request->input('company',$db->company);
			$data['company_address']=$request->input('company_address',$db->company_address);
			$data['card']=$request->input('card',$db->card);
			$data['zip_card']=$request->input('zip_card',$db->zip_card);
			$data['create_time']=$request->input('create_time',$db->create_time);
			$data['delete']=$request->input('delete',$db->delete);
			$data['order']=$request->input('order',$db->order);
			$data['link']=$request->input('link',$db->link);
			$data['photo']=$request->input('photo',$db->photo);
			$data['signature']=$request->input('signature',$db->signature);
			$data['integral']=$request->input('integral',$db->integral);
			$data['grade']=$request->input('grade',$db->grade);
			DB::table($this->table)->where('id','=',$id)->update($data);
			$result['data'] = DB::table($this->table)->where('id','=',$id)->get();
			// throw new Exception('33ddd');
		}catch(Exception $e){
			// echo json_encode($e->getFile().'\n'.$e->getLine().'\n'.$e->getMessage());
			$result = $this->getError();
			$result['message'] = $e->getMessage();
		}finally{
			return $result;
		}
	}
	public function add(Request $request){
		$result = $this->getSuccess();
		// {"username":"root","password":"root","sex":"男","age":30,"email":"tongchuanxing@163.com","name":"tongchuanxing","enname":"zhang"}
		try{
			$data = array();
			// $data['id']=$request->input('id',null);
			$data['username']=$request->input('username',null);
			$data['password']=$request->input('password',null);
			$data['name']=$request->input('name',null);
			$data['enname']=$request->input('enname',null);
			$data['age']=$request->input('age',null);
			$data['sex']=$request->input('sex',null);
			$data['birthday']=$request->input('birthday',null);
			$data['mobile']=$request->input('mobile',null);
			$data['mobile2']=$request->input('mobile2',null);
			$data['tel']=$request->input('tel',null);
			$data['tel2']=$request->input('tel2',null);
			$data['company_tel']=$request->input('company_tel',null);
			$data['email']=$request->input('email',null);
			$data['address']=$request->input('address',null);
			$data['company']=$request->input('company',null);
			$data['company_address']=$request->input('company_address',null);
			$data['card']=$request->input('card',null);
			$data['zip_card']=$request->input('zip_card',null);
			$data['create_time']=$request->input('create_time',null);
			$data['delete']=$request->input('delete',0);
			$data['order']=$request->input('order',0);
			$data['link']=$request->input('link',null);
			$data['photo']=$request->input('photo',null);
			$data['signature']=$request->input('signature',null);
			$data['integral']=$request->input('integral',null);
			$data['grade']=$request->input('grade',null);
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
	
	/**
	* 登录
	*/
	public function signin(Request $request){
		$username = $request->input('username', null);
		$password = $request->input('password', null);
		if(!$username || !$password){
			$result = $this->getError();
			$result['message'] = $this->MESSAGE['register'];
			return $result;
		}
		$data = DB::table($this->table)->where('username','=',$username)->get();
		if(count($data)===0){
			$result = $this->getError();
			$result['message'] = $this->MESSAGE['signinerror1'];
			return $result;
		}
		if(md5($password) !== $data[0]->password){
			$result = $this->getError();
			$result['message'] = $this->MESSAGE['signinerror2'];
			return $result;
		}
		$cookie = Cookie::make('username', $username, $this->minutes);
		$result = $this->getSuccess();
		$result['data'] = $cookie;
		$result['message'] = $this->MESSAGE['signin'];
		echo json_encode($result);
		return Response::make()->withCookie($cookie);
		// echo $cookie;
		// echo var_dump(Cookie::get('username'));
		
		// $result = $this->getSuccess();
		// $result['data'] = Response::make()->withCookie($cookie);
		// $result['message'] = $this->MESSAGE['signin'];
		// return $result;
	}

	public function issignin(){
		$value = Cookie::get('username');
		// echo var_dump($value);
		if($value){
			$result = $this->getSuccess();
			$result['data'] = $value;
			$result['message'] = $this->MESSAGE['success'];
			return $result;
		}else{
			$result = $this->getError();
			$result['message'] = $this->MESSAGE['login'];
			return $result;
		}
	}
	public function signout(){
		// $value = Cookie::get('username');
		$cookie = Cookie::forget('username');

		// $value = Cookie::get('username');
		$result = $this->getSuccess();
		// $result['data'] = $value;
		$result['message'] = $this->MESSAGE['signout'];
		echo json_encode($result);
		// echo var_dump($value);
		// if(!$value){
		// 	$result = $this->getSuccess();
		// 	$result['data'] = $value;
		// 	$result['message'] = $this->MESSAGE['signout'];
		// 	return $result;
		// }else{
		// 	$result = $this->getError();
		// 	$result['message'] = $this->MESSAGE['signouterror'];
		// 	return $result;
		// }
		return Response::make()->withCookie($cookie);
	}
	public function register(Request $request){
		$data = array();
		$data['username'] = $request->input('username', null);
		$data['password'] = $request->input('password', null);
		if(!$data['username'] || !$data['password']){
			$result = $this->getError();
			$result['message'] = $this->MESSAGE['register'];
			return $result;
		}
		$result = $this->getSuccess();
		try{
			$data = DB::table($this->table)->where('username','=',$data['username'])->get();
			if(count($data)===0){
				$data['name'] = $request->input('name', $data['username']);
				$data['enname'] = $request->input('enname', $data['username']);
				// $data['password'] = Hash::make($data['password']);
				$data['password'] = md5($data['password']);
				$id = DB::table($this->table)->insertGetId($data);
				$data['id']=$id;
				$result['message'] = $this->MESSAGE['registersuccess'];
			}else{
				throw new Exception($this->MESSAGE['registererror']);
			}
			
		}catch(Exception $e){
			$result = $this->getError();
			$result['message'] = $e->getMessage();
		}finally{
			return $result;
		}
	}
	public function modifypwd(Request $request){
		$result = $this->getSuccess();
		try{
			$data = array();
			$username = $request->input('username', null);
			$oldpassword = $request->input('oldpassword', null);
			$password = $request->input('password', null);
			$flag = true;
			$message = null;
			if(!$username){
				$flag = false;
				$message = $this->MESSAGE['modifypwd']['pwd0'];
			}
			if(!$oldpassword){
				$flag = false;
				$message = $this->MESSAGE['modifypwd']['pwd1'];
			}
			if(!$password){
				$flag = false;
				$message = $this->MESSAGE['modifypwd']['pwd2'];
			}
			if($oldpassword==$password){
				$flag = false;
				$message = $this->MESSAGE['modifypwd']['pwd3'];
			}
			
			$data = DB::table($this->table)->where('username','=',$username)->get();
			$result['data']=$data;
			if(count($data)===0){
				$flag = false;
				$message = $this->MESSAGE['modifypwd']['pwd5'];
			}else{
				// echo $data[0]->password;
				if(md5($oldpassword) !== $data[0]->password){
					$flag = false;
					$message = $this->MESSAGE['modifypwd']['pwd4'];
				}
				DB::table($this->table)->where('id','=',$data[0]->id)->update(['password'=>md5($password)]);//->get();
			}
			if(!$flag){
				throw new Exception($message);
			}
			// exit();
		}catch(Exception $e){
			$result = $this->getError();
			$result['message'] = $e->getMessage();
		}finally{
			return $result;
		}
	}
}
