<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSubscriptionPlansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subscription_plans', function (Blueprint $table) {
            $table->increments('id');
            $table->tinyInteger('type')->comment('1=>free, 2=>premium, 3=>vip')->nullable();
            $table->string('message_to_unknown_users')->nullable()
            $table->string('voice_memo_and_call')->nullable();
            $table->string('likes')->nullable();
            $table->string('see_likes')->nullable();
            $table->string('see_visitors')->nullable();
            $table->string('personal_swiping')->nullable();
            $table->string('ads')->nullable();
            $table->string('see_live_video')->nullable();
            $table->string('live_video_streaming')->nullable();
            $table->string('view_storys')->nullable();
            $table->string('network_marketing')->nullable();
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
        Schema::dropIfExists('subscription_plans');
    }
}
