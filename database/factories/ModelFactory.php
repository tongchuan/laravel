<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

$factory->define(App\User::class, function (Faker\Generator $faker) {
	$user = DB::table('users')->select('id')->orderBy(DB::raw('RAND()'))->first();
    if(empty($user))
    {
        $user->id = 0;
    }

    $article = DB::table('articles')->select('id')->orderBy(DB::raw('RAND()'))->first();
    if(empty($article))
    {
        $article->id = 0;
    }
    return [
        'name' => $faker->name,
        'email' => $faker->safeEmail,
        'password' => bcrypt(str_random(10)),
        'remember_token' => str_random(10),
    ];
});
