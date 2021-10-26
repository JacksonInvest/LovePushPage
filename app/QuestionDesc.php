<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class QuestionDesc extends Model
{
    //
    public function getQuestionAttribute($value) {

		return ucfirst($value);
	}
}
