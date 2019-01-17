<?php

namespace App\Http\Middleware;
use Illuminate\Support\Facades\Cookie;
use Closure;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // if(!Cookie::get('user')){
            // $data = null;
            // $data['message'] = 'qing deng lu';
            // $data['code'] = 10000;
            // $data['isSuccess'] = true;
            // $data['data'] = array(); 
            // echo json_encode($data);
            // exit();
            // echo "string";
            // exit();
            // return redirect()->to('/admin/login');
        // }
        return $next($request);
    }
}
