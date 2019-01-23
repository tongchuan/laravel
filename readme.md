创建建表文件
php artisan make:migration create_comments_table
生成表
php artisan migrate
创建填充表数据的文件
php artisan make:seed ReplyTableSeeder

命令  描述
$table->bigIncrements('id');    自增ID，类型为bigint
$table->bigInteger('votes');    等同于数据库中的BIGINT类型
$table->binary('data'); 等同于数据库中的BLOB类型
$table->boolean('confirmed');   等同于数据库中的BOOLEAN类型
$table->char('name', 4);    等同于数据库中的CHAR类型
$table->date('created_at'); 等同于数据库中的DATE类型
$table->dateTime('created_at'); 等同于数据库中的DATETIME类型
$table->decimal('amount', 5, 2);    等同于数据库中的DECIMAL类型，带一个精度和范围
$table->double('column', 15, 8);    等同于数据库中的DOUBLE类型，带精度, 总共15位数字，小数点后8位.
$table->enum('choices', ['foo', 'bar']);    等同于数据库中的 ENUM类型
$table->float('amount');    等同于数据库中的 FLOAT 类型
$table->increments('id');   数据库主键自增ID
$table->integer('votes');   等同于数据库中的 INTEGER 类型
$table->json('options');    等同于数据库中的 JSON 类型
$table->jsonb('options');   等同于数据库中的 JSONB 类型
$table->longText('description');    等同于数据库中的 LONGTEXT 类型
$table->mediumInteger('numbers');   等同于数据库中的 MEDIUMINT类型
$table->mediumText('description');  等同于数据库中的 MEDIUMTEXT类型
$table->morphs('taggable'); 添加一个 INTEGER类型的 taggable_id 列和一个 STRING类型的 taggable_type列
$table->nullableTimestamps();   和 timestamps()一样但允许 NULL值.
$table->rememberToken();    添加一个 remember_token 列： VARCHAR(100) NULL.
$table->smallInteger('votes');  等同于数据库中的 SMALLINT 类型
$table->softDeletes();  新增一个 deleted_at 列 用于软删除.
$table->string('email');    等同于数据库中的 VARCHAR 列  .
$table->string('name', 100);    等同于数据库中的 VARCHAR，带一个长度
$table->text('description');    等同于数据库中的 TEXT 类型
$table->time('sunrise');    等同于数据库中的 TIME类型
$table->tinyInteger('numbers'); 等同于数据库中的 TINYINT 类型
$table->timestamp('added_on');  等同于数据库中的 TIMESTAMP 类型
$table->timestamps();   添加 created_at 和 updated_at列.
$table->uuid('id'); 等同于数据库的UUID


# Laravel PHP Framework

