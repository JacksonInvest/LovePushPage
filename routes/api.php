<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::post('/register', 'UserApiController@register');
// Route::post('/login', 'UserApiController@login');
// Route::post('/create-profile', 'UserApiController@createProfile');
// Route::post('/send-verification-code', 'UserApiController@sendVerificationCode');
// Route::post('/verify-code', 'UserApiController@verifyCode');
Route::post('forgot-password', 'api\AuthController@forgotPassword');
Route::post('save-forgot-password', 'UserApiController@saveForgotPassword');

//
Route::post('isSocialUser', 'api\AuthController@isSocialUser');

/*---- Apr 18,2019 Start -----*/
Route::post('/login', 'api\AuthController@login');
Route::post('/register', 'api\AuthController@register');
Route::post('/socailLogin', 'api\AuthController@socailLogin');
Route::post('/instaLogin', 'api\AuthController@instaLogin');
Route::post('/addUserInfo', 'api\AuthController@addUserInfo');
Route::post('/create-profile', 'api\AuthController@createProfile');
Route::post('/send-verification-code', 'api\AuthController@sendVerificationCode');
Route::post('/verify-code', 'api\AuthController@verifyCode');
Route::post('/reSendVerificationCode', 'api\AuthController@reSendVerificationCode');

Route::get('/getLovePushIntentions', 'api\AuthController@getLovePushIntentions');

Route::group(['middleware' => ['auth:api']], function () {
	// Route::post('/change-password', 'UserApiController@changePassword');
	Route::post('/add-post-ads', 'UserApiController@addPostAds');
	// Route::get('/get-profile', 'UserApiController@getProfile');
	// Route::post('update-profile', 'UserApiController@updateProfile');
	Route::get('explore-users', 'UserApiController@exploreUsers');
	Route::post('user-like', 'UserApiController@userLike');
	Route::post('user-dislike', 'UserApiController@userDislike');
	Route::get('/notifications', 'UserApiController@notifications');
	Route::get('matched-users', 'UserApiController@matchedUsers');
	Route::get('personality-questions', 'UserApiController@personalityQuestions');
	Route::post('submit-personality-test', 'UserApiController@SubmitPersonalityTest');
	Route::get('get-post-ads', 'UserApiController@postAds');
	Route::get('recommended-profile', 'UserApiController@recommendedProfile');
	// Route::get('logout', 'UserApiController@logout');

	Route::get('get-own-postads', 'UserApiController@ownPostads');
	Route::post('add-feed', 'UserApiController@addFeed');
	Route::get('get-own-feeds', 'UserApiController@getOwnFeeds');
	Route::post('update-setting', 'UserApiController@updateSetting');

	//---- Apr 18,2019 Start ----
	Route::post('/logout', 'api\AuthController@logout');

	Route::post('/get-profile', 'api\ProfileController@getProfile');
	Route::post('/change-password', 'api\ProfileController@changePassword');
	Route::post('/update-profile', 'api\ProfileController@updateProfile');
	Route::post('/profile-images/add', 'api\ProfileController@profileImagesAdd');
	Route::post('/profile-image/delete', 'api\ProfileController@deleteProfileImage');
	
	Route::post('/getRecommededProfile', 'api\TestController@getRecommededProfile');
	Route::post('/deleteUserTestRecord', 'api\TestController@deleteUserTestRecord');

	//Personality test questions
	Route::get('/getPersonalityQuestions', 'api\TestController@questioons');
	Route::post('/userAnswerSave', 'api\TestController@userAnswerSave');


	//Post Ads
	Route::post('/addPostAds', 'api\PostAdsController@addPostAds');
	Route::post('/editPostAds', 'api\PostAdsController@editPostAds');
	Route::post('/deletePost', 'api\PostAdsController@deletePost');
	Route::get('/myPostads', 'api\PostAdsController@myPostads');
	Route::get('/getAllPosts', 'api\PostAdsController@getAllPosts');


	//Posts (for HomeScreen)
	Route::post('/addPost', 'api\PostController@addPost');
	Route::post('/editPost', 'api\PostController@editPost');
	Route::post('/removePost', 'api\PostController@removePost');
	Route::get('/myPost', 'api\PostController@myPosts');
	Route::get('/getPosts', 'api\PostController@getPosts');
	Route::post('/postLikeUnlike', 'api\PostController@postLikeUnlike');

	Route::get('/explores', 'api\ExploreController@explores');

	Route::post('/saveQbDialog', 'api\MatchController@saveQbDialog');

	//Send chat request
	Route::post('/sendChatRequest', 'api\ChatReqController@sendChatRequest');
	Route::post('/chatRequestStatusUpdate', 'api\ChatReqController@chatRequestStatusUpdate');

	Route::post('/searchUser', 'api\ExploreController@searchUser');

	Route::get('/referalTree', 'api\AuthController@referalTree');

	Route::get('/getSettings', 'api\AuthController@getSettings');

	Route::post('/deleteChat', 'api\ChatReqController@deleteChat');
	Route::post('/reportChat', 'api\ChatReqController@reportChat');
	Route::post('/myMatches', 'api\MatchController@myMatches');
	Route::get('/checkBlock', 'api\AuthController@checkBlock');
	Route::post('/blockUser', 'api\AuthController@blockUser');
	Route::post('/deleteAccount', 'api\AuthController@deleteAccount');
	Route::post('/reportImage', 'api\AuthController@reportImage');
	Route::get('/subscribe/paypal', 'api\SubscriptionPlanController@paypalRedirect')->name('paypal.redirect');
	Route::get('/cancel/subscribe/paypal', 'api\SubscriptionPlanController@cancel_subscription')->name('paypal.cancel');
	Route::get('my_plan_details', 'api\SubscriptionPlanController@my_plan_details')->name('my_plan_details');
	Route::post('update_plan_data', 'api\SubscriptionPlanController@update_plan_data')->name('update_plan_data');

});

