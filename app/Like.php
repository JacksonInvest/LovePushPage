<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
// use Illuminate\Foundation\Auth\User as Authenticatable;
use App\User;
class Like extends Model
{

	//sort the like-dislike string in the users table (column name = like_user_ids)
	public static function getLikeDislikeString($from_user_id = null, $to_user_id = null) {

		$like_string = '';
		$user_like_string = User::where('id', $from_user_id)->value('like_user_ids');
		if(empty($user_like_string)) {
			$like_string = $to_user_id;
		} else {
			$check_string = User::where('id', $from_user_id)->whereRaw('FIND_IN_SET(?,like_user_ids)', [$to_user_id])->first(); //checking in the string to_user_id already exist in the string
			if(empty($check_string)) {
				$like_string .= $user_like_string.','.$to_user_id;
			} else {
				$like_string .= $user_like_string;
			}
		}

		$like_arr = explode(',',$like_string);
        sort($like_arr);
        $like_string = implode(',',$like_arr);
        return $like_string;
	}

    public static function getLikeDislikeIds($from_user_id = null, $to_user_id = null) {

        $like_string = '';
        $user_like_string = User::where('id', $from_user_id)->value('like_request_ids');
        if(empty($user_like_string)) {
            $like_string = $to_user_id;
        } else {
            $check_string = User::where('id', $from_user_id)->whereRaw('FIND_IN_SET(?,like_request_ids)', [$to_user_id])->first(); //checking in the string to_user_id already exist in the string
            if(empty($check_string)) {
                $like_string .= $user_like_string.','.$to_user_id;
            } else {
                $like_string .= $user_like_string;
            }
        }

        $like_arr = explode(',',$like_string);
        sort($like_arr);
        $like_string = implode(',',$like_arr);
        return $like_string;
    }

	//remove userId from the string (If user remove the user from the match list)
    public static function updateLikeRequestString($from_user_id, $to_user_id) {

        /*----------- FROM USER LIKE STRING ------------*/
        $from_user_string = User::where('id', $from_user_id)->value('like_user_ids');
        $l_string_array   = explode(',', $from_user_string);

        //Remove to_user_id fromUser LIKE string array
        $remove_toUser_from_l_array = array_diff($l_string_array, array($to_user_id));

        //Updated LIKE string for fromUserId
        $update_l_string_from_user = implode(',', $remove_toUser_from_l_array);

        $update = User::where('id', $from_user_id)->update(['like_user_ids' => $update_l_string_from_user]);


        /*----------- TO USER LIKE STRING ------------*/
        $to_user_string    = User::where('id', $to_user_id)->value('like_user_ids');
        $to_l_string_array = explode(',', $to_user_string);

        //Remove to_user_id fromUser LIKE string array
        $remove_fromUser_from_l_array = array_diff($to_l_string_array, array($from_user_id));

        //Updated LIKE string for fromUserId
        $update_l_string_from_user = implode(',', $remove_fromUser_from_l_array);

        $update = User::where('id', $to_user_id)->update(['connect_user_ids' => $update_l_string_from_user]);

    }

    public static function updateLikeRequestIds($from_user_id, $to_user_id) {

        /*----------- FROM USER LIKE STRING ------------*/
        $from_user_string = User::where('id', $from_user_id)->value('like_request_ids');
        $l_string_array   = explode(',', $from_user_string);

        //Remove to_user_id fromUser LIKE string array
        $remove_toUser_from_l_array = array_diff($l_string_array, array($to_user_id));

        //Updated LIKE string for fromUserId
        $update_l_string_from_user = implode(',', $remove_toUser_from_l_array);

        $update = User::where('id', $from_user_id)->update(['like_request_ids' => $update_l_string_from_user]);

    }
}