[![Build Status](https://travis-ci.org/laravel/framework.svg)](https://travis-ci.org/laravel/framework)
[![Total Downloads](https://poser.pugx.org/laravel/framework/d/total.svg)](https://packagist.org/packages/laravel/framework)
[![Latest Stable Version](https://poser.pugx.org/laravel/framework/v/stable.svg)](https://packagist.org/packages/laravel/framework)
[![Latest Unstable Version](https://poser.pugx.org/laravel/framework/v/unstable.svg)](https://packagist.org/packages/laravel/framework)
[![License](https://poser.pugx.org/laravel/framework/license.svg)](https://packagist.org/packages/laravel/framework)

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable, creative experience to be truly fulfilling. Laravel attempts to take the pain out of development by easing common tasks used in the majority of web projects, such as authentication, routing, sessions, queueing, and caching.

Laravel is accessible, yet powerful, providing tools needed for large, robust applications. A superb inversion of control container, expressive migration system, and tightly integrated unit testing support give you the tools you need to build any application with which you are tasked.

## Official Documentation

Documentation for the framework can be found on the [Laravel website](http://laravel.com/docs).

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](http://laravel.com/docs/contributions).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell at taylor@laravel.com. All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).



命令
说明
备注




php artisan clear-compiled
清除编译后的类文件



php artisan down
使应用程序进入维修模式



php artisan up
退出应用程序的维护模式



php artisan env
显示当前框架环境



php artisan fresh
清除包含框架外的支架



php artisan help
显示命令行的帮助



php artisan list
列出命令



php artisan migrate
运行数据库迁移



php artisan env
显示当前框架环境



php artisan optimize
为了更好的框架去优化性能



php artisan serve
在php开发服务器中服务这个应用
--port 8080，--host 0.0.0.0


php artisan tinker
在应用中交互



php artisan app:name ?
设置应用程序命名空间


php artisan auth:clear-resets
清除过期的密码重置密钥
未使用过


php artisan cache:clear
清除应用程序缓存



php artisan cache:table
创建一个缓存数据库表的迁移



php artisan config:cache
创建一个加载配置的缓存文件



php artisan config:clear
删除配置的缓存文件



php artisan db:seed
数据库生成模拟数据



php artisan event:generate
生成event和listen
需要实现配置eventserviceprivoder


php artisan make:command ?
创建一个新的命令处理程序类



php artisan make:console ?
生成一个Artisan命令



php artisan key:generate
设置程序密钥



php artisan make:controller  ?
生成一个资源控制类



php artisan make:middleware  ?
生成一个中间件



php artisan make:migration ?
生成一个迁移文件



php artisan make:model  ?
生成一个Eloquent 模型类



php artisan make:provider ?
生成一个服务提供商的类



php artisan make:request  ?
生成一个表单消息类



php artisan migrate:install ?
创建一个迁移库文件



php artisan make:migration ?
生成一个迁移文件



php artisan migrate:refresh  ?
复位并重新运行所有的迁移



php artisan migrate:reset ?
回滚全部数据库迁移



php artisan migrate:rollback  ?
回滚最后一个数据库迁移



php artisan migrate:status
显示列表的迁移



php artisan queue:failed
列出全部失败的队列工作



php artisan queue:failed-table ?
创建一个迁移的失败的队列数据库工作表



php artisan queue:flush
清除全部失败的队列工作



php artisan queue:forget   ?
删除一个失败的队列工作



php artisan queue:listen  ?
监听一个确定的队列工作


php artisan queue:restart
重启现在正在运行的所有队列工作



php artisan queue:retry
重试一个失败的队列工作



php artisan queue:subscribe
订阅URL,放到队列上



php artisan queue:table
创建一个迁移的队列数据库工作表



php artisan queue:work
进行下一个队列任务


php artisan route:cache
为了更快的路由登记，创建一个路由缓存文件



php artisan route:clear
清除路由缓存文件



php artisan route:list
列出全部的注册路由



php artisan schedule:run
运行预定命令



php artisan session:table
创建一个迁移的SESSION数据库工作表



php artisan vendor:publish
发表一些可以发布的有用的资源来自提供商的插件包
composer install --no-script
composer install --no-scripts
composer install
php artisan storage:link

在php.ini中，找到disable_functions选项，看看后面是否有proc_open函数被禁用了，如果有的话，去掉即可

php artisan config:cache
php artisan optimize

composer update

fastcgi.conf
fastcgi_param PHP_ADMIN_VALUE "open_basedir=:/wwwroot/laravel:/tmp/:/proc/";


php artisan make:controller Admin/AdminController
php artisan make:controller Adv/AdvTypeController
php artisan make:controller Adv/AdvController
php artisan make:controller Comm/FileController
php artisan make:controller Menu/MenuTypeController
php artisan make:controller Menu/MenuController
php artisan make:middleware _Name_Middleware
php artisan make:middleware AdminMiddleware



laravel 控制器类DB类操作
从数据表中取得所有的数据列
$users = DB::table('users')->get();

foreach ($users as $user)
{
    var_dump($user->name);
}
从数据表中分块查找数据列
DB::table('users')->chunk(100, function($users)
{
    foreach ($users as $user)
    {
        //
    }
});
通过在 闭包 中返回 false 来停止处理接下来的数据列：

DB::table('users')->chunk(100, function($users)
{
    //

    return false;
});
从数据表中取得单一数据列
$user = DB::table('users')->where('name', 'John')->first();

var_dump($user->name);
从数据表中取得单一数据列的单一字段
$name = DB::table('users')->where('name', 'John')->pluck('name');
取得单一字段值的列表
$roles = DB::table('roles')->lists('title');
这个方法将会返回数据表 role 的 title 字段值的数组。你也可以通过下面的方法，为返回的数组指定自定义键值。

$roles = DB::table('roles')->lists('title', 'name');
指定查询子句 (Select Clause)
$users = DB::table('users')->select('name', 'email')->get();

$users = DB::table('users')->distinct()->get();

$users = DB::table('users')->select('name as user_name')->get();
增加查询子句到现有的查询中
$query = DB::table('users')->select('name');

$users = $query->addSelect('age')->get();
使用 where 及运算符
$users = DB::table('users')->where('votes', '>', 100)->get();
「or」语法
$users = DB::table('users')
                    ->where('votes', '>', 100)
                    ->orWhere('name', 'John')
                    ->get();
使用 Where Between
$users = DB::table('users')
                    ->whereBetween('votes', [1, 100])->get();
使用 Where Not Between
$users = DB::table('users')
                    ->whereNotBetween('votes', [1, 100])->get();
使用 Where In 与数组
$users = DB::table('users')
                    ->whereIn('id', [1, 2, 3])->get();

$users = DB::table('users')
                    ->whereNotIn('id', [1, 2, 3])->get();
使用 Where Null 找有未配置的值的数据
$users = DB::table('users')
                    ->whereNull('updated_at')->get();
Dynamic Where Clauses
You may even use "dynamic" where statements to fluently build where statements using magic methods:

$admin = DB::table('users')->whereId(1)->first();

$john = DB::table('users')
                    ->whereIdAndEmail(2, 'john@doe.com')
                    ->first();

$jane = DB::table('users')
                    ->whereNameOrAge('Jane', 22)
                    ->first();
排序(Order By)、分群(Group By) 及 Having
$users = DB::table('users')
                    ->orderBy('name', 'desc')
                    ->groupBy('count')
                    ->having('count', '>', 100)
                    ->get();
偏移(Offset) 及 限制(Limit)
$users = DB::table('users')->skip(10)->take(5)->get();
 

Joins
查询构造器也可以使用 join 语法，看看下面的例子：

基本的 Join 语法
DB::table('users')
            ->join('contacts', 'users.id', '=', 'contacts.user_id')
            ->join('orders', 'users.id', '=', 'orders.user_id')
            ->select('users.id', 'contacts.phone', 'orders.price')
            ->get();
Left Join 语法
DB::table('users')
        ->leftJoin('posts', 'users.id', '=', 'posts.user_id')
        ->get();
你也可以指定更高级的 join 子句：

DB::table('users')
        ->join('contacts', function($join)
        {
            $join->on('users.id', '=', 'contacts.user_id')->orOn(...);
        })
        ->get();
如果你想在你的 join 中使用 where 型式的子句，你可以在 join 子句里使用 where 或orWhere 方法。下面的方法将会比较 contacts 数据表中的 user_id 的数值，而不是比较两个字段。

DB::table('users')
        ->join('contacts', function($join)
        {
            $join->on('users.id', '=', 'contacts.user_id')
                 ->where('contacts.user_id', '>', 5);
        })
        ->get();
 

高级 Wheres
群组化参数
有些时候你需要更高级的 where 子句，如「where exists」或嵌套的群组化参数。Laravel 的查询构造器也可以处理这样的情况：

DB::table('users')
            ->where('name', '=', 'John')
            ->orWhere(function($query)
            {
                $query->where('votes', '>', 100)
                      ->where('title', '<>', 'Admin');
            })
            ->get();
上面的查找语法会产生下方的 SQL：

select * from users where name = 'John' or (votes > 100 and title <> 'Admin')
Exists 语法
DB::table('users')
            ->whereExists(function($query)
            {
                $query->select(DB::raw(1))
                      ->from('orders')
                      ->whereRaw('orders.user_id = users.id');
            })
            ->get();
上面的查找语法会产生下方的 SQL：

select * from users
where exists (
    select 1 from orders where orders.user_id = users.id
)
 

聚合
查找产生器也提供各式各样的聚合方法，如 count、max、min、avg 及 sum。

使用聚合方法
$users = DB::table('users')->count();

$price = DB::table('orders')->max('price');

$price = DB::table('orders')->min('price');

$price = DB::table('orders')->avg('price');

$total = DB::table('users')->sum('votes');
 

原生表达式
有些时候你需要使用原生表达式在查找语句里，这样的表达式会成为字串插入至查找，因此要小心勿建立任何 SQL 注入点。要建立原生表达式，你可以使用 DB::raw 方法：

使用原生表达式
$users = DB::table('users')
                     ->select(DB::raw('count(*) as user_count, status'))
                     ->where('status', '<>', 1)
                     ->groupBy('status')
                     ->get();
添加
添加数据进数据表
DB::table('users')->insert(
    ['email' => 'john@example.com', 'votes' => 0]
);
添加自动递增 (Auto-Incrementing) ID 的数据至数据表
如果数据表有自动递增的ID，可以使用 insertGetId 添加数据并返回该 ID：
$id = DB::table('users')->insertGetId(
    ['email' => 'john@example.com', 'votes' => 0]
);
注意: 当使用 PostgreSQL 时，insertGetId 方法会预期自动增加的字段是以「id」为命名。
添加多个数据进数据表
DB::table('users')->insert([
    ['email' => 'taylor@example.com', 'votes' => 0],
    ['email' => 'dayle@example.com', 'votes' => 0]
]);
更新
更新数据表中的数据
DB::table('users')
            ->where('id', 1)
            ->update(['votes' => 1]);
自增或自减一个字段的值
DB::table('users')->increment('votes');
DB::table('users')->increment('votes', 5);
DB::table('users')->decrement('votes');

DB::table('users')->decrement('votes', 5);
也能够同时指定其他要更新的字段：

DB::table('users')->increment('votes', 1, ['name' => 'John']);
 

删除
删除数据表中的数据
DB::table('users')->where('votes', '<', 100)->delete();
删除数据表中的所有数据
DB::table('users')->delete();
清空数据表
DB::table('users')->truncate();
 

Unions
查询构造器也提供一个快速的方法去「合并 (union)」两个查找的结果：

$first = DB::table('users')->whereNull('first_name');

$users = DB::table('users')->whereNull('last_name')->union($first)->get();
unionAll 方法也可以使用，它与 union 方法的使用方式一样。

 

悲观锁定 (Pessimistic Locking)
查询构造器提供了少数函数协助你在 SELECT 语句中做到「悲观锁定」。

想要在 SELECT 语句中加上「Shard lock」，只要在查找语句中使用 sharedLock 函数：

DB::table('users')->where('votes', '>', 100)->sharedLock()->get();
要在 select 语法中使用「锁住更新(lock for update)」时，你可以使用 lockForUpdate方法：

DB::table('users')->where('votes', '>', 100)->lockForUpdate()->get();