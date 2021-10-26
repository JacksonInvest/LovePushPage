<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddSeetingsparamToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->tinyInteger('is_restrict_fb_friends')->comment('1=> not restrict, 0=> restrict')->default(1)->after('status');
            $table->tinyInteger('partner_preference')->comment('1=> male, 2=> female, 3=> anyone')->default(3)->after('is_restrict_fb_friends');
            $table->tinyInteger('subscription_type')->comment('1=>free, 2=>premium, 3=>vip')->default(1)->after('role');
            $table->date('subscription_expire_date')->nullable()->after('subscription_type');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
             $table->dropColumn(['is_restrict_fb_friends', 'partner_preference', 'subscription_type', 'subscription_expire_date']);
        });
    }
}
