<?php

namespace App\Http\Controllers\frontEnd;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\User;

class ContactUsContoller extends Controller
{
    
    public  function contactUs(Request $request) {

        //Send contact Us email to support@love-push.com
        User::sendContactUsEmail($request);
        return redirect('/')->with('success','Contact us form submitted successfully.');
    }

}
