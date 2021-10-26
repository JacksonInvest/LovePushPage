<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AppLink extends Model
{
	protected $table = "app_links";

	protected $hidden = [
		'created_at','updated_at'
	];
}	
