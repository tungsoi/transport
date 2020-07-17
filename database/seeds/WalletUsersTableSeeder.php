<?php

use App\User;
use Illuminate\Database\Seeder;

class WalletUsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = User::all();
        foreach ($users as $user) {
            $user->update([
                'wallet'    =>  rand(-1000000, 3000000)
            ]);
        }
    }
}
