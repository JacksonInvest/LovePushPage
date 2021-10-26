<?php

namespace App\Http\Controllers\backEnd;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Auth;
use Session;
use Hash;

use App\State;
use App\User;
use App\Admin;
use App\StaticPage;
use Image;

class AdminController extends Controller
{
	public function index(Request $request){
		return view('backEnd.account.profile');
	}

	public function edit_profile(Request $request){

		if($request->isMethod('post')){
			$data = $request->input();
			
			$request->validate([
				'name' 		=> 'required|max:100',
				'email' 	=> 'required|email|max:100',
				'phone' 	=> 'required|max:20',
				// 'capture_distance' 	=> 'required|max:4',
				'image' 	=> 'nullable|mimes:jpeg,jpg,png'
			]);

			$admin 				= Admin::find(Auth::guard('admin')->user()->id);
			$admin->name 		= $request->name;
			$admin->email 		= $request->email;
			$admin->phone 		= $request->phone;
			// $admin->capture_distance = $request->capture_distance;
			if($admin->save()){

				//image upload
	           //  if($request->file('image')){
	           //      $file       = $request->file('image');
	           //      $file_name  = $file->getClientOriginalName();
	           //      $file_ext   = $file->getClientOriginalExtension();
	                
	           //      $new_file_name = $this->generateImageName().'.'.$file_ext;
	           //      $base_path = base_path(ADMIN_IMG_PATH);

	           //      $img = Image::make($file->getRealPath());
	           //      $img->orientate();
	           //      $img->resize(512, 512, function ($constraint) {
	           //              // $constraint->aspectRatio();
	           //          })
	           //          ->save($base_path.$new_file_name);

	           //      // if($file->move($base_path, $new_file_name)) {

            //             $old_img = $admin->getActualAttribute('image');
				       	// if(!empty($old_img)){
				        //     $img   = $base_path.$old_img;
				        //     if(file_exists($img)) {
				        //         unlink($img);
				        //     }
				        // } 
				 
	           //          $admin->image = $new_file_name;
	           //          $admin->save();
	           //      // } 
	           //  }
	         	
				if ($request->hasFile('image')) {
		            $image = $request->file('image');
		            $name  = time().'.'.$image->getClientOriginalExtension();
		            // $destinationPath = public_path('asset/img/services/');
		            $destinationPath = public_path(ADMIN_IMG_PATH);

		            $image->move($destinationPath, $name);
		            $admin->image = $name;  
		            $admin->save();               
		        }

				if(Auth::guard('admin')->loginUsingId($admin->id)) {
					return redirect('/admin/profile')->with('success','Your profile has been updated successfuly');
				} else{ 
					return redirect()->back()->with('error',COMMON_ERR);
				}
			} else{
				return redirect()->back()->with('error',COMMON_ERR);
			}
		} else{
			return view('backEnd.account.profile');
		}
	}

	public function change_password(Request $request){

		if($request->isMethod('post')){
			
			$request->validate([
				'password' 	=> 'bail|required|min:5|max:100|confirmed'
			]);

			if(Auth::guard('admin')->attempt([
				'email' 	=> Auth::guard('admin')->user()->email,
				'password' 	=> $request->old_password
			])){
				$admin 				= Admin::find(Auth::guard('admin')->user()->id);
				$admin->password	= Hash::make($request->password);
				if($admin->save()){
					return redirect('/admin/change-password')->with('success','Your password has been updated successfuly');
				} else{
					return redirect()->back()->with('error',COMMON_ERR);
				}
			} else{
				return redirect()->back()->with('error','Current Password is incorrect');
			}

		} else{
			return view('backEnd.account.change_password');
		}
	}

	public function community_guidelines(Request $request){
		$content = StaticPage::where(['page_name'=>'community_guidelines'])->select('page_heading','content')->first();
		if($content){
			return view('static_page',['content'=>$content]);
		}
	}

	public function legacy(Request $request){
		$content = StaticPage::where(['page_name'=>'legacy'])->select('page_heading','content')->first();
		if($content){
			return view('static_page',['content'=>$content]);
		}
	}

	public function community_guidelines_ios(Request $request){
		$content = StaticPage::where(['page_name'=>'community_guidelines'])->select('page_heading','content')->first();
		if($content){
			return view('static_page_ios',['content'=>$content]);
		}
	}

	public function legacy_ios(Request $request){
		$content = StaticPage::where(['page_name'=>'legacy'])->select('page_heading','content')->first();
		if($content){
			return view('static_page_ios',['content'=>$content]);
		}
	}

}