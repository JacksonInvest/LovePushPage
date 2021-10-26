<?php
namespace App\Http\Controllers\backEnd;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\FAQ;

class FaqController extends Controller
{
    public function index() {
        $faqs = FAQ::get();        
        return view('backEnd.faq.index', compact('faqs'));
    }

    public function add(Request $request) {
		
		if($request->isMethod('post')){
			$request->validate([
				'language_id' => 'required',
				'ques_type' => 'required_if:language_id,==,1',
				'ques_type1' => 'required_if:language_id,==,2',
				'question' => 'required',
				'answer' => 'required'
			],[
				'language_id.required' => 'Select Language',
				'ques_type.required' => 'Select Category',
				'ques_type1.required' => 'Select Category',
				'question.required' => 'Question is required',
				'answer.required' => 'Answer is required'
			]);

	        $faq = new FAQ;
	        $faq->language_id = $request->language_id; 
	        if($request->language_id == 1){
	        	$faq->ques_type = $request->ques_type;
	        } 
	        else if($request->language_id == 2){
	        	$faq->ques_type = $request->ques_type1;
	        }
	        $faq->question = $request->question;      
	        $faq->answer = $request->answer;  
	        $added = $faq->save();
	                 
	        if($added){
				return redirect('/admin/faqs')->with('success','Faq has been added successfully');
	        } else{
                return redirect()->back()->with('error',COMMON_ERR);
	        }
	    } else{
        	return view('backEnd.faq.form');
	    }
    }

    public function edit(Request $request,$faq_id) {
		if($request->isMethod('post')){
			$request->validate([
				'language_id' => 'required',
				'ques_type' => 'required_if:language_id,==,1',
				'ques_type1' => 'required_if:language_id,==,2',
				'question' => 'required',
				'answer' => 'required'
			]);
        
	        $faq = FAQ::find($faq_id);
	        $faq->language_id = $request->language_id; 
	        if($request->language_id == 1){
	        	$faq->ques_type = $request->ques_type;
	        } 
	        else if($request->language_id == 2){
	        	$faq->ques_type = $request->ques_type1;
	        }
	        $faq->question = $request->question;      
	        $faq->answer = $request->answer;  
	        $edited = $faq->save();    
	        if($edited){
				return redirect('/admin/faqs')->with('success','Faq has been edited successfully');
	        } else{
                return redirect()->back()->with('error',COMMON_ERR);
	        }
	    } else{
	        $faq = FAQ::find($faq_id);        
        	return view('backEnd.faq.form', compact('faq'));
	    }
    }

    public function delete(Request $request, $faq_id = null){
		
		$deleted = FAQ::where('id',$faq_id)->delete();
		if($deleted){
			return redirect('admin/faqs')->with('success','Faq has been deleted successfully');
		} else{
			return redirect()->back()->with('error',COMMON_ERR);
		}
	}

}