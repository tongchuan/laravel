<?php

namespace App\Http\Middleware;

use Closure;

class CorsMiddleware
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
        // $response = $next($request);
        // $response->header('Access-Control-Allow-Origin', '*');
        // $response->header('Access-Control-Allow-Headers', 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type');
        // $response->header('Access-Control-Allow-Methods', 'GET, POST, PATCH, PUT, OPTIONS');
        // $response->header('Access-Control-Allow-Credentials', 'false');
        // return $response;
        header('Access-Control-Allow-Origin: *');
        // header('Access-Control-Allow-Methods:POST,GET,OPTIONS,PUT,DELETE');
        // header('Access-Control-Allow-Headers:DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type');
        $headers = [
            'Access-Control-Allow-Methods'=> 'POST, GET, OPTIONS, PUT, DELETE',
            // 'Access-Control-Allow-Headers'=> 'Content-Type, X-Auth-Token, Origin'
            'Access-Control-Allow-Headers'=> 'DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type'
        ];
        if($request->getMethod() == "OPTIONS") {
            return Response::make('OK', 200, $headers);
        }
        $response = $next($request);
        foreach($headers as $key => $value)
            $response->header($key, $value);
        return $response;
    }
}
