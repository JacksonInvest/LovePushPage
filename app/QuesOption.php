<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class QuesOption extends Model
{
    //

	public function getQuesOptionDesc() {
		
		return $this->hasOne('App\QuesOptionDesc')
					->select('ques_option_id','language_id','option')
					->where('status',1);
	}
}
