<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use DB;
use Exception;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

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
	public function login(){
		$result = $this->getSuccess();
		try{
			$result['message'] = $this->MESSAGE['login'];
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

	public function getList(){
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
}
