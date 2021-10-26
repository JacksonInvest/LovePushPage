<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePersonalityQuestionsOptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('personality_questions_options', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('personality_question_id');
            $table->foreign('personality_question_id')->references('id')->on('personality_questions')->onDelete('cascade');
            $table->string('option');
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
        Schema::dropIfExists('personality_questions_options');
    }
}
