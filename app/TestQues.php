<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TestQues extends Model
{
    //
	public $timestamps = false;

	public function answers() {
		return $this->hasMany('App\TestQuesAns', 'test_que_id','id');
	}


	public function ansInfo() {
		return $this->hasMany('App\TestQuesAns','test_que_id','id');
	}

	public static function QueAnsInfo($test_id, $ques_id) {

		$queInfo = TestQues::where('test_id', $test_id)
								->where('ques_id', $ques_id)
								->orderBy('id','desc')
								->with('ansInfo')
								->first();
								// ->toArray();

		return $queInfo;

	}
}
