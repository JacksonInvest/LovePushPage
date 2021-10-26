<?php

namespace App;
use App\Http\Controllers\Controller;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    //

    public function getQuestionDesc() {

        // $locale = 'en';
        // if ($_SERVER['HTTP_LOCALE']) {
        //     $locale = $_SERVER['HTTP_LOCALE'];
        // }

        // $language_id = 1; //English
        // if($locale == 'de') {
        //     $language_id = 2; //German
        // }

        return $this->hasOne('App\QuestionDesc')
                    ->select('question_id','language_id','question','status')
                    ->where('status',1);
                    // ->where('language_id', $language_id);
    }

    public function getQuesOptions() {

        return $this->hasMany('App\QuesOption')
                    ->select('id','question_id')
                    ->where('status',1);
    }

    public static function getAllActiveQuestion($language_id) {

        $questions = Question::select('id','max_scores','max_answers','score_multiple')
                                ->where('status', 1)
                                // ->with('getQuestionDesc')
                                ->with(['getQuestionDesc' => function($query) use ($language_id) {
                                    $query->where('language_id', $language_id);
                                }])
                                ->whereHas('getQuestionDesc', function($query) use ($language_id) {
                                    $query->where('language_id', $language_id);
                                })
                                ->with(['getQuesOptions.getQuesOptionDesc' => function($query) use  ($language_id) {
                                    $query->where('language_id', $language_id); 
                                }])
                                ->whereHas('getQuesOptions.getQuesOptionDesc', function($query) use  ($language_id) {
                                    $query->where('language_id', $language_id); 
                                })
                                ->get();

        return $questions;
    }
 
}
