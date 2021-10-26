<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class NotificationDesc extends Model
{

    public function getMessageAttribute($value) {
		return ucfirst($value);
	}
}
