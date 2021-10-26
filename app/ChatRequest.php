<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ChatRequest extends Model
{
	// protected $fillable = [
	// ];

    public function otherUser() {
        return $this->belongsTo('App\User','from_user_id','id')
                    ->select('id','name','email','profile_image','quickblox_id');
    }

    //sort the like-dislike string in the users table (column name = like_user_ids)
    public static function getChatRequestString($from_user_id = null, $to_user_id = null) {

        $chat_string = '';
        $user_chat_string = User::where('id', $from_user_id)->value('chat_user_ids');
        if(empty($user_chat_string)) {
            $chat_string = $to_user_id;
        } else {
            $check_string = User::where('id', $from_user_id)->whereRaw('FIND_IN_SET(?,chat_user_ids)', [$to_user_id])->first(); //checking in the string to_user_id already exist in the string
            if(empty($check_string)) {
                $chat_string .= $user_chat_string.','.$to_user_id;
            } else {
                $chat_string .= $user_chat_string;
            }
        }

        $c_arr = explode(',',$chat_string);
        sort($c_arr);
        $chat_string = implode(',',$c_arr);
        return $chat_string;
    }

    public static function getChatRequestIds($from_user_id = null, $to_user_id = null) {

        $chat_string = '';
        $user_chat_string = User::where('id', $from_user_id)->value('chat_request_ids');
        if(empty($user_chat_string)) {
            $chat_string = $to_user_id;
        } else {
            $check_string = User::where('id', $from_user_id)->whereRaw('FIND_IN_SET(?,chat_request_ids)', [$to_user_id])->first(); //checking in the string to_user_id already exist in the string
            if(empty($check_string)) {
                $chat_string .= $user_chat_string.','.$to_user_id;
            } else {
                $chat_string .= $user_chat_string;
            }
        }

        $c_arr = explode(',',$chat_string);
        sort($c_arr);
        $chat_string = implode(',',$c_arr);
        return $chat_string;
    }
	
    public static function getChatRequest($c_id = null){ 
        $connect  = ChatRequest::select('id','from_user_id','to_user_id','status')
                            ->with('otherUser')
                            ->where('id',$c_id)
                            ->first();
        return $connect;
    }

    //remove userId from the string (If user remove the user from the match list)
    public static function updateChatRequestString($from_user_id, $to_user_id) {

        /*----------- FROM USER Chat request STRING ------------*/
        $from_user_string = User::where('id', $from_user_id)->value('chat_user_ids');
        $c_string_array   = explode(',', $from_user_string);

        //Remove to_user_id fromUser connect string array
        $remove_toUser_from_c_array = array_diff($c_string_array, array($to_user_id));

        //Updated connect string for fromUserId
        $update_c_string_from_user = implode(',', $remove_toUser_from_c_array);

        $update = User::where('id', $from_user_id)->update(['chat_user_ids' => $update_c_string_from_user]);


        /*----------- TO USER Chat request STRING ------------*/
        $to_user_string    = User::where('id', $to_user_id)->value('chat_user_ids');
        $to_c_string_array = explode(',', $to_user_string);

        //Remove to_user_id fromUser connect string array
        $remove_fromUser_from_c_array = array_diff($to_c_string_array, array($from_user_id));

        //Updated connect string for fromUserId
        $update_c_string_from_user = implode(',', $remove_fromUser_from_c_array);

        $update = User::where('id', $to_user_id)->update(['chat_user_ids' => $update_c_string_from_user]);

    }

    public static function updateChatRequestIds($from_user_id, $to_user_id) {

        /*----------- FROM USER Chat request STRING ------------*/
        $from_user_string = User::where('id', $from_user_id)->value('chat_request_ids');
        $c_string_array   = explode(',', $from_user_string);

        //Remove to_user_id fromUser connect string array
        $remove_toUser_from_c_array = array_diff($c_string_array, array($to_user_id));

        //Updated connect string for fromUserId
        $update_c_string_from_user = implode(',', $remove_toUser_from_c_array);

        $update = User::where('id', $from_user_id)->update(['chat_request_ids' => $update_c_string_from_user]);

    }


}
