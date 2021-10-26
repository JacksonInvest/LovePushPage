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
use App\UserTest;
use App\TestQues;
use App\TestQuesAns;
use App\TestQuesComparison;
use App\TestScore;
use Exception;
use Illuminate\Validation\Rule;

class PersonalityTestController extends Controller
{   

    public function questioons(Request $request) {

        $language_id = $this->getLanguageId();
        // echo $language_id; die;

        $questions = Question::getAllActiveQuestion($language_id);

        $user_id = Auth::user()->id;
        $test_id = UserTest::where('user_id', $user_id)->value('id');

        return response()->json([
            'status' => 200,
            'data'   => $questions,
            'test_id' => $test_id,
            'message'=> 'Personality test questions', 
        ]);
    }

    //User answer for a single question
    public function userAnswerSave(Request $request) {


        $validator = Validator::make($request->all(), [
                'user_id'     => 'required|exists:users,id',
                'question_id' => 'required|exists:questions,id',
                'option_ids'  => 'required',
        ]);
        
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

        //save user's test question and answers
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
        $test_id = $test->id;

        /*----- Notes ------
            If user take 1 OR 5 option from question no.2 can attempt only 1-14 question
            If user take 2 OR 3 OR 5 option from question no.2 can attempt only 1-18 question
        */
        
        /*-- if user given ans of last que, start calculations --- Test score logic start  --*/
        if($request->question_id == 16 || $request->question_id == 13) {

            set_time_limit(0);

            $tests = UserTest::getUserTests();          //get All tests
            $o_tests = $this->_getOtherTests($tests,$test_id);         //get All tests
            $c_test = UserTest::with('ques.answers')->where(['id'=>$test_id])->first();
            // echo "<pre>"; print_r($tests); die;
            $overall_resp = []; //testing purpose only
            $res = [];
            foreach ($c_test['ques'] as $key => $c_que) {
                foreach ($o_tests as $key => $o_test) {
                    foreach ($o_test['ques'] as $key => $o_que) {
                        // if($c_que_id == $o_que['id'] ){     ////now two ques matched
                        if($c_que['ques_id'] == $o_que['ques_id'] ){     ////now two ques matched

                            $que_id = $c_que['ques_id']; //both que id same, so we can take anyofit

                            //now compare answers
                            $scores = $this->_getScores($que_id, $c_que['answers']->toArray(), $o_que['answers'], $test['id'], $o_test['id']);

                            // $o_test_anss = $o_que['answers'];
                            // $test_id_1 = $test['id'];
                            // $test_id_2 = $o_test['id'];

                            // echo 'comp = '.$test_id_1.' - ' .$test_id_2.'<br>';

                            // echo "<pre>"; print_r($scores); //die; // die; //for one user
                            $res['scores'][] = $scores;

                            // echo "<pre>"; print_r($res); 
                        } 
                    }
                }
            }

            if(!empty($res)) {
                    
                //reforming $res (remomved first incremented key due)
                $res['scores'] = $this->reformingScoreResponse($res);

                // echo "<pre>user res = "; print_r($res); die; // die; //for one user
                
                if(!empty($res['scores'])) {

                    foreach($res['scores'] as $test1_id => $test2_ids){
                        foreach($test2_ids as $test2_id => $que_ids){
                            

                            $total_scores = [];
                            foreach($que_ids as $que_id => $comparisons){    
                                
                                $que_id_int = (int) filter_var($que_id, FILTER_SANITIZE_NUMBER_INT); //for testing only
                                $comparisons = $this->_filterResult($que_id_int,$comparisons);
                                    
                                $test1_id_int = (int) filter_var($test1_id, FILTER_SANITIZE_NUMBER_INT); //for testing only
                                $test2_id_int = (int) filter_var($test2_id, FILTER_SANITIZE_NUMBER_INT); //for testing only
                                
                                //calculating scores got
                                $scores_total = array_sum(array_column($comparisons,'score'));
                                $scores_max = (int)@$comparisons[0]['max_scores'];
                                $scores_got = ($scores_total > $scores_max ) ? $scores_max : $scores_total; 

                                //suitable for testing of pne user only, after then it displays error
                                // $comparisons['scores_total'] = $scores_total;
                                // $comparisons['scores_got'] = $scores_got;
                                $res['scores'][$test1_id][$test2_id][$que_id] = $comparisons; //for testing //append filter results with resp arr

                                //saving results in db - start
                                $test_que_1 = $comparisons[0]['test_que_1'];
                                $test_que_2 = $comparisons[0]['test_que_2'];


                                $comp_res = TestQuesComparison::where('test_id_1', $test1_id_int)
                                                                ->where('test_id_2', $test2_id_int)
                                                                ->where('test_que_1', $test_que_1)
                                                                ->where('test_que_2', $test_que_2)
                                                                ->first();
                                if(empty($comp_res)) {
                                    $comp_res = new TestQuesComparison;
                                    $comp_res->test_id_1          = $test1_id_int;
                                    $comp_res->test_id_2          = $test2_id_int;
                                    $comp_res->obtained_scores    = $scores_total;
                                    $comp_res->max_allowed_scores = $scores_max;
                                    $comp_res->test_que_1         = $test_que_1;
                                    $comp_res->test_que_2         = $test_que_2;
                                    $comp_res->final_scores       = $scores_got;
                                    $comp_res->save();
                                }
                                //save scores end here

                                $total_scores[] = $comp_res->final_scores;
                            }

                            $exist = TestScore::where('test_id_1', $test1_id)
                                                ->where('test_id_2', $test2_id)
                                                ->first();
                            if(empty($exist)) {
                                //Test according total score save  
                                $score = new TestScore;
                                $score->test_id_1 = $test1_id;
                                $score->test_id_2 = $test2_id;
                                $score->scores    = array_sum($total_scores);
                                $score->save();
                            }
                            else{
                                TestScore::where('test_id_1',$test1_id)->where('test_id_2',$test2_id)->update(['scores'=>array_sum($total_scores)]);
                            }

                        }
                    }
                    // echo "<pre>saved res = "; print_r($res); die; // die; //for one user
                } 
                $overall_resp[] = $res;
            }
            // echo "<pre>"; print_r($overall_resp); die;
        }

        return response()->json([
            'status' => 200,
            // 'data'   => $overall_resp,
            'data'   => '',
            'message'=> trans('api.user.answer_saved'),
        ]);
    }

