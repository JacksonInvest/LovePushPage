<?php

namespace App\Http\Controllers\backEnd;
use App\Http\Controllers\Controller;
use Auth;
use App\User;
use App\School;

class DashboardController extends Controller
{
	public function index() {

		if (!Auth::guard('admin')->check()) {
            return redirect('/admin/login');
        }
        $user_count   =  User::count();
        // $user_count = 1;
		// echo $user_count; die;

		return view('backEnd.dashboard', compact('user_count'));
	}


}
