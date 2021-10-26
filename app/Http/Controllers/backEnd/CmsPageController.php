<?php
namespace App\Http\Controllers\backEnd;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\CmsPage;

class CmsPageController extends Controller
{
    public function index() {

        $pages = CmsPage::getPages();        
        return view('backEnd.cms_page.index', compact('pages'));
    }
    
    public function edit(Request $request,$page_id) {
		
		if($request->isMethod('post')){
            
            if($request->content == '') {
                return redirect()->back()->with('error', 'Please fill the content.');
            }

	        $edited = CmsPage::editPage($request,$page_id);        
	        if($edited){
				return redirect('admin/pages')->with('success','Page has been edited successfully');
	        } else{
                return redirect()->back()->with('error',COMMON_ERR);
	        }
	    } else{
	        $page = CmsPage::find($page_id);        
        	return view('backEnd.cms_page.form', compact('page'));
	    }
    }

}