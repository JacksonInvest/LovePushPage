<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\user;
use Illuminate\Support\Facades\Hash;
use App\PersonalityQuestions;
use App\PersonalityQuestionsOptions;
class AdminController extends Controller
{   
    public function dashboard(){
        $total_users = User::where('role', 2)->count();
    	return view('admin.dashboard', compact('total_users'));
    }

    public function editProfile(Request $request){
    	if ($request->isMethod('post')) {
    		$rules = [
                'name'      => 'required',
                'email' 	=> 'required|email|unique:users,email,'.Auth::id(),
            ];
           /* $messages = [
                'cuisine_id.required' => 'Please select one cuisine.',
            ];*/
            $this->validate($request, $rules);

            $user = User::find(Auth::id());
            $user->name = $request->name;
            $user->email = $request->email;
            
            if($user->save()){
                return redirect(route('edit-profile'))
                ->with('success','Record has been updated successfully.');
            }
    	}
    	return view('admin.profile.edit_profile');
    }
    public function changePassword(Request $request){
    	if ($request->isMethod('post')) {
    		$rules = [
                'old_password'  			=> 'required|min:6',
                'new_password' 				=> 'required|min:6|confirmed',
                'new_password_confirmation' => 'required|min:6',
            ];
           /* $messages = [
                'cuisine_id.required' => 'Please select one cuisine.',
            ];*/
            $this->validate($request, $rules);

            $old_password = $request->old_password;
    
            if (Hash::check($old_password, Auth::user()->password)) {
	    		$user = User::find(Auth::id());
		        $user->password = Hash::make($request->new_password);
		        $user->save();
		        return redirect(route('change-password'))
                ->with('success', trans('api.user.password_change_success'));
		       
			}else{
				return redirect(route('change-password'))
                ->with('error', trans('api.user.password_not_matched'));
			}

    	}
    	return view('admin.profile.change_password');
    }

    public function users(Request $request){
        
    	$users = User::where('role', 2)
                ->where(function ($query) use ($request) {
                    if($request->search != ''){
                        $str = explode(" ", $request->search);
                        for($i=0; $i<count($str); $i++){
                            $query->where('name', 'LIKE', "%{$str[$i]}%")
                            ->orWhere('username', 'LIKE', "%{$str[$i]}%")
                            ->orWhere('phone', 'LIKE', "%{$str[$i]}%")
                            ->orWhere('city', 'LIKE', "%{$str[$i]}%")
                            ->orWhere('address', 'LIKE', "%{$str[$i]}%")
                            ->orWhere('eyecolor', 'LIKE', "%{$str[$i]}%")
                            ->orWhere('haircolor', 'LIKE', "%{$str[$i]}%")
                            ->orWhere('education', 'LIKE', "%{$str[$i]}%")
                            ->orWhere('job', 'LIKE', "%{$str[$i]}%")
                            ->orWhere('employer', 'LIKE', "%{$str[$i]}%");
                        }
                    }
                })
                ->orderBy('id','desc')
                ->paginate(10)->appends(['search'=> $request->search]);
    	return view('admin.users.users_list', compact('users'));
    }

    public function addNewQuestions( Request $request, $id=null){
        $data= array();
        if ($request->isMethod('post')) {
            $rules = [
                'question' => 'required',
                'option_1' => 'required',
                'option_2' => 'required',
                'option_3' => 'required',
                'option_4' => 'required',
            ];
           /* $messages = [
                'cuisine_id.required' => 'Please select one cuisine.',
            ];*/
            
            $this->validate($request, $rules);
            $qid = $request->qid; 
            if($qid){
                $question = PersonalityQuestions::find($qid);
            }else{
                $question = new PersonalityQuestions;
            }
            
            $question->question = $request->question;
            if($question->save()){
                if($qid){
                    PersonalityQuestionsOptions::where('personality_question_id', $qid)->delete();
                }
                for($i=1;$i<=4;$i++){

                    $pq_option = new PersonalityQuestionsOptions;
                    $pq_option->personality_question_id = $question->id;
                    $pq_option->option = $_POST['option_'.$i];
                    $pq_option->save();
                }
                
            }
            if($qid){
                return redirect(route('personality-question-list'))
                ->with('success', trans('admin.personality_question_edit_success'));
            }
            return redirect(route('personality-question-list'))
                ->with('success', trans('admin.personality_question_add_success'));
            
        }
        if($id){
            $data = PersonalityQuestions::with('options')->find($id);
           
        }
        return view('admin.personality_questions.add_new_question', compact('data'));
    }

    public function personalityQuestionList(){
        $questions = PersonalityQuestions::with('options')->orderBy('created_at', 'desc')->paginate(10);

        return view('admin.personality_questions.questions_list', compact('questions'));
    }

    public function questionStatusChange(Request $request){
        try{

            $q_id = $request->question_id;
            $question = PersonalityQuestions::find($q_id);
            if($question->is_active == 1){
                $question->is_active = 0;
            }else{
                $question->is_active = 1;
            }
            $question->save();
            $is_active  = $question->is_active;
            return response()->json([
                'status' => 'true',
                'is_active' => $is_active,
                'message' => trans('admin.question_change_status_success')
            ]);

        }catch(\Exception $e){
            return response()->json([
                'status' => 'false',
                'message' => $e->getMessage()
            ]);
        }
    }

    public function subscriptionPlan(Request $request){
        return view('admin.subscription_plan.subscription_plan');
    }

    public function logOut() {
        if(Auth::check()){ 
            Auth::logout();
        } 
        return redirect('/login')->with('success','You have been logged out successfully');
    }   
}
