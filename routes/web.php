<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });
//FrontEnd
Route::group(['middleware'=>'language'],function(){

	Route::get('locale/{locale}', function ($locale){
	    Session::put('locale', $locale);
	    App::setLocale(session('locale'));
	    return redirect()->back();
	});
	Route::get('/',function(){
	    return view('frontEnd.index');
	});

	Route::get('/official-partners',function(){
	    return view('frontEnd.official_partner');
	});

	Route::get('/advisor',function(){
	    return view('frontEnd.advisor');
	});



	Route::post('/signUp','frontEnd\AuthContoller@signUp');
	Route::match(['get','post'],'/verification/{user_id}/{code}','frontEnd\AuthContoller@emailVerfication');
	Route::get('/checkEmailExists','frontEnd\AuthContoller@checkEmailExists');

	Route::post('/contactUs','frontEnd\ContactUsContoller@contactUs');
});

Route::get('resetpassword/{id}','frontEnd\AuthContoller@resetpassword');
Route::post('resetpassword1','frontEnd\AuthContoller@resetpassword_action');
Route::get('reset_msg','frontEnd\AuthContoller@reset_msg');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/privacy-policy',function(){
    return view('frontEnd.privacy-policy');
});


// Route::group(['prefix' => 'admin'], function()
// {
// 	Route::group([ 'middleware' => 'auth'], function() {

// 		Route::match(['get','post'], '/logOut','AdminController@logOut');

// 	    Route::get('dashboard', 'AdminController@dashboard')->name('dashboard');
// 	    //Admin Profile
// 	    Route::match(['get', 'post'], 'edit-profile', 'AdminController@editProfile')->name('edit-profile');
// 	    Route::match(['get', 'post'], 'change-password', 'AdminController@changePassword')->name('change-password');

// 	    //Users List
// 	    Route::match(['get', 'post'], 'users', 'AdminController@users')->name('users');

// 	    //Personality Questions(Add, Edit, List, change status)
// 	    Route::match(['get', 'post'], 'add-new-question/{id?}','AdminController@addNewQuestions')->name('add-question');
// 	    Route::get('personality-question-list', 'AdminController@personalityQuestionList')->name('personality-question-list');
// 	    Route::post('question-status-change', 'AdminController@questionStatusChange');
// 	    Route::match(['get', 'post'], 'subscription-plan', 'AdminController@subscriptionPlan')->name('subscription-plan');
	    
// 	});
// });


// --------------------------BACKEND ROUTES ------------------------//
Route::match(['get','post'],'admin/login', 'backEnd\AuthController@login');
Route::get('admin/logout', 'backEnd\AuthController@logout');
Route::get('admin/', 'backEnd\DashboardController@index');
Route::match(['get','post'],'admin/forgot-password', 'backEnd\AuthController@forgot_password');
Route::match(['get','post'],'admin/reset-password', 'backEnd\AuthController@reset_password');

