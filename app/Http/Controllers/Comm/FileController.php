<?php

namespace App\Http\Controllers\Comm;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Storage;
class FileController extends Controller
{
	public function __construct(){	
		parent::__construct();
		// $this->table = 't_adv';
	}
	public function index(){
		echo base_path();
		exit();
	}
    public function show(){
        echo "string";
        exit();
    }
    public function images(Request $request,$imagename){
        // http://localhost/storage/app/uploads/2019-01-22-03-2.6-47-5c468d77bbbf9
        $path = storage_path('app/uploads/').$imagename;
        $extarr = array('gif','jpg','jpeg','png','bmp','swf');
        $flag = true;
        foreach ($extarr as $key => $value) {
            if(file_exists($path.'.'.$value)){
                $flag = false;
                $path = $path.'.'.$value;
                break;
            }
        }
        if($flag){
            //报404错误
            header("HTTP/1.1 404 Not Found");
            header("Status: 404 Not Found");
            exit;
        }
        header('Content-type: image/jpg');
        echo file_get_contents($path);
    }
	public function upload(Request $request){
		 if ($request->isMethod('post')) {
		 	echo json_encode($request->input());
            $file = $request->file();
            foreach ($file as $key => $value) {
            	$originalName = $value->getClientOriginalName(); // 文件原名
                $ext = $value->getClientOriginalExtension();     // 扩展名
                $realPath = $value->getRealPath();   //临时文件的绝对路径
                $type = $value->getClientMimeType();     // image/jpeg
                // 上传文件
                $filename = date('Y-m-d-H-i-s') . '-' . uniqid() . '.' . $ext;
                // echo file_get_contents($realPath);
                // exit();
                // $bool = Storage::disk('uploads2')->put($filename, file_get_contents($realPath));
                $bool = Storage::disk('uploads')->put($filename, file_get_contents($realPath));
            }
            return var_dump($file);
            exit();
            // 文件是否上传成功
            // if ($file->isValid()) {
                // 获取文件相关信息
                // $originalName = $file->getClientOriginalName(); // 文件原名
                // $ext = $file->getClientOriginalExtension();     // 扩展名
                // $realPath = $file->getRealPath();   //临时文件的绝对路径
                // $type = $file->getClientMimeType();     // image/jpeg
                // // 上传文件
                // $filename = date('Y-m-d-H-i-s') . '-' . uniqid() . '.' . $ext;
                // // 使用我们新建的uploads本地存储空间（目录）
                // $bool = Storage::disk('uploads')->put($filename, file_get_contents($realPath));
                // var_dump($bool);
            // }
        }
	}
    //
}
