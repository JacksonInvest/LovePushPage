<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function generateImageName(){
        $rand = rand('11111','99999');
        $new_file_name = time().$rand;
        return $new_file_name;
    }

    public function getLanguageId() {

    	$locale = 'en';
        if ($_SERVER['HTTP_LOCALE']) {
            $locale = $_SERVER['HTTP_LOCALE'];
        }

        $language_id = 1; //English
        if($locale == 'de') {
        	$language_id = 2; //German
        }
        return $language_id;
    }

}
