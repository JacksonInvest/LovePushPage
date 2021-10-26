<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class QuesOptionDesc extends Model
{
    //
	public function getOptionAttribute($value) {

		return ucfirst($value);
	}
}
