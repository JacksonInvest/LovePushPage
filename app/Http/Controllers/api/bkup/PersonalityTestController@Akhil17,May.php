<?php

namespace App\Http\Controllers\api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\User;
use Auth;
use App\Question;
use DB;
use App\QuestionDesc;
use App\UserAttemptQuestion;
use App\UserAttemptQuesAnswer;
use Illuminate\Validation\Rule;

use App\UserTest;
use App\TestQues;
use App\TestQuesAns;
use App\TestQuesComparison;
use Exception;

class PersonalityTestController extends Controller
{   
    public function questioons(Request $request) {

        $language_id = $this->getLanguageId();
        // echo $language_id; die;

        $questions = Question::getAllActiveQuestion($language_id);

        return response()->json([
            'status' => 200,
            'data'   => $questions,
            'message'=> 'Personality test questions', 
        ]);
    }

    //User answer for a single question
    public function userAnswerSave(Request $request) {

        $validator = Validator::make($request->all(), [
                'user_id'     => 'required|exists:users,id',
                'question_id' => 'required|exists:questions,id',
                'option_ids'  => 'required',
            ]
            // ,[
            //     'email.exists'      => trans('api.user.user_error'),
            // ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $user_id = $request->user_id;

        $check = UserTest::where('user_id', $user_id)->first();
        if($check) {
            $test = $check;
        } else {
            $test = new UserTest;
            $test->user_id     = $user_id;
            $test->save();
        }

            //save test questions
            $ques = new TestQues;
            $ques->test_id = $test->id;
            $ques->ques_id = $request->question_id;
            if($ques->save()) {

                $option_ids = explode( ',', $request->option_ids);

                foreach ($option_ids as $key => $option_id) {
                    //save test answers
                    $option = new TestQuesAns;
                    $option->test_que_id = $ques->id;
                    $option->ans_id      = $option_id;
                    $option->save();
                }
            }

             /*-- Test score logic start  --*/
            if($request->question_id == 18) {

                //get All tests
                $user_tests = UserTest::getUserTests();
                // echo "<pre>"; print_r($user_tests); die;
                $res = [];
                $ky = 0;

                foreach ($user_tests as $key => $test) { // select one test 

                    // echo "<pre>"; print_r($test); die;
                    $other_tests = $this->_getOtherUsers($user_tests,$test['user_id']);
                    // echo "<pre>"; print_r($other_tests); die;


                    foreach ($test['ques'] as $key => $my_que) { //select one que

                        $c_que_id = $my_que['ques_id'];

                        //Now compare ans of ques of current user with all other user
                        foreach ($other_tests as $key => $other_test) {
                            foreach ($other_test['ques'] as $key => $other_que) {

                                // if($c_que_id == $other_que['id'] ){     ////now two ques matched
                                if($c_que_id == $other_que['ques_id'] ){     ////now two ques matched

                                    //now compare answers
                                    $other_test_anss = $other_que['answers'];
                                    $test_id_1 = $test['id'];
                                    $test_id_2 = $other_test['id'];
                                    $scores = $this->_getScores($c_que_id, $my_que['answers'], $other_test_anss, $test_id_1, $test_id_2);

                                    $res['scores'][$c_que_id] = $scores;

                                    /*foreach ($my_que['answers'] as $key => $my_anss) {

                                        foreach ($other_test_anss as $key => $other_anss) {
                                            // echo "<pre>"; print_r($other_anss); die;
                                            // echo 'my_anss='.$my_anss['test_que_id']."  ";
                                            // echo 'other_anss='.$other_anss['test_que_id']."<br>";

                                            // if($my_que['test_que_id'] == $other_anss['test_que_id']) {
                                            // if($my_anss['test_que_id'] == $other_anss['test_que_id']) {

                                                // echo "1"; die;
                                                // $res[$key]['que_id'] = $c_que_id;

                                                // $res[$key]['ans_id1'] = $my_anss['id'];
                                                // $res[$key]['ans_id2'] = $other_anss['id'];
                                            
                                                // $res[$key]['a1_c_que_id'] = $c_que_id;
                                                // $res[$key]['a2_o_que_id'] = $other_que['ques_id'];
                                                // $res[$key]['a1_que_id'] = $my_anss['test_que_id'];
                                                // $res[$key]['a2_que_id'] = $other_anss['test_que_id'];
                                                // $res[$key]['a1'] = $my_anss['ans_id'];
                                                // $res[$key]['a2'] = $other_anss['ans_id'];
                                                // ++$key;

                                                // $c_value = getValueOfAnswer($my_que['ans_id']);
                                                // $o_value = getValueOfAnswer($other_anss['ans_id']);

                                                // $marks = 0;
                                                // //que logic - start
                                                // if($c_value == $o_value){
                                                //     //give 20 marks
                                                //     $marks += 20;
                                                // } else if(){

                                                // } else{

                                                // }
                                                //que logic - end


                                                //score logic start
                                                // $scores = $this->_getScores($c_que_id, $my_anss['ans_id'], $other_anss['ans_id']);
                                                // $res[$ky]['my_ans_id']  = $my_anss['ans_id'];
                                                // $res[$ky]['other_anss'] = $other_anss['ans_id'];
                                                // $res[$ky]['que_id'] = $c_que_id;
                                                // $res[$ky]['scores'] = $scores;
                                                // ++$ky;
                                                //scores logic end
                                            // } else {
                                            //     // echo "2"."<br>";
                                            // }
                                        }
                                    }*/
                                    // echo "<pre>"; print_r($res); 
                                } 
                            }
                        }
                        
                    }
                    // echo "<pre>"; print_r($res); die; // die; //for one user
                    //Save scores 
                    

                    if(!empty($res['scores'])) {
                        //filter extra entries form result array
                        $new_res = $this->_filterResult($res['scores']);
                        // echo "<pre>"; print_r($new_res); //die;

                        //save scores in db
                        foreach ($new_res as $key => $res) { 
                            // echo "<pre>"; print_r($res); die;
                            
                            $obtained_scores = 0;
                            foreach ($res as $score) {
                                $obtained_scores += $score['score'];
                            }
                            // echo $obtained_scores."<br>";
                            // $test_id_1 = TestQues::where('id', $res[0]['test_que_1'])->value('test_id');
                            // $test_id_2 = TestQues::where('id', $res[0]['test_que_2'])->value('test_id');

                            $final_scores = $obtained_scores;
                            //common values
                            if($final_scores >= $res[0]['max_allowed_scores']) {
                                $final_scores = $res[0]['max_allowed_scores'];
                            }

                            //
                            foreach ($res as $score) {

                                $comp_res = TestQuesComparison::where('test_id_1', $score['test_id_1'])
                                                                ->where('test_id_2', $score['test_id_2'])
                                                                ->where('test_que_1', $res[0]['test_que_1'])
                                                                ->where('test_que_2', $res[0]['test_que_2'])
                                                                ->first();
                                if(empty($comp_res)) {
                                    $comp_res = new TestQuesComparison;
                                    $comp_res->obtained_scores    = $obtained_scores;
                                    $comp_res->max_allowed_scores = $res[0]['max_allowed_scores'];
                                    $comp_res->test_que_1         = $res[0]['test_que_1'];
                                    $comp_res->test_que_2         = $res[0]['test_que_2'];
                                    $comp_res->test_id_1          = $score['test_id_1'];
                                    $comp_res->test_id_2          = $score['test_id_2'];
                                    $comp_res->final_scores       = $final_scores;
                                    $comp_res->save();
                                }
                            }

                        }
                        // echo "<pre> ------"; print_r($res['scores']); 
                        // die;
                    } //save scores end here
                } //user test foreach end here

                // echo "<pre>"; print_r($res); die;

            }
                // echo "1111"; die;
            /*-- Test score logic start -- */

            return response()->json([
                'status' => 200,
                'data'   => 'ques',
                'message'=> trans('api.user.answer_saved'),
            ]);
    }

    public function _getOtherUsers($all_users,$current_user_id){
        return Collect($all_users)->reject(function($all_user) use ($current_user_id){
            return $all_user['user_id'] === $current_user_id;
        });
    }

    public function _getScores($que_id, $my_anss, $other_anss, $test_id_1,$test_id_2) {

        set_time_limit(0);
        $ky      = 0;
        $res     = [];

        if(in_array($que_id,[5,6,8,7,13,15])){ //if que is of multiple ans type

            // if(in_array($que_id,[6])){ //if que is of multiple ans type
            //     echo '<pre>before'; print_r($my_anss);
            //     echo '<pre>'; print_r($other_anss);
            //     echo '<pre>res'; print_r($res);// die;
            // }

            foreach ($my_anss as $key => $my_ans) {

                $scores  = 0;
                $max_allowed_scores = 0;
                $ans_id = $my_ans['ans_id'];

                foreach ($other_anss as $key1 => $other_ans) {
            
                    $keys = $this->searchForId($ans_id, $other_anss);
                    // var_dump($keys);
                    // echo 'ans_id = '.$ans_id.'<br>';
                    // echo 'o_ans_id = '.$other_ans['ans_id'].'<br>';

                    if($keys !== null){
                        if($que_id == 5) {
                            $scores += 20*2;
                            $max_allowed_scores += 80;
                        } else {
                            $scores += 20;
                            $max_allowed_scores += 40;
                        }
                        // unset($my_anss[$key]);
                        // unset($other_anss[$keys]);
                        $my_anss = $this->unset_n_reset($my_anss, $key);
                        $other_anss = $this->unset_n_reset($other_anss, $keys);

                        $res[$ky]['test_id_1'] = $test_id_2;
                        $res[$ky]['test_id_2'] = $test_id_1;
                        $res[$ky]['que_id'] = $que_id;
                        $res[$ky]['my_ans']  = $ans_id;
                        $res[$ky]['other_ans_id']  = $ans_id;
                        $res[$ky]['score']  = $scores;
                        $res[$ky]['max_allowed_scores']  = $max_allowed_scores    ;
                        $res[$ky]['test_que_1']  = $other_ans['test_que_id'];
                        $res[$ky]['test_que_2']  = $my_ans['test_que_id'];
                        $ky++;
                    }
                }
            }

            // if(in_array($que_id,[6])){ //if que is of multiple ans type
            //     echo '<pre>after1111'; print_r($my_anss);
            //     echo '<pre>'; print_r($other_anss);
            //     echo '<pre>res'; print_r($res); die;
            // }
        }
        
        foreach ($my_anss as $key => $my_ans) {

            $ans_id = $my_ans['ans_id'];
            $test_que_id = $my_ans['test_que_id'];

            foreach ($other_anss as $key1 => $other_ans) {
                $scores = 0;
                $max_allowed_scores = 0;
                // if(in_array($que_id,[5])){ //if que is of multiple ans type
                //     echo '<pre>after1111'; print_r($my_anss);
                //     echo '<pre>'; print_r($other_anss); die;
                //     // echo "<pre>res"; print_r($res); die;
                // }

                $other_ans_id = $other_ans['ans_id'];

                if($que_id == 3) {
                    // Answer 1 and 3 equal 10
                    // Answer 2 and 4 equal 10
                    // All others equal 5
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else if( ($ans_id == 9) && ($other_ans_id == 11) ) {
                        $scores +=10;
                    } else if( ($ans_id == 11) && ($other_ans_id == 9) ) {
                        $scores +=10;
                    } else if( ($ans_id == 10) && ($other_ans_id == 12) ) {
                        $scores +=10;
                    } else if( ($ans_id == 12) && ($other_ans_id == 10) ) {
                        $scores +=10;
                    } else {
                        $scores +=5;
                    }
                    $max_allowed_scores +=20;
                } else if($que_id == 4) {
                    // Answer 1 and 3 equal 10
                    // Answer 3 and 4 equal 10
                    // Answer 2 and 4 equal 10
                    // Answer 1 and 2 equal 0
                    // Answer 2 and 3 equal 0
                    // All others equal 5
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else if( ($ans_id == 13) && ($other_ans_id == 15) ) {
                        $scores +=10;
                    } else if( ($ans_id == 15) && ($other_ans_id == 13) ) {
                        $scores +=10;
                    } else if( ($ans_id == 15) && ($other_ans_id == 16) ) {
                        $scores +=10;
                    } else if( ($ans_id == 16) && ($other_ans_id == 15) ) {
                        $scores +=10;
                    } else if( ($ans_id == 13) && ($other_ans_id == 14) ) {
                        $scores +=0;
                    } else if( ($ans_id == 14) && ($other_ans_id == 13) ) {
                        $scores +=0;
                    } else if( ($ans_id == 14) && ($other_ans_id == 15) ) {
                        $scores +=0;
                    } else if( ($ans_id == 15) && ($other_ans_id == 14) ) {
                        $scores +=0;
                    } else {
                        $scores +=5;
                    }
                    $max_allowed_scores +=20;
                } else if($que_id == 5) {

                    // Answer 1 and 5 equal 10
                    // Answer 2 and 4 equal 10
                    // Answer 2 and 1,3,5 equal 0
                    // All others equal 5

                    if( ($ans_id == 17) && ($other_ans_id == 21) ) {
                        $scores +=10*2;
                    } else if( ($ans_id == 21) && ($other_ans_id == 17) ) {
                        $scores +=10*2;
                    } else if( ($ans_id == 18) && ($other_ans_id == 20) ) {    
                        $scores +=10*2;
                    } else if( ($ans_id == 20) && ($other_ans_id == 18) ) {
                        $scores +=10*2;
                    } else if( ($ans_id == 18) && ($other_ans_id == 17) ) {
                        $scores +=0;
                    } else if( ($ans_id == 17) && ($other_ans_id == 18) ) {
                        $scores +=0;
                    } else if( ($ans_id == 18) && ($other_ans_id == 19) ) {
                        $scores +=0;
                    } else if( ($ans_id == 19) && ($other_ans_id == 18) ) {
                        $scores +=0;
                    } else if( ($ans_id == 18) && ($other_ans_id == 21) ) {
                        $scores +=0;
                    } else if( ($ans_id == 21) && ($other_ans_id == 18) ) {
                        $scores +=0;
                    } else {
                        $scores +=0;
                    } 
                    $max_allowed_scores += 80;
                } else if($que_id == 6) {
                    // Answer 1 and 4 equal 10
                    // Answer 2 and 3 equal 10
                    // Answer 3 and 7 equal 5
                    // Answer 5 and 6 equal 10
                    // Answer 7 and 1,2,4,5,6 equal 0
                    // All others equal 5 P

                    if( ($ans_id == 22) && ($other_ans_id == 25) ) {
                        $scores +=10;
                    } else if( ($ans_id == 25) && ($other_ans_id == 22) ) {
                        $scores +=10;
                    } else if( ($ans_id == 23) && ($other_ans_id == 24) ) {
                        $scores +=10;
                    } else if( ($ans_id == 24) && ($other_ans_id == 23) ) {
                        $scores +=10;
                    } else if( ($ans_id == 24) && ($other_ans_id == 28) ) {
                        $scores +=5;
                    } else if( ($ans_id == 28) && ($other_ans_id == 24) ) {
                        $scores +=5;
                    } else if( ($ans_id == 26) && ($other_ans_id == 27) ) {
                        $scores +=10;
                    } else if( ($ans_id == 27) && ($other_ans_id == 26) ) {
                        $scores +=10;
                    } else if( ($ans_id == 28) && ($other_ans_id == 22) ) {
                        $scores +=0;
                    } else if( ($ans_id == 22) && ($other_ans_id == 28) ) {
                        $scores +=0;
                    } else if( ($ans_id == 28) && ($other_ans_id == 23) ) {
                        $scores +=0;
                    } else if( ($ans_id == 23) && ($other_ans_id == 28) ) {
                        $scores +=0;
                    } else if( ($ans_id == 28) && ($other_ans_id == 25) ) {
                        $scores +=0;
                    } else if( ($ans_id == 25) && ($other_ans_id == 28) ) {
                        $scores +=0;
                    } else if( ($ans_id == 28) && ($other_ans_id == 26) ) {
                        $scores +=0;
                    } else if( ($ans_id == 26) && ($other_ans_id == 28) ) {
                        $scores +=0;
                    } else if( ($ans_id == 28) && ($other_ans_id == 27) ) {
                        $scores +=0;
                    } else if( ($ans_id == 27) && ($other_ans_id == 28) ) {
                        $scores +=0;
                    } else {
                        $scores +=5;
                    }
                    $max_allowed_scores += 40;
                } else if($que_id == 7) {
                    // Answer 1 and 5 equal 10
                    // Answer 2 and 3 equal 10
                    // Answer 4 and 7 equal 10
                    // Answer 2 and 3 equal 10
                    // Answer 6 and 8 equal 10
                    // Answer 1 and 7 equal 0
                    // All others equal 5 Punkte
                    // if(in_array($ans_id, $other_anss)) {
                    //     $scores += 20;
                    //     unset($my_anss[$key]);
    
                    //     if (($indexSpam = array_search($my_ans, $other_anss)) !== false) {
                    //          unset($other_anss[$indexSpam]);
                    //     }
                    // } else {
                    //     // if()
                    //     $scores +=5;
                    // }

                    if( ($ans_id == 30) && ($other_ans_id == 34) ) {
                        $scores +=10;
                    } else if( ($ans_id == 34) && ($other_ans_id == 30) ) {
                        $scores +=10;
                    } else if( ($ans_id == 31) && ($other_ans_id == 32) ) {
                        $scores +=10;
                    } else if( ($ans_id == 32) && ($other_ans_id == 31) ) {
                        $scores +=10;
                    } else if( ($ans_id == 33) && ($other_ans_id == 36) ) {
                        $scores +=10;
                    } else if( ($ans_id == 36) && ($other_ans_id == 33) ) {
                        $scores +=10;
                    } else if( ($ans_id == 35) && ($other_ans_id == 37) ) {
                        $scores +=10;
                    } else if( ($ans_id == 37) && ($other_ans_id == 35) ) {
                        $scores +=10;
                    } else if( ($ans_id == 30) && ($other_ans_id == 36) ) {
                        $scores +=0;
                    } else if( ($ans_id == 36) && ($other_ans_id == 30) ) {
                        $scores +=0;
                    } else {
                        $scores +=5;
                    }

                    // if($ans_id == $other_ans_id) {
                    //     $scores +=20;
                    // } else {
                    //     $scores +=0;
                    // } 
                    $max_allowed_scores += 40;
                } else if($que_id == 8) {
                    
                    if( ($ans_id == 38) && ($other_ans_id == 39) ) {
                        $scores +=10;
                    } else if( ($ans_id == 39) && ($other_ans_id == 38) ) {
                        $scores +=10;
                    } else if( ($ans_id == 39) && ($other_ans_id == 41) ) {
                        $scores +=10;
                    } else if( ($ans_id == 41) && ($other_ans_id == 39) ) {
                        $scores +=10;
                    } else if( ($ans_id == 40) && ($other_ans_id == 41) ) {
                        $scores +=10;
                    } else if( ($ans_id == 41) && ($other_ans_id == 40) ) {
                        $scores +=10;
                    } else if( ($ans_id == 40) && ($other_ans_id == 42) ) {
                        $scores +=10;
                    } else if( ($ans_id == 42) && ($other_ans_id == 40) ) {
                        $scores +=10;
                    } else {
                        $scores +=5;
                    }
                    $max_allowed_scores += 30;
                } else if($que_id == 9) {
                    // Same answers 20
                    // all others equal 5 Punkte
                    if($ans_id == $other_ans_id) {
                        $scores +=20*.15;
                    } else {
                        // if()
                        $scores +=5*.15;
                    }
                    $max_allowed_scores += 9;
                } else if($que_id == 10) {
                    // Answer 2 and 3 equal 10
                    // All others equal 5 Punkte
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else if( ($ans_id == 53) && ($other_ans_id == 54) ) {
                        $scores +=10;
                    } else if( ($ans_id == 54) && ($other_ans_id == 53) ) {
                        $scores +=10;
                    } else {
                        $scores +=5;
                    }
                    $max_allowed_scores += 20;
                } else if($que_id == 11) {
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else if( ($ans_id == 55) && ($other_ans_id == 56) ) {
                        $scores +=5;
                    } else if( ($ans_id == 56) && ($other_ans_id == 55) ) {
                        $scores +=5;
                    }else if( ($ans_id == 57) && ($other_ans_id == 55) ) {
                        $scores +=0;
                    } else if( ($ans_id == 55) && ($other_ans_id == 57) ) {
                        $scores +=0;
                    }else if( ($ans_id == 57) && ($other_ans_id == 56) ) {
                        $scores +=0;
                    } else if( ($ans_id == 56) && ($other_ans_id == 57) ) {
                        $scores +=0;
                    } else {
                        $scores +=5;
                    }
                    $max_allowed_scores += 20;
                } else if($que_id == 12) {
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else if( ($ans_id == 58) && ($other_ans_id == 59) ) {
                        $scores +=10;
                    } else if( ($ans_id == 59) && ($other_ans_id == 58) ) {
                        $scores +=10;
                    }
                    //Query start Answer 1,2 and 6,7 equal 0  
                    else if( ($ans_id == 58) && ($other_ans_id == 63) ) {
                        $scores +=0;
                    } else if( ($ans_id == 63) && ($other_ans_id == 58) ) {
                        $scores +=0;
                    }else if( ($ans_id == 58) && ($other_ans_id == 64) ) {
                        $scores +=0;
                    } else if( ($ans_id == 64) && ($other_ans_id == 58) ) {
                        $scores +=0;
                    } else if( ($ans_id == 59) && ($other_ans_id == 63) ) {
                        $scores +=0;
                    } else if( ($ans_id == 63) && ($other_ans_id == 59) ) {
                        $scores +=0;
                    }else if( ($ans_id == 59) && ($other_ans_id == 64) ) {
                        $scores +=0;
                    } else if( ($ans_id == 64) && ($other_ans_id == 59) ) {
                        $scores +=0;
                    } 
                    //Query end Answer 1,2 and 6,7 equal 0  
                    else {
                        $scores +=5;
                    }
                    $max_allowed_scores += 20;
                } else if($que_id == 13) {
                    // Answer 1 and 2 equal 0
                    // // Answer 2 and 8 equal 10
                    // // Answer 5 and 6,7 equal 10
                    // // Answer 4 and 7 equal 0
                    // // All others equal 5

                    if( ($ans_id == 66) && ($other_ans_id == 65) ) {
                        $scores +=0;
                    }else if( ($ans_id == 66) && ($other_ans_id == 72) ) {
                        $scores +=10;
                    }else if( ($ans_id == 72) && ($other_ans_id == 66) ) {
                        $scores +=10;
                    }else if( ($ans_id == 69) && ($other_ans_id == 70) ) {
                        $scores +=10;
                    }else if( ($ans_id == 70) && ($other_ans_id == 69) ) {
                        $scores +=10;
                    }else if( ($ans_id == 69) && ($other_ans_id == 71) ) {
                        $scores +=10;
                    } else if( ($ans_id == 71) && ($other_ans_id == 69) ) {
                        $scores +=10;
                    } else if( ($ans_id == 68) && ($other_ans_id == 71) ) {
                        $scores +=0;
                    } else if( ($ans_id == 71) && ($other_ans_id == 68) ) {
                        $scores +=0;
                    } else {
                        $scores +=5;
                    }

                    // if($ans_id == $other_ans_id) {
                    //     $scores +=20;
                    // } else {
                    //     // if()
                    //     $scores +=5;
                    // }
                    $max_allowed_scores += 60;
                } else if($que_id == 14) {
                    if($ans_id == $other_anss) {
                        $scores +=20;
                    }
                    //Query start Answer 1  and 2,4 equal 5 
                                //Answer 1  and 2 equal 0 
                     else if( ($ans_id == 74) && ($other_ans_id == 75) ) {
                        $scores +=5;
                    } else if( ($ans_id == 75) && ($other_ans_id == 74) ) {
                        $scores +=5;
                    }
                    //Query end
                    else if( ($ans_id == 74) && ($other_ans_id == 77) ) {
                        $scores +=5;
                    }else if( ($ans_id == 77) && ($other_ans_id == 74) ) {
                        $scores +=5;
                    }else if( ($ans_id == 76) && ($other_ans_id == 77) ) {
                        $scores +=0;
                    }else if( ($ans_id == 77) && ($other_ans_id == 76) ) {
                        $scores +=0;
                    }else if( ($ans_id == 78) && ($other_ans_id == 74) ) {
                        $scores +=0;
                    } else if( ($ans_id == 74) && ($other_ans_id == 78) ) {
                        $scores +=0;
                    } else if( ($ans_id == 78) && ($other_ans_id == 75) ) {
                        $scores +=0;
                    } else if( ($ans_id == 75) && ($other_ans_id == 78) ) {
                        $scores +=0;
                    }else if( ($ans_id == 78) && ($other_ans_id == 76) ) {
                        $scores +=0;
                    } else if( ($ans_id == 76) && ($other_ans_id == 78) ) {
                        $scores +=0;
                    }else if( ($ans_id == 78) && ($other_ans_id == 77) ) {
                        $scores +=0;
                    } else if( ($ans_id == 77) && ($other_ans_id == 78) ) {
                        $scores +=0;
                    } else {
                        $scores +=5;
                    }
                    $max_allowed_scores += 20;
                } else if($que_id == 15) {
                    // Answer 1 and 4 equal 10
                    // Answer 2 and 5 equal 10
                    // Answer 6 and 7 equal 10
                    // All others equal 5
                    // if(in_array($ans_id, $other_anss)) {
                    //     $scores += 20;
                    //     unset($my_anss[$key]);
    
                    //     if (($indexSpam = array_search($my_ans, $other_anss)) !== false) {
                    //          unset($other_anss[$indexSpam]);
                    //     }
                    // } else {
                    //     // if()
                    //     $scores +=5;
                    // }

                    if( ($ans_id == 79) && ($other_ans_id == 82) ) {
                        $scores +=10;
                    } else if( ($ans_id == 82) && ($other_ans_id == 79) ) {
                        $scores +=10;
                    }else if( ($ans_id == 80) && ($other_ans_id == 83) ) {
                        $scores +=10;
                    }else if( ($ans_id == 83) && ($other_ans_id == 80) ) {
                        $scores +=10;
                    }else if( ($ans_id == 84) && ($other_ans_id == 85) ) {
                        $scores +=10;
                    }else if( ($ans_id == 85) && ($other_ans_id == 84) ) {
                        $scores +=10;
                    }else {
                        $scores +=5;
                    }

                    // if($ans_id == $other_ans_id) {
                    //     $scores +=20;
                    // } else {
                    //     // if()
                    //     $scores +=5;
                    // }
                    $max_allowed_scores += 60;

                } else if($que_id == 16) {
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else if( ($ans_id == 86) && ($other_ans_id == 89) ) {
                        $scores +=0;
                    } else if( ($ans_id == 89) && ($other_ans_id == 86) ) {
                        $scores +=0;
                    }else if( ($ans_id == 86) && ($other_ans_id == 87) ) {
                        $scores +=10;
                    }else if( ($ans_id == 87) && ($other_ans_id == 86) ) {
                        $scores +=10;
                    }else if( ($ans_id == 88) && ($other_ans_id == 89) ) {
                        $scores +=10;
                    }else if( ($ans_id == 89) && ($other_ans_id == 88) ) {
                        $scores +=10;
                    }
                    //Query start Answer 1  and 4 equal 0 
                            // Answer 1  and 2 equal 10 
                            // Answer 3  and 4 equal 10 
                            //no option for 5
                    else {
                        $scores +=0;
                    } 
                    //Query end

                    $max_allowed_scores += 20;
                } else if($que_id == 17) {
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else if( ($ans_id == 90) && ($other_ans_id == 92) ) {
                        $scores +=10;
                    } else if( ($ans_id == 92) && ($other_ans_id == 90) ) {
                        $scores +=10;
                    }else if( ($ans_id == 90) && ($other_ans_id == 91) ) {
                        $scores +=0;
                    }else if( ($ans_id == 91) && ($other_ans_id == 90) ) {
                        $scores +=0;
                    }else if( ($ans_id == 91) && ($other_ans_id == 92) ) {
                        $scores +=10;
                    }else if( ($ans_id == 92) && ($other_ans_id == 91) ) {
                        $scores +=10;
                    }
                    //Query start Answer 1  and 3 equal 10
                                 // Answer 1  and 2 equal 0 
                                 // Answer 2  and 3 equal 10   
                                //no option for defualt 5
                    else {
                        $scores +=0;
                    } 
                    //Query end
                    $max_allowed_scores += 20;
                } else if($que_id == 18) {
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else if( ($ans_id == 93) && ($other_ans_id == 95) ) {
                        $scores +=10;
                    } else if( ($ans_id == 95) && ($other_ans_id == 93) ) {
                        $scores +=10;
                    }else if( ($ans_id == 93) && ($other_ans_id == 94) ) {
                        $scores +=0;
                    }else if( ($ans_id == 94) && ($other_ans_id == 93) ) {
                        $scores +=0;
                    }else if( ($ans_id == 94) && ($other_ans_id == 95) ) {
                        $scores +=10;
                    }else if( ($ans_id == 95) && ($other_ans_id == 94) ) {
                        $scores +=10;
                    }
                    //Query start Answer 1  and 3 equal 10
                                 // Answer 1  and 2 equal 0 
                                 // Answer 2  and 3 equal 10   
                    else {
                        $scores +=0;
                    } 
                    $max_allowed_scores += 20;
                    //Query end
                } else {
                    $scores += 0;
                    $max_allowed_scores += 00;
                }

                // echo "<pre>"; print_r($res); die;
        
                $res[$ky]['test_id_1'] = $test_id_2;
                $res[$ky]['test_id_2'] = $test_id_1;
                $res[$ky]['que_id'] = $que_id;
                $res[$ky]['my_ans']  = $ans_id;
                $res[$ky]['other_ans_id']  = $other_ans_id;
                $res[$ky]['score']  = $scores;
                $res[$ky]['max_allowed_scores']  = $max_allowed_scores;
                $res[$ky]['test_que_1']  = $other_ans['test_que_id'];
                $res[$ky]['test_que_2']  = $test_que_id;
                $ky++;

                // if(in_array($que_id,[5])){ //if que is of multiple ans type
                //     echo '<pre>after1111'; print_r($my_anss);
                //     echo '<pre>'; print_r($other_anss);
                //     echo "<pre>res"; print_r($res); die;
                // }
            }
        }
        // echo "<pre>"; print_r($res); die;
        return $res;
    }

    function searchForId($id, $array) {
        // echo $id."<br>";
        // echo "<pre>arr"; print_r($array);
        try{
            
            foreach ($array as $key => $val) {
                if ($val['ans_id'] == $id) {
                   return $key;
                }
            }
           return null;

        } catch(Exception $e){
           return null;
            // echo '<pre>'; print_r($array);
            // echo $id;
            // die;
        }
    }

    function unset_n_reset(&$arr, $key){
      unset($arr[$key]);
      // $arr = array_merge($arr);
      return (count($arr) > 0) ? array_values($arr) : [];
    }


    public function getRecommededProfile(Request $request) {

        $validator = Validator::make($request->all(), [
                'user_id' => 'required',
                // 'user_id' => 'required|exists:users,id',
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $user_id = $request->user_id;   

        // $test_id = UserTest::where('user_id', $user_id)->value('id');
        // echo $sum; die;

        // $tests  =   TestQuesComparison::where('test_id_1','!=', $test_id)
        //                             ->select('test_id_1','test_id_2',DB::raw('SUM(final_scores) AS scores'))
        //                             ->with('userInfo')
        //                             ->orderBy('scores', 'desc')
        //                             ->get()
        //                             // ->toArray()
        //                             ->map(function($rec){
        //                                 $per = $rec->scores/499;
        //                                 $rec->percentage = $per*100;
        //                                 return $rec;
        //                             });

        $users = User::where('id', '!=', $request->user_id)
                    ->select('id','name','username','email','profile_image')
                    ->where('email_verified_at', '!=', null)
                    ->inRandomOrder()
                    ->limit(10)
                    ->get();
                    
                    


        return response()->json([
            'status' => 200,
            'data'   => $users,
            'message'=> 'Profiles', 
        ]);                                    
    }

    //-----
    public function _filterResult($res) {

        set_time_limit(0);

        $new_res = [];
        foreach ($res as $que_id => $anss) {        
            if($que_id == 5){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 3){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                $new_res[] = $new_arr;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 7) {
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }


                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        // echo $rule_exixts; die;
                        if($rule_exixts == true){
                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                $new_res[] = $new_arr;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 4){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 6){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 8){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 9){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 10){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 11){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 12){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 13){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 14){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 15){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 16){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 17){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            } else if($que_id == 18){
                // echo "<pre>"; print_r($anss); die;
                $new_arr = [];
                $ignore_keys = [];
                $ignore_ans_ids = [];
                $m = 0; //for test
                
                //get common
                foreach($anss as $key => $ans){
                    if($ans['my_ans'] == $ans['other_ans_id']){
                        $new_arr[] = $ans; //perfect match save in new variable
                        unset($anss[$key]);
                    }
                }

                //get those whose match values available 
                foreach($anss as $key  => $ans){
                    if(!in_array($key, $ignore_keys)) {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;

                        $rule_exixts = $this->_checkRuleExists($ans['my_ans'], $ans['other_ans_id'], $ans['que_id']);
                        if($rule_exixts == true){

                            $new_arr[] = $ans; //rule array save in new variable
                            unset($anss[$key]);
                           
                            $rem_arr = $this->_removeGivenEntries($ans['my_ans'], $ans['other_ans_id'], $anss);
                            // $new_arr = array_merge($new_arr,$rem_arr['data']);
                            $ignore_keys = array_merge($ignore_keys,$rem_arr['ignore_keys']);

                            $ignore_ans_ids[] = $ans['my_ans'];
                            $ignore_ans_ids[] = $ans['other_ans_id'];

                            // echo "<pre>ignore_keys = "; print_r($ignore_keys); //die;
                            // echo "<pre>new arr = "; print_r($new_arr); //die;
                        }
                    }
                }
                // echo "<pre>"; print_r($new_arr); die;

                //get those whose match values not given
                foreach($anss as $key  => $ans){
                    if( (!in_array($ans['my_ans'], $ignore_ans_ids)) && (!in_array($ans['other_ans_id'], $ignore_ans_ids)) )  {

                        // echo "<pre>ans "; print_r($ans); 
                        // echo ++$m;
                        $new_arr[] = $ans; //rule array save in diff variable
                    }
                }
                $new_res[] = $new_arr;
                // die;
                // echo "<pre>"; print_r($new_arr); die;
                // echo "<pre>ignore_keys = "; print_r($ignore_ans_ids); die;
            }
        }
        // echo "<pre>"; print_r($new_res); die;
        return $new_res; 
    }

    function _checkRuleExists($ans_id,$other_ans_id, $que_id){
        
        set_time_limit(0);

        if($que_id == 5) {
            if( ($ans_id == 17) && ($other_ans_id == 21) ) {
                return true;
            } else if( ($ans_id == 21) && ($other_ans_id == 17) ) {
                return true;
            } else if( ($ans_id == 18) && ($other_ans_id == 20) ) {    
                return true;
            } else if( ($ans_id == 20) && ($other_ans_id == 18) ) {
                // return true;
                return true;
            } else if( ($ans_id == 18) && ($other_ans_id == 17) ) {
                return true;
            } else if( ($ans_id == 17) && ($other_ans_id == 18) ) {
                return true;
            } else if( ($ans_id == 18) && ($other_ans_id == 19) ) {
                return true;
            } else if( ($ans_id == 19) && ($other_ans_id == 18) ) {
                return true;
            } else if( ($ans_id == 18) && ($other_ans_id == 21) ) {
                return true;
            } else if( ($ans_id == 21) && ($other_ans_id == 18) ) {
                return true;
            } else{
                return false;
            }
        } else if($que_id == 3) {
            if($ans_id == $other_ans_id) {
                return true;
            } else if( ($ans_id == 9) && ($other_ans_id == 11) ) {
                return true;
            } else if( ($ans_id == 11) && ($other_ans_id == 9) ) {
                return true;
            } else if( ($ans_id == 10) && ($other_ans_id == 12) ) {
                return true;
            } else if( ($ans_id == 12) && ($other_ans_id == 10) ) {
                return true;
            } else {
                return false;
            }
        } else if ($que_id == 7) {
            if( ($ans_id == 30) && ($other_ans_id == 34) ) {
                return true;
            } else if( ($ans_id == 34) && ($other_ans_id == 30) ) {
                return true;
            } else if( ($ans_id == 31) && ($other_ans_id == 32) ) {
                return true;
            } else if( ($ans_id == 32) && ($other_ans_id == 31) ) {
                return true;
            } else if( ($ans_id == 33) && ($other_ans_id == 36) ) {
                return true;
            } else if( ($ans_id == 36) && ($other_ans_id == 33) ) {
                return true;
            } else if( ($ans_id == 35) && ($other_ans_id == 37) ) {
                return true;
            } else if( ($ans_id == 37) && ($other_ans_id == 35) ) {
                return true;
            } else if( ($ans_id == 30) && ($other_ans_id == 36) ) {
                return true;
            } else if( ($ans_id == 36) && ($other_ans_id == 30) ) {
                return true;
            } else {
                return true;
            }
        } else if ($que_id == 4) {
            if( ($ans_id == 13) && ($other_ans_id == 15) ) {
                return true;
            } else if( ($ans_id == 15) && ($other_ans_id == 13) ) {
                return true;
            } else if( ($ans_id == 15) && ($other_ans_id == 16) ) {
                return true;
            } else if( ($ans_id == 16) && ($other_ans_id == 15) ) {
                return true;
            } else if( ($ans_id == 13) && ($other_ans_id == 14) ) {
                return true;
            } else if( ($ans_id == 14) && ($other_ans_id == 13) ) {
                return true;
            } else if( ($ans_id == 14) && ($other_ans_id == 15) ) {
                return true;
            } else if( ($ans_id == 15) && ($other_ans_id == 14) ) {
                return true;
            } else {
                return true;
            }
        } else if ($que_id == 6) {
            if( ($ans_id == 22) && ($other_ans_id == 25) ) {
                 return true;
            } else if( ($ans_id == 25) && ($other_ans_id == 22) ) {
                 return true;
            } else if( ($ans_id == 23) && ($other_ans_id == 24) ) {
                 return true;
            } else if( ($ans_id == 24) && ($other_ans_id == 23) ) {
                 return true;
            } else if( ($ans_id == 24) && ($other_ans_id == 28) ) {
                 return true;
            } else if( ($ans_id == 28) && ($other_ans_id == 24) ) {
                 return true;
            } else if( ($ans_id == 26) && ($other_ans_id == 27) ) {
                 return true;
            } else if( ($ans_id == 27) && ($other_ans_id == 26) ) {
                 return true;
            } else if( ($ans_id == 28) && ($other_ans_id == 22) ) {
                 return true;
            } else if( ($ans_id == 22) && ($other_ans_id == 28) ) {
                 return true;
            } else if( ($ans_id == 28) && ($other_ans_id == 23) ) {
                 return true;
            } else if( ($ans_id == 23) && ($other_ans_id == 28) ) {
                 return true;
            } else if( ($ans_id == 28) && ($other_ans_id == 25) ) {
                 return true;
            } else if( ($ans_id == 25) && ($other_ans_id == 28) ) {
                 return true;
            } else if( ($ans_id == 28) && ($other_ans_id == 26) ) {
                 return true;
            } else if( ($ans_id == 26) && ($other_ans_id == 28) ) {
                 return true;
            } else if( ($ans_id == 28) && ($other_ans_id == 27) ) {
                 return true;
            } else if( ($ans_id == 27) && ($other_ans_id == 28) ) {
                 return true;
            } else {
                 return true;
            }
        } else if ($que_id == 8) {
            if( ($ans_id == 38) && ($other_ans_id == 39) ) {
                    return true;
            } else if( ($ans_id == 39) && ($other_ans_id == 38) ) {
                return true;
            } else if( ($ans_id == 39) && ($other_ans_id == 41) ) {
                return true;
            } else if( ($ans_id == 41) && ($other_ans_id == 39) ) {
                return true;
            } else if( ($ans_id == 40) && ($other_ans_id == 41) ) {
                return true;
            } else if( ($ans_id == 41) && ($other_ans_id == 40) ) {
                return true;
            } else if( ($ans_id == 40) && ($other_ans_id == 42) ) {
                return true;
            } else if( ($ans_id == 42) && ($other_ans_id == 40) ) {
                return true;
            } else {
                return true;
            }
        } else if ($que_id == 9) {          
            return true;
        } else if ($que_id == 10) {
            if( ($ans_id == 53) && ($other_ans_id == 54) ) {
                return true;
            } else if( ($ans_id == 54) && ($other_ans_id == 53) ) {
                return true;
            } else {
                return true;
            }
        } else if ($que_id == 11) {
            if( ($ans_id == 55) && ($other_ans_id == 56) ) {
                return true;
            } else if( ($ans_id == 56) && ($other_ans_id == 55) ) {
                return true;
            }else if( ($ans_id == 57) && ($other_ans_id == 55) ) {
                return true;
            } else if( ($ans_id == 55) && ($other_ans_id == 57) ) {
                return true;
            }else if( ($ans_id == 57) && ($other_ans_id == 56) ) {
                return true;
            } else if( ($ans_id == 56) && ($other_ans_id == 57) ) {
                return true;
            } else {
                return true;
            }
        } else if ($que_id == 12) {
            if( ($ans_id == 58) && ($other_ans_id == 59) ) {
                return true;
            } else if( ($ans_id == 59) && ($other_ans_id == 58) ) {
                return true;
            }
            //Query start Answer 1,2 and 6,7 equal 0  
            else if( ($ans_id == 58) && ($other_ans_id == 63) ) {
               return true;
            } else if( ($ans_id == 63) && ($other_ans_id == 58) ) {
               return true;
            }else if( ($ans_id == 58) && ($other_ans_id == 64) ) {
               return true;
            } else if( ($ans_id == 64) && ($other_ans_id == 58) ) {
               return true;
            } else if( ($ans_id == 59) && ($other_ans_id == 63) ) {
               return true;
            } else if( ($ans_id == 63) && ($other_ans_id == 59) ) {
               return true;
            }else if( ($ans_id == 59) && ($other_ans_id == 64) ) {
               return true;
            } else if( ($ans_id == 64) && ($other_ans_id == 59) ) {
               return true;
            } else {
                return true;
            }
        } else if ($que_id == 13) {
            if( ($ans_id == 66) && ($other_ans_id == 65) ) {
                return true;
            }else if( ($ans_id == 66) && ($other_ans_id == 72) ) {
                return true;
            }else if( ($ans_id == 72) && ($other_ans_id == 66) ) {
                return true;
            }else if( ($ans_id == 69) && ($other_ans_id == 70) ) {
                return true;
            }else if( ($ans_id == 70) && ($other_ans_id == 69) ) {
                return true;
            }else if( ($ans_id == 69) && ($other_ans_id == 71) ) {
                return true;
            } else if( ($ans_id == 71) && ($other_ans_id == 69) ) {
                return true;
            } else if( ($ans_id == 68) && ($other_ans_id == 71) ) {
                return true;
            } else if( ($ans_id == 71) && ($other_ans_id == 68) ) {
                return true;
            } else {
                return true;
            }
        } else if ($que_id == 14) {
            if( ($ans_id == 74) && ($other_ans_id == 77) ) {
                return true;
            }else if( ($ans_id == 77) && ($other_ans_id == 74) ) {
                return true;
            }else if( ($ans_id == 76) && ($other_ans_id == 77) ) {
                return true;
            }else if( ($ans_id == 77) && ($other_ans_id == 76) ) {
                return true;
            }else if( ($ans_id == 78) && ($other_ans_id == 74) ) {
                return true;
            } else if( ($ans_id == 74) && ($other_ans_id == 78) ) {
                return true;
            } else if( ($ans_id == 78) && ($other_ans_id == 75) ) {
                return true;
            } else if( ($ans_id == 75) && ($other_ans_id == 78) ) {
                return true;
            }else if( ($ans_id == 78) && ($other_ans_id == 76) ) {
                return true;
            } else if( ($ans_id == 76) && ($other_ans_id == 78) ) {
                return true;
            }else if( ($ans_id == 78) && ($other_ans_id == 77) ) {
                return true;
            } else if( ($ans_id == 77) && ($other_ans_id == 78) ) {
                return true;
            } else {
                return true;
            }
        } else if ($que_id == 15) {
            if(($ans_id == 79) && ($ans_id == 82) ) {
                return true;;
            } else if( ($ans_id == 82) && ($ans_id == 79) ) {
                return true;
            }else if( ($ans_id == 80) && ($ans_id == 83) ) {
                return true;
            }else if( ($ans_id == 83) && ($ans_id == 80) ) {
                return true;
            }else if( ($ans_id == 84) && ($ans_id == 85) ) {
                return true;
            }else if( ($ans_id == 85) && ($ans_id == 84) ) {
                return true;
            } else {
                return true;
            }
        } else if ($que_id == 16) {
            if( ($ans_id == 86) && ($ans_id == 89) ) {
                return true;
            } else if( ($ans_id == 89) && ($ans_id == 86) ) {
                return true;
            }else if( ($ans_id == 86) && ($ans_id == 87) ) {
                return true;
            }else if( ($ans_id == 87) && ($ans_id == 86) ) {
                return true;
            }else if( ($ans_id == 88) && ($ans_id == 89) ) {
                return true;
            }else if( ($ans_id == 89) && ($ans_id == 88) ) {
                return true;
            } else {
                return true;
            }
        } else if ($que_id == 17) {
            if( ($ans_id == 90) && ($ans_id == 92) ) {
                return true;
            } else if( ($ans_id == 92) && ($ans_id == 90) ) {
                return true;
            }else if( ($ans_id == 90) && ($ans_id == 91) ) {
                return true;
            }else if( ($ans_id == 91) && ($ans_id == 90) ) {
                return true;
            }else if( ($ans_id == 91) && ($ans_id == 92) ) {
                return true;
            }else if( ($ans_id == 92) && ($ans_id == 91) ) {
                return true;
            }else {
                return true;
            } 
        } else if ($que_id == 18) {
            if( ($ans_id == 93) && ($ans_id == 95) ) {
                return true;
            } else if( ($ans_id == 95) && ($ans_id == 93) ) {
                return true;
            }else if( ($ans_id == 93) && ($ans_id == 94) ) {
                return true;
            }else if( ($ans_id == 94) && ($ans_id == 93) ) {
                return true;
            }else if( ($ans_id == 94) && ($ans_id == 95) ) {
                return true;
            }else if( ($ans_id == 95) && ($ans_id == 94) ) {
                return true;
            } else {
                return true;
            } 
        } else {
            return true;
        }
    }

    function _removeGivenEntries($ans_id,$other_ans_id, $data){
        $ignore_keys = [];
        foreach($data as $key => $value){
            if( ($value['my_ans'] == $ans_id) ||
                ($value['other_ans_id'] == $ans_id) ||
                ($value['my_ans'] == $other_ans_id) ||
                ($value['other_ans_id'] == $other_ans_id) ) {
                    $ignore_keys[] = $key;
                    unset($data[$key]);
            }
        }
        return array(
            'data' => $data,
            'ignore_keys' => $ignore_keys
        );
        // return $data;
    }

}
