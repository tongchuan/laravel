<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
    	$this->call(CommentsTableSeeder::class); // 会调用CommentsTableSeeder的run方法
        // $this->call(UsersTableSeeder::class);
    }
}
