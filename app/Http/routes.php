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
  return 'Hello World';
    // return view('welcome');
});
Route::get('/user', function () {
  return '{
  	"name": "张彤川",
  	"age": 30
  }';
    // return view('welcome');
});
Route::group(['middleware'=>'cors', 'namespace' => 'Admin', 'prefix' => 'admin', 'as' => 'Admin::'], function(){
    Route::any('/', ['as' => 'index','uses' => 'AdminController@index']);
    Route::any('/add', ['as' => 'add','uses' => 'AdminController@add']);
    Route::any('/list', ['as' => 'list','uses' => 'AdminController@getList']);
    Route::any('/login', ['as' => 'login','uses' => 'AdminController@login']);
});

Route::group(['middleware'=>'api', 'namespace' => 'News', 'prefix' => 'news', 'as' => 'News::'], function(){
    Route::any('/', ['as' => 'index','uses' => 'NewsController@index']);
    Route::any('/add', ['as' => 'add','uses' => 'NewsController@add']);
    Route::any('/update', ['as' => 'update','uses' => 'NewsController@update']);
    Route::any('/delete', ['as' => 'delete','uses' => 'NewsController@delete']);
    Route::any('/query', ['as' => 'query','uses' => 'NewsController@query']);

    Route::match(['get', 'post'], '/type', ['as' => 'type','uses' => 'NewsTypeController@index']);
    Route::match(['get', 'post'], '/typeadd', ['as' => 'typeadd','uses' => 'NewsTypeController@add']);
    Route::match(['get', 'post'], '/typeupdate/{id}', ['as' => 'typeupdate','uses' => 'NewsTypeController@update']);
    Route::match(['get', 'post'], '/typedelete/{id}', ['as' => 'typedelete','uses' => 'NewsTypeController@delete']);
    Route::match(['get', 'post'], '/typequery', ['as' => 'typequery','uses' => 'NewsTypeController@query']);
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
// http://97.64.37.117:8888/users/profile users/profile
Route::get('users/profile', ['as' => 'profile', function () {
    return 'users/profile';
}]);

// http://97.64.37.117:8888/u/profile showProfile
Route::get('u/profile', [
    'as' => 'profileuser', 'uses' => 'User\UserController@showProfile'
]);

/**
 * 这就是一个路由分组 /user和/user/profile都将使用auth中间件。

Route::group(['middleware' => 'auth'], function (){
    Route::get('/user', function (){

    });

    Route::get('/user/profile', function (){
        
    });
});
 */

/**
 * 路由前缀呢 就是讲此分组中的所有路由路径前加个前缀

Route::group(['prefix' => 'admin'], function (){

     路由分组是可以嵌套的哦

    Route::group(['middleware' => 'auth'], function (){

         这条路由不仅使用auth中间件,而且还加了admin前缀,我们通过/admin/user才能访问

        Route::get('/user', function (){

        });

        Route::get('/user/profile', function (){

        });
    });

     访问路径是:/admin

    Route::get('/', function (){
        
    });;
});
 */


/**
 * 比如我们可以输入larger来访问路由,在子路由中可以通过参数来把larger取到。

Route::group(['domain' => '{account}.myapp.com'], function () {
    Route::get('user/{id}', function ($account, $id) {
        //
    });
});
 */

 /**
 * 只要指明了命名空间,那么在子路由中所使用的所有控制器都位于App\Http\Controller\Admin这个命名空间下。

Route::group(['namespace' => 'Admin', 'prefix' => 'admin'], function(){
    其实HomeController在App\Http\Controller\Admin这个命名空间下。
    Route::get('/', 'HomeController@index');
});

 */


/**
 * 跟普通路由一样 也是用as来命名但是首字母最好大写后面跟俩冒号 代表它是一个分组 如果这样写 我们就可以通过 route('Admin::index')方式来找到它了

Route::group(['namespace' => 'Admin', 'prefix' => 'admin', 'as' => 'Admin::'], function(){
    Route::get('/', ['as' => 'index','uses' => 'HomeController@index']);
});
 */