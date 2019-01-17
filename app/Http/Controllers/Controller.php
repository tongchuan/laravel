<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesResources;

class Controller extends BaseController
{
	use AuthorizesRequests, AuthorizesResources, DispatchesJobs, ValidatesRequests;
	
	public function __construct(){
		$this->MESSAGE = array(
			'success'=>'成功',
			'error'=>'失败',
			'login'=>'请登录',
			'register'=>'用户名或密码不能为空',
			'registererror'=>'用户名已经注册',
			'registersuccess'=>'注册成功',
			'signinerror1'=> '用户名不存在',
			'signinerror2'=> '密码错误',
			'signin'=> '登录成功',
			'signout'=> '退出成功',
			'signouterror'=> '退出失败',
			'modify'=>array(
				'update1'=> 'id不能为空',
				'update2'=> 'id错误',
				'update3'=> '修改失败',
				'update4'=> '修改成功'
			),
			'modifypwd'=>array(
				'pwd0'=> '用户名不能为空',
				'pwd1'=> '原密码不能为空',
				'pwd2'=> '新密码不能为空',
				'pwd3'=> '原密码不能和新密码一致',
				'pwd4'=> '密码错误',
				'pwd5'=> '此用户不存在',
				'pwd6'=> '密码修改成功'
			)
		);
		$this->minutes = 60*24;
	}
    public function getSuccess(){
    	$data = null;
    	$data['message'] = $this->MESSAGE['success'];
    	$data['code'] = 10000;
    	$data['isSuccess'] = true;
    	$data['data'] = null; 
    	return $data;
	}
	public function getError(){
		$data = null;
    	$data['message'] = $this->MESSAGE['error'];
    	$data['code'] = 20000;
    	$data['isSuccess'] = false;
    	$data['data'] = null; 
    	return $data;
	}
}
