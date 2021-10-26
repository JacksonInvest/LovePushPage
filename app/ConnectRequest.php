<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ConnectRequest extends Model
{
	// protected $fillable = [
	// ];

    public function otherUser() {
        return $this->belongsTo('App\User','from_user_id','id')
                    ->select('id','name','email','profile_image','quickblox_id');
    }

    //sort the like-dislike string in the users table (column name = like_user_ids)
    public static function getConnectRequestString($from_user_id = null, $to_user_id = null) {

        $connect_string = '';
        $user_connect_string = User::where('id', $from_user_id)->value('connect_user_ids');
        if(empty($user_connect_string)) {
            $connect_string = $to_user_id;
        } else {
            $check_string = User::where('id', $from_user_id)->whereRaw('FIND_IN_SET(?,connect_user_ids)', [$to_user_id])->first(); //checking in the string to_user_id already exist in the string
            if(empty($check_string)) {
                $connect_string .= $user_connect_string.','.$to_user_id;
            } else {
                $connect_string .= $user_connect_string;
            }
        }

        $connect_arr = explode(',',$connect_string);
        sort($connect_arr);
        $connect_string = implode(',',$connect_arr);
        return $connect_string;
    }

    public static function getConnectRequestIds($from_user_id = null, $to_user_id = null) {

        $connect_string = '';
        $user_connect_string = User::where('id', $from_user_id)->value('connect_request_ids');
        if(empty($user_connect_string)) {
            $connect_string = $to_user_id;
        } else {
            $check_string = User::where('id', $from_user_id)->whereRaw('FIND_IN_SET(?,connect_request_ids)', [$to_user_id])->first(); //checking in the string to_user_id already exist in the string
            if(empty($check_string)) {
                $connect_string .= $user_connect_string.','.$to_user_id;
            } else {
                $connect_string .= $user_connect_string;
            }
        }

        $connect_arr = explode(',',$connect_string);
        sort($connect_arr);
        $connect_string = implode(',',$connect_arr);
        return $connect_string;
    }
	
    public static function getConnectRequest($connect_id = null){ 
        $connect  = ConnectRequest::select('id','from_user_id','to_user_id','status')
                            ->with('otherUser')
                            ->where('id',$connect_id)
                            ->first();
        return $connect;
    }


    //remove userId from the string (If user remove the user from the match list)
    public static function updateConnectRequestString($from_user_id, $to_user_id) {

        /*----------- FROM USER CONNECT STRING ------------*/
        $from_user_string = User::where('id', $from_user_id)->value('connect_user_ids');
        $c_string_array   = explode(',', $from_user_string);

        //Remove to_user_id fromUser connect string array
        $remove_toUser_from_c_array = array_diff($c_string_array, array($to_user_id));

        //Updated connect string for fromUserId
        $update_c_string_from_user = implode(',', $remove_toUser_from_c_array);

        $update = User::where('id', $from_user_id)->update(['connect_user_ids' => $update_c_string_from_user]);


        /*----------- TO USER CONNECT STRING ------------*/
        $to_user_string    = User::where('id', $to_user_id)->value('connect_user_ids');
        $to_c_string_array = explode(',', $to_user_string);

        //Remove to_user_id fromUser connect string array
        $remove_fromUser_from_c_array = array_diff($to_c_string_array, array($from_user_id));

        //Updated connect string for fromUserId
        $update_c_string_from_user = implode(',', $remove_fromUser_from_c_array);

        $update = User::where('id', $to_user_id)->update(['connect_user_ids' => $update_c_string_from_user]);

    }

    public static function updateConnectRequestIds($from_user_id, $to_user_id) {

        /*----------- FROM USER CONNECT STRING ------------*/
        $from_user_string = User::where('id', $from_user_id)->value('connect_request_ids');
        $c_string_array   = explode(',', $from_user_string);

        //Remove to_user_id fromUser connect string array
        $remove_toUser_from_c_array = array_diff($c_string_array, array($to_user_id));

        //Updated connect string for fromUserId
        $update_c_string_from_user = implode(',', $remove_toUser_from_c_array);

        $update = User::where('id', $from_user_id)->update(['connect_request_ids' => $update_c_string_from_user]);

    }

}
