<?php
namespace App\Http\Controllers\backEnd;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\ReportChat;
use App\User;
use App\ReportImage;
use App\UserProfileImages;
use App\PostAds;
use App\Post;

class ReportController extends Controller
{
    public function index(Request $request) {

        $reports = ReportChat::with('userInfo1','userInfo2')->orderBy('id','desc')->get();
        return view('backEnd.reports.index', compact('reports'));
    }

    public function block_user($id) {
        $report = ReportChat::where(['id'=>$id])->first();

        $blocked = User::where('id', $report['reported_user_id'])->update(['isBlocked'=>'1']);
        if($blocked) {
            ReportChat::where(['id'=>$id])->update(['report_status'=>'1']);
            return redirect('/admin/reported_users')->with('success','User blocked successfully.');
        } else {
            return redirect('/admin/reported_users')->with('error',COMMON_ERR);
        }
    }

    public function unblock_user($id) {
        $report = ReportChat::where(['id'=>$id])->first();

        $blocked = User::where('id', $report['reported_user_id'])->update(['isBlocked'=>'0']);
        if($blocked) {
            return redirect('/admin/reported_users')->with('success','User blocked successfully.');
        } else {
            return redirect('/admin/reported_users')->with('error',COMMON_ERR);
        }
    }

    public function mark_solved($id) {
        $solved = ReportChat::where(['id'=>$id])->update(['report_status'=>'1']);
        if($solved) {
            return redirect('/admin/reported_users')->with('success','Report case solved successfully.');
        } else {
            return redirect('/admin/reported_users')->with('error',COMMON_ERR);
        }
    }

    public function reported_images(Request $request) {
        $report_images = ReportImage::with('user','reported_user','post.userInfo','postad.userInfo','profile_image.user')->orderBy('id','desc')->get();
        //echo "<pre>";print_r($report_images->toarray());die;
        if($report_images){
            return view('backEnd.reports.report_images', compact('report_images'));
        }
        else{
            return view('backEnd.reports.report_images');
        }
        
    }

    public function reported_images_mark_solved($id) {
        $report = ReportImage::with('user','reported_user','post.userInfo','postad.userInfo','profile_image.user')->where(['id'=>$id])->first();
        if($report) {
            return view('backEnd.reports.view_report_image', compact('report'));
        } else {
            return redirect('/admin/reported_images')->with('error',COMMON_ERR);
        }
    }

    public function remove_image(Request $request){
        $image_id = $request->image_id;
        $image_type = $request->image_type;
        if($image_type == "profile_image"){
            UserProfileImages::where('id',$image_id)->delete();
        }
        else if($image_type == "post"){
            Post::where('id',$image_id)->update(['image'=>Null]);
        }
        else if($image_type == "post_ad"){
            PostAds::where('id',$image_id)->update(['image'=>Null]);
        }

        ReportImage::where(['id'=>$request->row_id])->update(['status'=>'1']);
        return redirect('/admin/reported_images')->with('success','Image has been deleted successfully.');
    }

}