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


                                $scores = $this->_getScores($c_que_id, $my_que['answers'], $other_test_anss);

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
                    // die; //for one user
                }
                echo "<pre>"; print_r($res); die;
            }

            echo "<pre>"; print_r($res); die;

        }

        echo "1111"; die;

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


            return response()->json([
                'status' => 200,
                'data'   => $ques,
                'message'=> trans('api.user.answer_saved'),
            ]);
    }

    public function _getOtherUsers($all_users,$current_user_id){
        return Collect($all_users)->reject(function($all_user) use ($current_user_id){
            return $all_user['user_id'] === $current_user_id;
        });
    }

    public function _getScores($que_id, $my_anss, $other_anss) {

        $scores  = 0;
        $ky      = 0;
        $res     = [];
        foreach ($my_anss as $key => $my_ans) {

            $ans_id = $my_ans['ans_id'];
            echo $ans_id."<br>";

            foreach ($other_anss as $key1 => $other_ans) {

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
                } else if($que_id == 5) {
                    // Answer 1 and 5 equal 10
                    // Answer 2 and 4 equal 10
                    // Answer 2 and 1,3,5 equal 0
                    // All others equal 5
                    // $keys = array_search($ans_id, array_column($other_anss, 'ans_id'));
                    // $keys = array_keys(array_column($other_anss, 'ans_id'), $ans_id);
                    // if(in_array($ans_id, $other_anss)) {

                    $keys = $this->searchForId($ans_id, $other_anss);
                    // echo $keys;

                    // $search = $ans_id;
                    // $found = array_filter($other_anss,function($v,$k) use ($search){
                    //   return $v['ans_id'] => $search;
                    // }) 

                    // $values= print_r(array_value($found)); 
                    // $keys =  print_r(array_keys($found)); 
                    // var_dump($keys);
                    if($keys != null) {
                        $scores += 20;
                        unset($my_anss[$key]);
    
                        // if (($indexSpam = array_search($ans_id, $other_anss)) !== false) {
                             unset($other_anss[$keys]);
                        // }
                    } else {
                        // if()
                        $scores +=5;
                    }
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } 
                    // else if( ($ans_id == 17) && ($other_ans_id == 21) ) {
                    //     $scores +=10*2;
                    // } else if( ($ans_id == 21) && ($other_ans_id == 17) ) {
                    //     $scores +=10*2;
                    // } else if( ($ans_id == 18) && ($other_ans_id == 20) ) {
                    //     $scores +=10*2;
                    // } else if( ($ans_id == 20) && ($other_ans_id == 18) ) {
                    //     $scores +=10*2;
                    // } else if( ($ans_id == 18) && ($other_ans_id == 17) ) {
                    //     $scores +=0;
                    // } else if( ($ans_id == 17) && ($other_ans_id == 18) ) {
                    //     $scores +=0;
                    // } else if( ($ans_id == 18) && ($other_ans_id == 19) ) {
                    //     $scores +=0;
                    // } else if( ($ans_id == 19) && ($other_ans_id == 18) ) {
                    //     $scores +=0;
                    // } else if( ($ans_id == 18) && ($other_ans_id == 21) ) {
                    //     $scores +=0;
                    // } else if( ($ans_id == 21) && ($other_ans_id == 18) ) {
                    //     $scores +=0;
                    // } 
                    else {
                        $scores +=0;
                    }  
                } else if($que_id == 6) {
                    // Answer 1 and 4 equal 10
                    // Answer 2 and 3 equal 10
                    // Answer 3 and 7 equal 5
                    // Answer 5 and 6 equal 10
                    // Answer 7 and 1,2,4,5,6 equal 0
                    // All others equal 5 P
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

                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else {
                        $scores +=0;
                    } 

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


                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else {
                        $scores +=0;
                    } 

                } else if($que_id == 8) {
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else {
                        $scores +=0;
                    } 

                } else if($que_id == 9) {
                    // Same answers 20
                    // all others equal 5 Punkte
                    if($ans_id == $other_ans_id) {
                        $scores +=20*.15;
                    } else {
                        // if()
                        $scores +=5*.15;
                    }
                } else if($que_id == 10) {
                    // Answer 2 and 3 equal 10
                    // All others equal 5 Punkte
                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else if( ($ans_id == 53) && ($ans_id == 54) ) {
                        $scores +=10;
                    } else if( ($ans_id == 54) && ($ans_id == 53) ) {
                        $scores +=10;
                    } else {
                        $scores +=5;
                    }
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
                } else if($que_id == 13) {
                    // Answer 1 and 2 equal 0
                    // // Answer 2 and 8 equal 10
                    // // Answer 5 and 6,7 equal 10
                    // // Answer 4 and 7 equal 0
                    // // All others equal 5
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

                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else {
                        // if()
                        $scores +=5;
                    }

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

                    if($ans_id == $other_ans_id) {
                        $scores +=20;
                    } else {
                        // if()
                        $scores +=5;
                    }

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
                    //Query end
                } else {
                    $scores += 0;
                }
                $res[$ky]['que_id'] = $que_id;
                $res[$ky]['my_ans']  = $ans_id;
                $res[$ky]['other_ans_id']  = $other_ans_id;
                $res[$ky]['score']  = $scores;
                $ky++;
            }
            // die;
        }
        // echo "<pre>"; print_r($res); die;
        return $res;
        // return $que_id; die;
        // $scores  = 0;
        // if($my_ans == $other_ans){
        //     //give 20 marks
        //     $scores += 20;
        // } else {
        //     $scores += 5;
        // } 

        //Socres distribution ques wise
        // if($ques_id == 3) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 9) && ($ans_id == 11) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 11) && ($ans_id == 9) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 10) && ($ans_id == 12) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 12) && ($ans_id == 10) ) {
        //         $scores +=10;
        //     } else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 4) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 13) && ($ans_id == 15) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 15) && ($ans_id == 13) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 15) && ($ans_id == 16) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 16) && ($ans_id == 15) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 13) && ($ans_id == 14) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 14) && ($ans_id == 13) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 14) && ($ans_id == 15) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 15) && ($ans_id == 14) ) {
        //         $scores +=0;
        //     } else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 5) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20*2;
        //     } else if( ($ans_id == 17) && ($ans_id == 21) ) {
        //         $scores +=10*2;
        //     } else if( ($ans_id == 21) && ($ans_id == 17) ) {
        //         $scores +=10*2;
        //     } else if( ($ans_id == 18) && ($ans_id == 20) ) {
        //         $scores +=10*2;
        //     } else if( ($ans_id == 20) && ($ans_id == 18) ) {
        //         $scores +=10*2;
        //     } else if( ($ans_id == 18) && ($ans_id == 17) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 17) && ($ans_id == 18) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 18) && ($ans_id == 19) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 19) && ($ans_id == 18) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 18) && ($ans_id == 21) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 21) && ($ans_id == 18) ) {
        //         $scores +=0;
        //     } else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 6) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 22) && ($ans_id == 25) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 25) && ($ans_id == 22) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 23) && ($ans_id == 24) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 24) && ($ans_id == 23) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 24) && ($ans_id == 28) ) {
        //         $scores +=5;
        //     } else if( ($ans_id == 28) && ($ans_id == 24) ) {
        //         $scores +=5;
        //     } else if( ($ans_id == 26) && ($ans_id == 27) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 27) && ($ans_id == 26) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 28) && ($ans_id == 22) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 22) && ($ans_id == 28) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 28) && ($ans_id == 23) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 23) && ($ans_id == 28) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 28) && ($ans_id == 25) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 25) && ($ans_id == 28) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 28) && ($ans_id == 26) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 26) && ($ans_id == 28) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 28) && ($ans_id == 27) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 27) && ($ans_id == 28) ) {
        //         $scores +=0;
        //     } else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 7) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 30) && ($ans_id == 34) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 34) && ($ans_id == 30) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 31) && ($ans_id == 32) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 32) && ($ans_id == 31) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 33) && ($ans_id == 36) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 36) && ($ans_id == 33) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 35) && ($ans_id == 37) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 37) && ($ans_id == 35) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 30) && ($ans_id == 36) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 36) && ($ans_id == 30) ) {
        //         $scores +=0;
        //     } else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 8) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 38) && ($ans_id == 39) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 39) && ($ans_id == 38) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 39) && ($ans_id == 41) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 41) && ($ans_id == 39) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 40) && ($ans_id == 41) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 41) && ($ans_id == 40) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 40) && ($ans_id == 42) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 42) && ($ans_id == 40) ) {
        //         $scores +=10;
        //     } else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 9) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20*0.15;
        //     } else {
        //         $scores +=5*0.15;
        //     }
        // } else if($ques_id == 10) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 53) && ($ans_id == 54) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 54) && ($ans_id == 53) ) {
        //         $scores +=10;
        //     } else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 11) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 55) && ($ans_id == 56) ) {
        //         $scores +=5;
        //     } else if( ($ans_id == 56) && ($ans_id == 55) ) {
        //         $scores +=5;
        //     }else if( ($ans_id == 57) && ($ans_id == 55) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 55) && ($ans_id == 57) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 57) && ($ans_id == 56) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 56) && ($ans_id == 57) ) {
        //         $scores +=0;
        //     } else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 12) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 58) && ($ans_id == 59) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 59) && ($ans_id == 58) ) {
        //         $scores +=10;
        //     }
        //     //Query start Answer 1,2 and 6,7 equal 0  
        //     else if( ($ans_id == 58) && ($ans_id == 63) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 63) && ($ans_id == 58) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 58) && ($ans_id == 64) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 64) && ($ans_id == 58) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 59) && ($ans_id == 63) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 63) && ($ans_id == 59) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 59) && ($ans_id == 64) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 64) && ($ans_id == 59) ) {
        //         $scores +=0;
        //     } 
        //     //Query end Answer 1,2 and 6,7 equal 0  
        //     else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 13) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 65) && ($ans_id == 66) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 66) && ($ans_id == 65) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 66) && ($ans_id == 72) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 72) && ($ans_id == 66) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 69) && ($ans_id == 70) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 70) && ($ans_id == 69) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 69) && ($ans_id == 71) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 71) && ($ans_id == 69) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 68) && ($ans_id == 71) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 71) && ($ans_id == 68) ) {
        //         $scores +=0;
        //     } else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 14) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     }
        //     //Query start Answer 1  and 2,4 equal 5 
        //                 //Answer 1  and 2 equal 0 
        //      else if( ($ans_id == 74) && ($ans_id == 75) ) {
        //         $scores +=5;
        //     } else if( ($ans_id == 75) && ($ans_id == 74) ) {
        //         $scores +=5;
        //     }
        //     //Query end
        //     else if( ($ans_id == 74) && ($ans_id == 77) ) {
        //         $scores +=5;
        //     }else if( ($ans_id == 77) && ($ans_id == 74) ) {
        //         $scores +=5;
        //     }else if( ($ans_id == 76) && ($ans_id == 77) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 77) && ($ans_id == 76) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 78) && ($ans_id == 74) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 74) && ($ans_id == 78) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 78) && ($ans_id == 75) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 75) && ($ans_id == 78) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 78) && ($ans_id == 76) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 76) && ($ans_id == 78) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 78) && ($ans_id == 77) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 77) && ($ans_id == 78) ) {
        //         $scores +=0;
        //     } else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 15) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 79) && ($ans_id == 82) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 82) && ($ans_id == 79) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 80) && ($ans_id == 83) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 83) && ($ans_id == 80) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 84) && ($ans_id == 85) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 85) && ($ans_id == 84) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 69) && ($ans_id == 71) ) {
        //         $scores +=10;
        //     } else {
        //         $scores +=5;
        //     }
        // } else if($ques_id == 16) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 86) && ($ans_id == 89) ) {
        //         $scores +=0;
        //     } else if( ($ans_id == 89) && ($ans_id == 86) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 86) && ($ans_id == 87) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 87) && ($ans_id == 86) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 88) && ($ans_id == 89) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 89) && ($ans_id == 88) ) {
        //         $scores +=10;
        //     }
        //     //Query start Answer 1  and 4 equal 0 
        //             // Answer 1  and 2 equal 10 
        //             // Answer 3  and 4 equal 10 
        //             //no option for 5
        //     else {
        //         $scores +=0;
        //     } 
        //     //Query end
        // } else if($ques_id == 17) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 90) && ($ans_id == 92) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 92) && ($ans_id == 90) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 90) && ($ans_id == 91) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 91) && ($ans_id == 90) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 91) && ($ans_id == 92) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 92) && ($ans_id == 91) ) {
        //         $scores +=10;
        //     }
        //     //Query start Answer 1  and 3 equal 10
        //                  // Answer 1  and 2 equal 0 
        //                  // Answer 2  and 3 equal 10   
        //                 //no option for defualt 5
        //     else {
        //         $scores +=0;
        //     } 
        //     //Query end
        // } else if($ques_id == 18) {
        //     if($my_ans == $other_anss) {
        //         $scores +=20;
        //     } else if( ($ans_id == 93) && ($ans_id == 95) ) {
        //         $scores +=10;
        //     } else if( ($ans_id == 95) && ($ans_id == 93) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 93) && ($ans_id == 94) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 94) && ($ans_id == 93) ) {
        //         $scores +=0;
        //     }else if( ($ans_id == 94) && ($ans_id == 95) ) {
        //         $scores +=10;
        //     }else if( ($ans_id == 95) && ($ans_id == 94) ) {
        //         $scores +=10;
        //     }
        //     //Query start Answer 1  and 3 equal 10
        //                  // Answer 1  and 2 equal 0 
        //                  // Answer 2  and 3 equal 10   
        //     else {
        //         $scores +=0;
        //     } 
        //     //Query end
        // } else {
        //     $scores +=0;
        // }
        // return $scores;
    }

    function searchForId($id, $array) {
        foreach ($array as $key => $val) {
            if ($val['ans_id'] === $id) {
               return $key;
            }
        }
       return null;
    }

    public function getRecommededProfile(Request $request) {

        $validator = Validator::make($request->all(), [
                'user_id' => 'required|exists:users,id',
            ]
        );
        
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(), 'status' => 400]);
        }

        $user_id = $request->user_id;

        $my_ques_ans = UserAttemptQuestion::getMyQuesAnswers($user_id);

        $other_user_ques_ans = UserAttemptQuestion::getOtherUserQuesAnswers($user_id);
        echo "<pre>"; print_r($other_user_ques_ans); die;
    }

}