    public function _getOtherTests($tests,$ignore_test_id){

        set_time_limit(0);
        return Collect($tests)->reject(function($test) use ($ignore_test_id){
            return $test['id'] === $ignore_test_id;
        })->toArray();
    }

    public function _getScores($que_id, $c_anss, $o_anss, $test1_id,$test2_id) {
        // echo 'comp in = '.$test1_id.' - ' .$test2_id.'<br>';

        set_time_limit(0);
        $res    = [];
        $i      = 0; //key of res array, 

        if(in_array($que_id,[5,6,7,13,15])){ //if que is of multiple ans type
            // echo 'ok1 <br>'; 
            // if(in_array($que_id,[6])){ //if que is of multiple ans type
            //     echo '<pre>before'; print_r($c_anss);
            //     echo '<pre>'; print_r($o_anss);
            //     echo '<pre>res'; print_r($res);// die;
            // }

            //step 1: check for perfect answer match 
            foreach ($c_anss as $key => $c_ans) {
                // echo 'comp in2 = '.$test1_id.' - ' .$test2_id.'<br>';

                $scores  = 0;
                $max_scores = 0;        //max allowe scores
                $ans_id = $c_ans['ans_id'];

                foreach ($o_anss as $key1 => $o_ans) {
            
                    $keys = $this->searchForId($ans_id, $o_anss);
                    if($keys !== null){
                        if($que_id == 5) {
                            $scores += 20*2;
                            $max_scores += 80;
                        } else if($que_id == 13) {
                            $scores += 20;
                            $max_scores += 60;
                        } else if($que_id == 15) {
                            $scores += 20;
                            $max_scores += 60;
                        } else {
                            $scores += 20;
                            $max_scores += 40;
                        }

                        //remove perfect match entries from original table
                        $c_anss = $this->unset_n_reset($c_anss, $key);
                        $o_anss = $this->unset_n_reset($o_anss, $keys);

                        $res[$test1_id][$test2_id][$que_id][$i]['c_ans_id'] = $ans_id;
                        $res[$test1_id][$test2_id][$que_id][$i]['o_ans_id'] = $ans_id;
                        $res[$test1_id][$test2_id][$que_id][$i]['score']    = $scores;
                        $res[$test1_id][$test2_id][$que_id][$i]['max_scores'] = $max_scores;

                        //for db save only
                        $res[$test1_id][$test2_id][$que_id][$i]['test_que_1'] = $c_ans['test_que_id']; 
                        $res[$test1_id][$test2_id][$que_id][$i]['test_que_2'] = $o_ans['test_que_id'];
                        $i++;
                    }
                }
                // echo '<pre>res'; print_r($res); die;
            }
        }
        
        foreach ($c_anss as $key => $c_ans) {
            // echo 'ok2 <br>'; 

            $ans_id = $c_ans['ans_id'];
            $test_que_id = $c_ans['test_que_id'];

            foreach ($o_anss as $key1 => $other_ans) {
                $scores = 0;
                $max_allowed_scores = 0;
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
                    // if(in_array($ans_id, $o_anss)) {
                    //     $scores += 20;
                    //     unset($c_anss[$key]);
    
                    //     if (($indexSpam = array_search($c_ans, $o_anss)) !== false) {
                    //          unset($o_anss[$indexSpam]);
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
                } /*else if($que_id == 8) {
                    
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
                }*/ /*else if($que_id == 9) {
                    // Same answers 20
                    // all others equal 5 Punkte
                    // if($ans_id == $other_ans_id) {
                    //     $scores +=20*.15;
                    // } else {
                    //     // if()
                        $scores +=5*.15;
                    // }
                    $max_allowed_scores += 9;
                }*/ /*else if($que_id == 10) {
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
                }*/ /*else if($que_id == 11) {
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
                }*/ /*else if($que_id == 12) {
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
                }*/ else if($que_id == 13) {
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
                } /*else if($que_id == 14) {
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else if( ($ans_id == 74) && ($other_ans_id == 75) ) {
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
                }*/ else if($que_id == 15) {
                    // Answer 1 and 4 equal 10
                    // Answer 2 and 5 equal 10
                    // Answer 6 and 7 equal 10
                    // All others equal 5
                    // if(in_array($ans_id, $o_anss)) {
                    //     $scores += 20;
                    //     unset($c_anss[$key]);
    
                    //     if (($indexSpam = array_search($c_ans, $o_anss)) !== false) {
                    //          unset($o_anss[$indexSpam]);
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
                } /*else if($que_id == 17) {
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
                }*/ /*else if($que_id == 18) {
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
                }*/ else {
                    $scores += 0;
                    $max_allowed_scores += 00;
                }

                // echo "<pre>"; print_r($res); die;
        
                $res[$test1_id][$test2_id][$que_id][$i]['c_ans_id'] = $ans_id;
                $res[$test1_id][$test2_id][$que_id][$i]['o_ans_id'] = $other_ans_id;
                $res[$test1_id][$test2_id][$que_id][$i]['score']    = $scores;
                $res[$test1_id][$test2_id][$que_id][$i]['max_scores'] = $max_allowed_scores;

                //for db save only
                $res[$test1_id][$test2_id][$que_id][$i]['test_que_1'] = $c_ans['test_que_id']; 
                $res[$test1_id][$test2_id][$que_id][$i]['test_que_2'] = $other_ans['test_que_id'];
                $i++;

                // if(in_array($que_id,[5])){ //if que is of multiple ans type
                //     echo '<pre>after1111'; print_r($c_anss);
                //     echo '<pre>'; print_r($o_anss);
                //     echo "<pre>res"; print_r($res); die;
                // }
                // echo "<pre>Res2 "; print_r($res); //die;

            }
        }
        // echo "<pre>ScoreRes "; print_r($res); //die;
        return $res;
    }

    public function reformingScoreResponse($res){

        set_time_limit(0);
        $new_res = [];
        foreach($res['scores'] as $test1_ids){
            foreach($test1_ids as $test1_id => $test2_ids){
                foreach($test2_ids as $test2_id => $que_ids){
                    foreach($que_ids as $que_id => $comparisons){
                        foreach($comparisons as $k => $value){
                            // $new_res['test1_id '.$test1_id]['test2_id '.$test2_id]['que_id '.$que_id][] = $value; //for testing only
                            $new_res[$test1_id][$test2_id][$que_id][] = $value;
                        }
                    }
                }
            }
        }
        return $new_res;
    }

    function unset_n_reset(&$arr, $key){
      unset($arr[$key]);
      return (count($arr) > 0) ? array_values($arr) : [];
    }

    //-----
    public function _filterResult($que_id,$anss) {

        set_time_limit(0);

        $new_arr = [];
        $ignore_keys = [];
        $ignore_ans_ids = [];
        
        //filter1: get perfect match in new arr
        foreach($anss as $key => $ans){
            if($ans['c_ans_id'] == $ans['o_ans_id']){
                $new_arr[] = $ans; //perfect match save in new variable
                unset($anss[$key]);
            }
        }

        //filter2: get those whose match values available in new arr 
        foreach($anss as $key  => $ans){
            if(!in_array($key, $ignore_keys)) {

                $rule_exixts = $this->_checkRuleExists($ans['c_ans_id'], $ans['o_ans_id'], $que_id);
                if($rule_exixts == true){

                    $new_arr[] = $ans; //rule array save in new variable
                    unset($anss[$key]);
                   
                    $rel_ignore_keys = $this->_removeRelatedEntries($ans['c_ans_id'], $ans['o_ans_id'], $anss); //get related comb. keys
                    $ignore_keys = array_merge($ignore_keys,$rel_ignore_keys);

                    $ignore_ans_ids[] = $ans['c_ans_id'];
                    $ignore_ans_ids[] = $ans['o_ans_id'];
                }
            }
        }

        //filter3:get those whose match values not given
        foreach($anss as $key  => $ans){
            if( (!in_array($ans['c_ans_id'], $ignore_ans_ids)) && (!in_array($ans['o_ans_id'], $ignore_ans_ids)) )  {
                $new_arr[] = $ans; //rule array save in diff variable
            }
        }

        return $new_arr; 
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
        } /*else if ($que_id == 8) {
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
        }*/ /*else if ($que_id == 9) {          
            return true;
        }*/ /*else if ($que_id == 10) {
            if( ($ans_id == 53) && ($other_ans_id == 54) ) {
                return true;
            } else if( ($ans_id == 54) && ($other_ans_id == 53) ) {
                return true;
            } else {
                return true;
            }
        }*/ /*else if ($que_id == 11) {
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
        }*/ /*else if ($que_id == 12) {
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
        }*/ else if ($que_id == 13) {
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
        } /*else if ($que_id == 14) {
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
        }*/ else if ($que_id == 15) {
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
        } /*else if ($que_id == 17) {
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
        }*/ /*else if ($que_id == 18) {
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
        }*/ else {
            return true;
        }
    }

    function _removeRelatedEntries($ans_id,$o_ans_id, $data){
        $ignore_keys = [];
        foreach($data as $key => $value){
            if( ($value['c_ans_id'] == $ans_id) ||
                ($value['o_ans_id'] == $ans_id) ||
                ($value['c_ans_id'] == $o_ans_id) ||
                ($value['o_ans_id'] == $o_ans_id) ) {
                    $ignore_keys[] = $key;
            }
        }
        return $ignore_keys;
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
    

    public function getRecommededProfile(Request $request) {
        print_r("Hello");die;
        $validator = Validator::make($request->all(), [
                'user_id' => 'required',
                // 'user_id' => 'required|exists:users,id',
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }
        
        $user_id = $request->user_id;   
        $user_info = User::where('id', $user_id)->first();

        $test_id = UserTest::where('user_id', $user_id)->value('id');
        print_r($test_id);die;
        // echo $test_id; die;

        if(empty($test_id)) {
            return response()->json([
                'status' => 400,
                'message'=> 'No user found', 
            ]);    
        }
 
        $queInfo = TestQues::QueAnsInfo ($test_id, 1);
        // echo "<pre>"; print_r($queInfo['ansInfo']);// die;
        $result = array_column($queInfo['ansInfo']->toArray(), 'ans_id');
        // echo "<pre>"; print_r($result); die;
        $gender_array  = $result;

                                                                                                
        $like_array    = explode(',', $user_info->like_user_ids); //like and dislike user_ids
        $connect_array = explode(',', $user_info->connect_user_ids); //connect request user_ids if accepted
        $chat_array    = explode(',', $user_info->chat_user_ids); //chat request user_ids if accepted

        $like_request_array    = explode(',', $user_info->like_request_ids); //like and dislike user_ids
        $connect_request_array = explode(',', $user_info->connect_request_ids); //connect request user_ids if accepted
        $chat_request_array    = explode(',', $user_info->chat_request_ids); //chat request user_ids if accepted

        $users = User::select('id','name','username','email','profile_image','gender','quickblox_id')
                        // ->with('userTest.testScore')
                        // ->has('userTest.testScore')
                        ->with(['userTest.testScore' => function($query) use($test_id){
                            $query->where('test_id_1' ,$test_id);
                            $query->where('scores', '>=', 218);
                        }])
                        ->whereHas('userTest.testScore', function($query) use($test_id){
                            $query->where('test_id_1' ,$test_id);
                            $query->where('scores', '>=', 218);
                        })
                        ->whereNotIn('id', $like_array)
                        ->whereNotIn('id', $connect_array)
                        ->whereNotIn('id', $chat_array)
                        ->whereNotIn('id', $like_request_array)
                        ->whereNotIn('id', $connect_request_array)
                        ->whereNotIn('id', $chat_request_array)
                        ->where('email_verified_at','!=', null)
                        ->where('latitude','!=', null)
                        ->where('longitude','!=', null)
                        ->where('status',1)
                        ->where('hide_from_search','0')
                        ->where('is_profile_complete',1)
                        // ->sortByDesc('scores')
                        ->whereIn('gender', $gender_array)
                        ->get();
        // echo "<pre>"; print_r($users); die;                        
        if(count($users) > 0)  {
            return response()->json([
                'status' => 200,
                'data'   => $users,
                'message'=> 'Profiles', 
            ]);                                    
        } else {
            return response()->json([
                'status' => 400,
                'message'=> 'Seems like you have to come back later.', 
            ]);
        }                         
    }

    public function deleteUserTestRecord(Request $request) {

        $validator = Validator::make($request->all(), [
                'user_id' => 'required|exists:users,id',
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $test_id = UserTest::where('user_id', $request->user_id)->value('id');
        if($test_id) {
            $delTestQuesComp = TestQuesComparison::where(function($query) use ($test_id) {
                                                    $query->orWhere('test_id_1', $test_id);
                                                    $query->orWhere('test_id_2', $test_id);
                                                })
                                                ->delete();

            $delTestSCores = TestScore::where(function($query) use ($test_id) {
                                            $query->orWhere('test_id_1', $test_id);
                                            $query->orWhere('test_id_2', $test_id);
                                        })                            
                                        ->delete();       

            $testQues = TestQues::where('test_id',$test_id)->get();
            foreach($testQues as $testQue){
                TestQuesAns::where('test_que_id',$testQue['id'])->delete();
            }
            TestQues::where('test_id',$test_id)->delete();             
            
            $deleteTest = UserTest::where('id', $test_id)->delete();

            return response()->json([
                'status' => 200,
                'data'   => '',
                'message'=> 'Success!', 
            ]);                                         
        } else {
            return response()->json([
                'status' => 400,
                'message'=> 'Test does not exist.', 
            ]); 
        }
    }
}
