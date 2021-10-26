<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserTest extends Model
{
    //

	public function ques() {
		return $this->hasMany('App\TestQues', 'test_id','id');
	}


	public function testScore() {
		return $this->hasOne('App\TestScore','test_id_2','id');
	}

	//get All user tests
	public static function getUserTests() {

		$user_tests = UserTest::with('ques.answers')
								->get()
								->toArray();
		return $user_tests;
	}

}