Route::group(['prefix'=>'admin', 'middleware'=>'verifyAdminAuth'], function(){

	//admin profile
	Route::get('/profile', 'backEnd\AdminController@index');
	Route::match(['get','post'],'/profile/edit', 'backEnd\AdminController@edit_profile');
	Route::match(['get','post'],'/change-password', 'backEnd\AdminController@change_password');

	Route::get('/dashboard', 'backEnd\DashboardController@index');

	//User Management
	Route::match(['get','post'],'/users', 'backEnd\UserManagement@index');
	Route::match(['get','post'],'/user/add', 'backEnd\UserManagement@add');
	Route::match(['get','post'],'/user/edit/{user_id}', 'backEnd\UserManagement@edit');
	Route::post('/user/delete/{user_id}', 'backEnd\UserManagement@delete');
	Route::get('/user/image/delete/{usr_img_id}', 'backEnd\UserManagement@delete_image');
	Route::get('/user/resume/delete/{user_id}', 'backEnd\UserManagement@delete_resume');
	Route::get('/user/main-image/delete/{user_id}', 'backEnd\UserManagement@delete_main_image');

	// //PostAds
	Route::match(['get','post'],'/postads', 'backEnd\PostAdsController@index');
	Route::match(['get','post'],'/postads/add', 'backEnd\PostAdsController@add');
	Route::match(['get','post'],'/postad/edit/{post_id}', 'backEnd\PostAdsController@edit');
	Route::match(['get','post'],'/postad/delete/{post_id}', 'backEnd\PostAdsController@delete');
	Route::match(['get','post'],'/postad/approve/{post_id}', 'backEnd\PostAdsController@approve');
	Route::match(['get','post'],'/postad/disapprove/{post_id}', 'backEnd\PostAdsController@disapprove');

	// //Posts
	Route::match(['get','post'],'/posts', 'backEnd\PostsController@index');
	Route::match(['get','post'],'/posts/add', 'backEnd\PostsController@add');
	Route::match(['get','post'],'/posts/edit/{post_id}', 'backEnd\PostsController@edit');
	Route::match(['get','post'],'/posts/delete/{post_id}', 'backEnd\PostsController@delete');

	//Plan Management
	Route::match(['get','post'],'/plans', 'backEnd\PlanManagement@index');
	Route::match(['get','post'],'/plan/edit/{plan_id}', 'backEnd\PlanManagement@edit');

	//reported_users
	Route::get('/reported_users', 'backEnd\ReportController@index');
	Route::post('/reported_users/block_user/{id}', 'backEnd\ReportController@block_user');
	Route::post('/reported_users/unblock_user/{id}', 'backEnd\ReportController@unblock_user');
	Route::get('/reported_users/mark_solved/{id}', 'backEnd\ReportController@mark_solved');

	Route::get('/reported_images', 'backEnd\ReportController@reported_images');
	Route::get('/report_images/mark_solved/{id}', 'backEnd\ReportController@reported_images_mark_solved');
	Route::post('/report_images/remove_image', 'backEnd\ReportController@remove_image');

	Route::get('/deleted_accounts', 'backEnd\UserManagement@deleted_accounts');

	Route::get('/plan_list', 'backEnd\PlanManagement@plan_list');
	Route::get('/plan_details/{id}', 'backEnd\PlanManagement@plan_details');
	Route::get('/plan_edit/{id}', 'backEnd\PlanManagement@plan_edit');
	Route::post('/plan_update', 'backEnd\PlanManagement@plan_update');
	Route::get('/plan_subscriptions', 'backEnd\PlanManagement@plan_subscriptions');
	
	// //CMS Pages
	// Route::get('/pages', 'backEnd\CmsPageController@index');
	// Route::match(['get','post'],'/page/{page_id}', 'backEnd\CmsPageController@edit');

	//Faq's
	Route::get('/faqs', 'backEnd\FaqController@index');
	Route::match(['get','post'],'/faq/add', 'backEnd\FaqController@add');
	Route::match(['get','post'],'/faq/edit/{faq_id}', 'backEnd\FaqController@edit');
	Route::match(['get','post'],'/faq/delete/{faq_id}', 'backEnd\FaqController@delete');

	
});

Route::get('community_guidelines','backEnd\AdminController@community_guidelines');
Route::get('community_guidelines_ios','backEnd\AdminController@community_guidelines_ios');
Route::get('legacy','backEnd\AdminController@legacy');
Route::get('legacy_ios','backEnd\AdminController@legacy_ios');

//CONSTANTS
define('PROJECT_NAME','Love Push');
define("COMMON_ERROR", "Some error occured, Please try again after sometime.");
define('AUTH_ERR','Please login to access this page');
define('SYS_IMG_PATH','/images/system/');
define('ADMIN_IMG_PATH','/images/admin/');
define('USER_PROFILE_IMG_PATH','/profile/');

// define('USER_PROFILE_IMG_PATH','public/images/user_profile/');



define('QUICKBLOX_APP_ID',env('QUICKBLOX_APP_ID','79613'));
define('QUICKBLOX_AUTH_KEY',env('QUICKBLOX_AUTH_KEY','85QhQ9yuXevuA3S'));
define('QUICKBLOX_AUTH_SECRET',env('QUICKBLOX_AUTH_SECRET','7yAayFYOVms4usG'));



//FCM Push notification 
define('FCM_API_KEY','AIzaSyDcwsW0qKzGxwkwcbjjBITDRH--WCP0BPc');
