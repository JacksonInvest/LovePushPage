<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TestQuesComparison extends Model
{
    //
	public $timestamps = false;

	public function userInfo() {
		return $this->hasOne('App\User','id','test_id_2')
					->select('id','name','email','profile_image');
	}
}
