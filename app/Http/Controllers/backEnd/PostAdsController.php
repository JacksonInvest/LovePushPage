<?php
namespace App\Http\Controllers\backEnd;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\PostAds;
use App\User;

class PostAdsController extends Controller
{
    public function index(Request $request) {

        $postads = PostAds::getPosts();        
        // echo "<pre>"; print_r($postads); die;
        return view('backEnd.postads.index', compact('postads'));
    }

    public function add(Request $request) {

        if($request->isMethod('post')){

            $request->validate([
                'title'       => 'required|min:2|max:255',
                'username'    => 'required',
                'post_type'   => 'required',
                'description' => 'required|min:1|max:1000',
                'location'    => 'required',
                'radius'      => 'required',
                'is_post_anonymously' => 'required',
                'status'      => 'required',
                // 'capture_distance'   => 'required|max:4',
                'image'       => 'nullable|mimes:jpeg,jpg,png'
            ]);
            
            $postad              = new PostAds;
            $postad->user_id     = $request->username;
            $postad->title       = $request->title;
            $postad->description = $request->description;
            $postad->post_type   = $request->post_type;
            if (!file_exists(url('/postads'))) {
                mkdir(url('/images/postads'), 0777, true);
            }
            if($request->has('image')){
                $image               = $request->file('image');
                $input['imagename']  = time().'.'.$image->getClientOriginalExtension();
                $destinationPath     = public_path('/images/postads');
                $image->move($destinationPath, $input['imagename']);
                $postad->image       = $input['imagename'];
            }
            $postad->location    = $request->location;
            $postad->latitude    = "12345";
            $postad->longitude   = "12345";
            $postad->is_post_anonymously = $request->is_post_anonymously;
            $postad->radius      = $request->radius;
            if($postad->save()){
                return redirect('admin/postads')->with('success','Record updated successfully.');
            } else{
                return redirect()->back()->with('error',COMMON_ERR);
            }
        } else{
            $users = User::where('username','!=','')->where('status',1)->where('email_verified_at','!=', null)->get();
            return view('backEnd.postads.add', ['users'=>$users]);
        }
    }
    

    public function delete($post_id) {
        
        $delete = PostAds::where('id', $post_id)->delete();
        if($delete) {
            return redirect('/admin/postads')->with('success','Record deleted successfully.');
        } else {
            return redirect('/admin/postads')->with('error',COMMON_ERR);
        }
    }

    public function edit(Request $request,$post_id) {
		
		if($request->isMethod('post')){

            $request->validate([
                'title'       => 'required|min:2|max:255',
                'description' => 'required|min:1|max:1000',
                'post_type'   => 'required',
                'is_post_anonymously' => 'required',
                // 'capture_distance'   => 'required|max:4',
                'image'     => 'nullable|mimes:jpeg,jpg,png'
            ]);
            
            $postad              = PostAds::find($post_id);
            $postad->title       = $request->title;
            $postad->description = $request->description;
            $postad->post_type   = $request->post_type;
            if (!file_exists(url('/postads'))) {
                mkdir(url('/images/postads'), 0777, true);
            }
            if($request->has('image')){
                $image               = $request->file('image');
                $input['imagename']  = time().'.'.$image->getClientOriginalExtension();
                $destinationPath     = public_path('/images/postads');
                $image->move($destinationPath, $input['imagename']);
                $postad->image       = $input['imagename'];
            }
            // $postad->location    = $request->location;
            // $postad->latitude    = $request->latitude;
            // $postad->longitude   = $request->longitude;
            $postad->is_post_anonymously = $request->is_post_anonymously;
            $postad->radius      = $request->radius;
	        if($postad->save()){
				return redirect('admin/postads')->with('success','Record updated successfully.');
	        } else{
                return redirect()->back()->with('error',COMMON_ERR);
	        }
	    } else{
	        $postad = PostAds::getPostById($post_id);        
        	return view('backEnd.postads.form', compact('postad'));
	    }
    }

    public function approve($post_id) {
        
        $approve = PostAds::where('id', $post_id)->update(['approval'=>'1']);
        if($approve) {
            return redirect('/admin/postads')->with('success','Record approved successfully.');
        } else {
            return redirect('/admin/postads')->with('error',COMMON_ERR);
        }
    }

    public function disapprove($post_id) {
        
        $disapprove = PostAds::where('id', $post_id)->update(['approval'=>'0']);
        if($disapprove) {
            return redirect('/admin/postads')->with('success','Record rejected successfully.');
        } else {
            return redirect('/admin/postads')->with('error',COMMON_ERR);
        }
    }

}