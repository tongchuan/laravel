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
			'login'=>'请登录');
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