Route::get('/subscribe/paypal/return', 'api\SubscriptionPlanController@paypalReturn')->name('paypal.return');

Route::get('/webhook', 'api\SubscriptionPlanController@webhook')->name('webhook');

Route::post('create_plan', 'api\PlanController@create_plan');
Route::get('list_plan', 'api\PlanController@list_plan');
Route::get('plan_details/{id}', 'api\PlanController@plan_details');

Route::post('/like', 'api\LikeController@likeDislike');

Route::post('/sendConnectRequest', 'api\ConnectController@sendConnectRequest');
Route::post('/connectRequestStatusUpdate', 'api\ConnectController@connectRequestStatusUpdate');


Route::post('/chatList', 'api\MatchController@chatList');
Route::post('/saveQbDialogId', 'api\MatchController@saveQbDialogId');
Route::post('/deleteQbDialogId', 'api\MatchController@deleteQbDialogId');

//settings
Route::post('/updateChatStatus', 'api\MatchController@updateChatStatus');
Route::post('/hideFromSearch', 'api\AuthController@hideFromSearch');
Route::post('/setLikeRequest', 'api\AuthController@setLikeRequest');
Route::post('/setChatRequest', 'api\AuthController@setChatRequest');
Route::post('/setNotification', 'api\AuthController@setNotification');
Route::post('/support', 'api\AuthController@support');


//Get My Notification List
Route::post('/notifications', 'api\NotificationController@notifications');
Route::post('/ClearNotifications', 'api\NotificationController@ClearNotifications');
Route::post('/deleteNotification', 'api\NotificationController@deleteNotification');
Route::post('/readNotifications', 'api\NotificationController@readNotifications');


Route::post('/notifyAndroidNotification', 'api\ConnectController@notifyAndroidNotification');


//
Route::post('/deleteMatchRecord', 'api\MatchController@deleteMatchRecord');
Route::post('/unmatch', 'api\MatchController@unmatch');

Route::post('/updateLocation', 'api\ProfileController@updateLocation');

Route::post('/radars', 'api\ExploreController@radars');

Route::get('/subscriptionPlans', 'api\SubscriptionPlanController@subscriptionPlans');
Route::get('/faq', 'api\AuthController@faq');
Route::get('/appLinks', 'api\AuthController@appLinks');
Route::get('/plans', 'api\SubscriptionPlanController@plans');