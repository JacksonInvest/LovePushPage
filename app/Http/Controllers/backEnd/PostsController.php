<?php
namespace App\Http\Controllers\backEnd;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Post;
use App\User;

class PostsController extends Controller
{
    public function index(Request $request) {

        $posts = Post::getPosts();        
        // echo "<pre>"; print_r($posts); die;
        return view('backEnd.posts.index', compact('posts'));
    }

    public function add(Request $request) {
        $users = User::where('username','!=','')->where('status',1)->where('email_verified_at','!=', null)->get();
        return view('backEnd.posts.add', ['users'=>$users]);
    }
    

    public function delete($post_id) {
        
        $delete = Post::where('id', $post_id)->delete();
        if($delete) {
            return redirect('/admin/posts')->with('success','Record deleted successfully.');
        } else {
            return redirect('/admin/posts')->with('error',COMMON_ERR);
        }
    }

    public function edit(Request $request,$post_id) {
		
		if($request->isMethod('post')){

            $request->validate([
                'title'       => 'required|min:2|max:255',
                'description' => 'required|min:1|max:1000',
                'is_post_anonymously' => 'required',
                // 'capture_distance'   => 'required|max:4',
                'image'     => 'nullable|mimes:jpeg,jpg,png'
            ]);
            
            $posts              = Post::find($post_id);
            $posts->title       = $request->title;
            $posts->description = $request->description;
            if (!file_exists(url('/post'))) {
                mkdir(url('/images/post'), 0777, true);
            }
            if($request->has('image')){
                $image               = $request->file('image');
                $input['imagename']  = time().'.'.$image->getClientOriginalExtension();
                $destinationPath     = public_path('/images/post');
                $image->move($destinationPath, $input['imagename']);
                $posts->image       = $input['imagename'];
            }
            // $posts->location    = $request->location;
            // $posts->latitude    = $request->latitude;
            // $posts->longitude   = $request->longitude;
            $posts->is_post_anonymously = $request->is_post_anonymously;
	        if($posts->save()){
				return redirect('admin/posts')->with('success','Record updated successfully.');
	        } else{
                return redirect()->back()->with('error',COMMON_ERR);
	        }
	    } else{
	        $posts = Post::getPostById($post_id);        
        	return view('backEnd.posts.form', compact('posts'));
	    }
    }

}