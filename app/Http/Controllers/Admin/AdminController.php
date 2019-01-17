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
		echo Hash::make('zhang');
		exit;
		$sql = "select column_name from information_schema.columns where table_name='t_admin' order by COLUMN_NAME desc";
		$columns = DB::select($sql);
      return var_dump(json_encode($columns));
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
			$data['zip_card'] = $request->input('zip_card', $db->zip_card);
			$data['username'] = $request->input('username', $db->username);
			$data['tel2'] = $request->input('tel2', $db->tel2);
			$data['tel'] = $request->input('tel', $db->tel);
			$data['signature'] = $request->input('signature', $db->signature);
			$data['sex'] = $request->input('sex', $db->sex);
			$data['photo'] = $request->input('photo', $db->photo);
			// $data['password'] = $request->input('password', $db->);
			$data['order'] = $request->input('order', $db->order);
			$data['name'] = $request->input('name', $db->name);
			$data['mobile2'] = $request->input('mobile2', $db->mobile2);
			$data['mobile'] = $request->input('mobile', $db->mobile);
			$data['link'] = $request->input('link', $db->link);
			$data['integral'] = $request->input('integral', $db->integral);
			$data['grade'] = $request->input('grade', $db->grade);
			$data['enname'] = $request->input('enname', $db->enname);
			$data['email'] = $request->input('email', $db->email);
			$data['delete'] = $request->input('delete', $db->delete);
			$data['create_time'] = $request->input('create_time', $db->create_time);
			$data['company_tel'] = $request->input('company_tel', $db->company_tel);
			$data['company_address'] = $request->input('company_address', $db->company_address);
			$data['company'] = $request->input('company', $db->company);
			$data['card'] = $request->input('card', $db->card);
			$data['birthday'] = $request->input('birthday', $db->birthday);
			$data['age'] = $request->input('age', $db->age);
			$data['address'] = $request->input('address', $db->address);
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
			$data['zip_card'] = $request->input('zip_card', null);
			$data['username'] = $request->input('username', null);
			$data['tel2'] = $request->input('tel2', null);
			$data['tel'] = $request->input('tel', null);
			$data['signature'] = $request->input('signature', null);
			$data['sex'] = $request->input('sex', null);
			$data['photo'] = $request->input('photo', null);
			$data['password'] = $request->input('password', null);
			$data['order'] = $request->input('order', null);
			$data['name'] = $request->input('name', null);
			$data['mobile2'] = $request->input('mobile2', null);
			$data['mobile'] = $request->input('mobile', null);
			$data['link'] = $request->input('link', null);
			$data['integral'] = $request->input('integral', null);
			$data['grade'] = $request->input('grade', null);
			$data['enname'] = $request->input('enname', null);
			$data['email'] = $request->input('email', null);
			$data['delete'] = $request->input('delete', null);
			$data['create_time'] = $request->input('create_time', null);
			$data['company_tel'] = $request->input('company_tel', null);
			$data['company_address'] = $request->input('company_address', null);
			$data['company'] = $request->input('company', null);
			$data['card'] = $request->input('card', null);
			$data['birthday'] = $request->input('birthday', null);
			$data['age'] = $request->input('age', null);
			$data['address'] = $request->input('address', null);
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
			$data = DB::table($this->table)->select()->get();
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
