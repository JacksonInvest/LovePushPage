<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePostAdsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('post_ads', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->string('title');
            $table->text('description');
            $table->tinyInteger('post_type')->default(1)->comment('1=> love ad, 2=> connect ad');
            $table->string('image')->nullable();
            $table->string('location')->nullable();
            $table->string('latitude')->nullbale();
            $table->string('longitude')->nullbale();
            $table->tinyInteger('is_post_anonymously')->default(1)->comment('1=> show, 0=> profile hidden');
            $table->integer('radius')->nullable();
            $table->tinyInteger('status')->default(1)->comment('1=> active, 0=> not active');
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
        Schema::dropIfExists('post_ads');
    }
}
