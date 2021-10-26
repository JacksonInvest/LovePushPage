<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Intention extends Model
{
    //
    public function getNameAttribute($value) {

    	return ucfirst($value);
    }


    public static function getIntentions() {
    	$intentions = Intention::select('id','name')
    							->where('status',1)
                            	->get();
		return $intentions;                     
    }
}
