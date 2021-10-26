<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class QbChatDialogId extends Model
{
    public function matchInfo(){
    	return $this->belongsTo('App\Match','match_id','id');
    }
}
