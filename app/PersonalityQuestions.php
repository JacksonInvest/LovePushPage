<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PersonalityQuestions extends Model
{
    public function options(){
    	return $this->hasMany('App\PersonalityQuestionsOptions', 'personality_question_id', 'id');
    }
}
