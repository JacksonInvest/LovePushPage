<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\NotificationDesc;
class Notification extends Model
{	

	public function userInfo() {
		return $this->belongsTo('App\User','user_id','id')
					->select('id','name','email','profile_image','quickblox_id','receive_notification');
	}

	public function eventInfo() {
		return $this->belongsTo('App\ConnectRequest','event_id','id')
					->select('id','from_user_id','to_user_id','status');
	}

	public function messEventInfo() {
		return $this->belongsTo('App\ChatRequest','event_id','id')
					->select('id','from_user_id','to_user_id','status');
	}

	public function notificationMessage() {
		return $this->hasOne('App\NotificationDesc','notification_id','id')
					->select('notification_id','message');
	}

	public static function saveNotification($event_type, $event_id, $user_id, $to_user_id) {

		$exist = Notification::where('event_type', $event_type)
							->where('event_id', $event_id)
							->where('user_id', $user_id)
							->where('to_user_id', $to_user_id)
							->first();

		if(!$exist) {
			$noti = new Notification;
			$noti->event_type = $event_type;
			$noti->event_id   = $event_id;
			$noti->user_id    = $user_id;
			$noti->to_user_id = $to_user_id;
			if($noti->save()) {

				//Get to_user_id name
				$name = User::where('id', $user_id)->value('name');

				$en_mesg = '';
				$de_mesg = '';
				if($event_type == 'L') { //Like
					// $en_mesg = $name.' has like your profile.';
					// $de_mesg = $name.' hat dein Profil gefallen.';
					$en_mesg = $name.' has sent you Date Request.';
					$de_mesg = $name.' hat dein Profil gefallen.';
				} else if($event_type == 'S_C_R') { //Send Connect request
					$en_mesg = $name.' has sent you Connect Request';
					$de_mesg = $name.' hat Ihnen eine Verbindungsanforderung gesendet.';
				} else if($event_type == 'A_C_R') { //Send Connect request
					$en_mesg = $name.' accepted a connect request.';
					$de_mesg = $name.' hat eine Verbindungsanforderung angenommen.';
				} else if($event_type == 'S_M_R') { //Send chat messaging request
					$en_mesg = $name.' has sent you Chat Request.';
					$de_mesg = $name.' hat dir eine Chatanfrage gesendet.';
				} else if($event_type == 'A_M_R') { //Send chat messaging request
					$en_mesg = $name.' accepted a chat request.';
					$de_mesg = $name.' hat eine Chatanfrage gesendet.';
				} 
				else if($event_type == 'S_L_R') { //Send chat messaging request
					$en_mesg = $name.' has sent you Date Request.';
					$de_mesg = $name.' hat Ihnen eine Terminanfrage gesendet.';
				} 
				else if($event_type == 'A_L_R') { //Send chat messaging request
					$en_mesg = $name.' has accepted your Date Request.';
					$de_mesg = $name.' hat Ihre Terminanfrage angenommen.';
				}
				else if($event_type == 'P_L_R'){
					$en_mesg = $name.' has liked your post.';
					$de_mesg = $name.' hat Ihren Beitrag gefallen.';
				} 

				$messages = [$en_mesg, $de_mesg];

				for ($i=0; $i <= 1; $i++) { 
					$desc = new NotificationDesc;
					$desc->notification_id = $noti->id;
					$desc->language_id     = $i+1;
					$desc->message         = $messages[$i];
					$desc->save();
				}
			}
		}							
	}

	public static function makeNotificationInactive($event_type, $event_id) {

		Notification::where('event_type', $event_type)
					->where('event_id', $event_id)
					->update(
						['status' => 0]
					);
	}

}
