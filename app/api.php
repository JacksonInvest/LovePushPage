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
Route::post('forgot-password', 'UserApiController@forgotPassword');
Route::post('save-forgot-password', 'UserApiController@saveForgotPassword');

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
	
	Route::post('/getRecommededProfile', 'api\PersonalityTestController@getRecommededProfile');
	Route::post('/deleteUserTestRecord', 'api\PersonalityTestController@deleteUserTestRecord');

	//Personality test questions
	Route::get('/getPersonalityQuestions', 'api\PersonalityTestController@questioons');
	Route::post('/userAnswerSave', 'api\PersonalityTestController@userAnswerSave');


	//Post Ads
	Route::post('/addPostAds', 'api\PostAdsController@addPostAds');
	Route::post('/deletePost', 'api\PostAdsController@deletePost');
	Route::get('/myPostads', 'api\PostAdsController@myPostads');
	Route::get('/getAllPosts', 'api\PostAdsController@getAllPosts');

	Route::get('/explores', 'api\ExploreController@explores');

	Route::post('/saveQbDialog', 'api\MatchController@saveQbDialog');

	//Send chat request
	Route::post('/sendChatRequest', 'api\ChatReqController@sendChatRequest');
	Route::post('/chatRequestStatusUpdate', 'api\ChatReqController@chatRequestStatusUpdate');
	

});
Route::post('/like', 'api\LikeController@likeDislike');

Route::post('/sendConnectRequest', 'api\ConnectController@sendConnectRequest');
Route::post('/connectRequestStatusUpdate', 'api\ConnectController@connectRequestStatusUpdate');

Route::post('/myMatches', 'api\MatchController@myMatches');
Route::post('/saveQbDialogId', 'api\MatchController@saveQbDialogId');
Route::post('/deleteQbDialogId', 'api\MatchController@deleteQbDialogId');
Route::post('/updateChatStatus', 'api\MatchController@updateChatStatus');

//Get My Notification List
Route::post('/notifications', 'api\NotificationController@notifications');


Route::post('/notifyAndroidNotification', 'api\ConnectController@notifyAndroidNotification');