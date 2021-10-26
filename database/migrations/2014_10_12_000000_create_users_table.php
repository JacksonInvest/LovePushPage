<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('username')->nullable();
            $table->string('email')->unique();
            $table->string('phone_code')->nullable();
            $table->string('phone')->nullable();
            $table->string('address')->nullable();
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->tinyInteger('gender')->default(1)->comment('1=> male, 2=> female')->nullbale();
            $table->string('social_id')->nullable();
            $table->tinyInteger('login_type')->comment('1=> manaual,2=> facebook, 3=> google, 4=> instagram')->default(1);
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->nullable();
            $table->string('love_push_intention')->nullable();
            $table->string('relationship')->nullable();
            $table->string('language')->nullable();
            $table->string('size')->nullable();
            $table->string('eyecolor')->nullable();
            $table->string('haircolor')->nullable();
            $table->string('education')->nullable();
            $table->string('job')->nullable();
            $table->string('employer')->nullable();
            $table->string('hobbies')->nullable();
            $table->tinyInteger('sexual_orientation')->comment('1=> hetrosexual, 2=> bisexual, 3=> homesexual')->nullable();
            $table->string('aboutme')->nullable();
            $table->tinyInteger('status')->comment('0=> de-active, 1=> active')->default(1);
            $table->tinyInteger('is_phone_verify')->default(0)->comment('0=> not, 1=> yes');
            $table->tinyInteger('is_profile_complete')->default(0)->comment('0=> not, 1=> yes');
            $table->tinyInteger('device_type')->default(1)->comment('1=> android, 2=> ios');
            $table->string('device_token')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
