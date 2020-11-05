<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\ScheduleLog;
use App\User;
use App\Models\Aloorder\User as AloorderUser;
use Illuminate\Support\Facades\DB;

class SyncDataAdminUserFromAloorder extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sync:user-aloorder';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        DB::beginTransaction();
        try {
            $aliUsers = User::all();
            $aloUsers = AloorderUser::all();
    
            foreach ($aloUsers as $aloUser) {
                echo "$aloUser->username \t";
                $flag = User::whereUsername($aloUser->username)->first();
    
                if ($flag) {
                    User::find($aloUser->id)->update($aloUser->toArray());
                    echo " update \n";
                } else {
                    User::insertGetId($aloUser->toArray());
                    echo " create \n";
    
                    if ($aloUser->is_customer == 1) {
                        DB::table('admin_role_users')->insert([
                            'user_id'   =>  $aloUser->id,
                            'role_id'   =>  2
                        ]);
                    }
                }
            }
    
            ScheduleLog::create([
                'code'  =>  'sync-user-from-order-to-logi'
            ]);

            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();

            ScheduleLog::create([
                'code'  =>  'sync-user-from-order-to-logi / '. $e->getMessage()
            ]);
        }
        
    }
}
