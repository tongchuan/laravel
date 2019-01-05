<?php

// use App\Http\Controllers\User\UserController;
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
  return 'Hello World Test 111';
    // return view('welcome');
});
Route::get('/user', function () {
  return '{
  	"name": "张彤川",
  	"age": 30
  }';
    // return view('welcome');
});

Route::get('foo', function() {
	return 'foo get';
});
Route::post('foo', function() {
	return '{"data": "post foo"}';
});
Route::put('foo', function() {
	return '{"data": "put foo"}';
});
Route::patch('foo', function() {
	return '{"data": "patch foo"}';
});
Route::delete('foo', function() {
	return '{"data": "delete foo"}';
});
Route::options('foo', function() {
	return '{"data": "options foo"}';
});
// 有时候还需要注册路由响应多个 HTTP 请求——这可以通过 match 方法来实现。或者，甚至可以使用 any 方法注册一个路由来响应所有 HTTP 请求
Route::match(['get', 'post'], '/match', function () {
    return '{"data": "match get post"}';
});
Route::any('/any', function () {
    return '{"data": "any"}';
});
// 有时我们需要在路由中捕获 URI 片段。比如，要从 URL 中捕获用户 ID，需要通过如下方式定义路由参数
Route::get('user/{id}', function ($id) {
    return 'User '.$id;
});
Route::get('posts/{post}/comments/{comment}', function ($postId, $commentId) {
    return 'aa'.$postId.'======='.$commentId;
});
// 有时候可能需要指定可选的路由参数，这可以通过在参数名后加一个 ? 标记来实现，这种情况下需要给相应的变量指定默认值：
Route::get('user1/{name?}', function ($name = null) {
    return $name;
});
Route::get('user1/{name?}', function ($name = 'John') {
    return $name;
});
// 可以使用路由实例上的where方法来约束路由参数的格式。where方法接收参数名和一个正则表达式来定义该参数如何被约束：
// Route::get('user/{name}', function ($name) {
//     //
// })->where('name', '[A-Za-z]+');

// Route::get('user/{id}', function ($id) {
//     //
// })->where('id', '[0-9]+');

// Route::get('user/{id}/{name}', function ($id, $name) {
//     //
// })->where(['id' => '[0-9]+', 'name' => '[a-z]+']);

// Route::get('/user', 'User\UserController@index');

// 命名路由为生成 URL 或重定向提供了便利。实现也很简单，在定义路由时使用数组键 as 指定路由名称：

Route::get('users/profile', ['as' => 'profile', function () {
    return 'users/profile';
}]);

Route::get('u/profile', [
    'as' => 'profileuser', 'uses' => 'UserController@showProfile'
]);