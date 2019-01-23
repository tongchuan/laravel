<?php

namespace App\Http\Controllers\Menu;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class MenuTypeController extends Controller
{
    public function __construct(){	
		parent::__construct();
		$this->table = 't_menu_type';
	}
    public function index(){
		$sql = "select column_name from information_schema.columns where table_name='t_menu_type'";
		$columns = DB::select($sql);
      return $columns;
  }
}
