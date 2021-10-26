<?php

namespace App\Http\Controllers\backEnd;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
// use App\Http\Requests\StorePlan;
use App\UserReport;

class UserReportController extends Controller
{

	public function index(Request $request){

		$reports = UserReport::getReports($request);
		// echo "<pre>"; print_r($reports); die;
		return view('backEnd.user_report.index', compact('reports'));
	}

	public function edit(Request $request,$report_id = null){

		if($request->isMethod('post')){
			// $data = $request->input();
			$report = UserReport::editReport($request, $report_id);
			if($report != false){
				return redirect('/admin/reports')->with('success','Updated successfully');
			} else{
				return redirect()->back()->with('error',COMMON_ERR);
			}
		}

		$report = UserReport::getReport($report_id);		
		if(!empty($report)){
			return view('backEnd.user_report.form', compact('report'));
		} else{
			return redirect()->back()->with('error','Record not found');
		}
	}

}