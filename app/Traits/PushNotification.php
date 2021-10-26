<?php
namespace App\Traits;
use App\User;
use App\Notification;

trait PushNotification{
    
    public function PushNotify($to_user_id, $from_user_id, $event_id ,$event_type){
       
        $to_user_info   = User::where('id', $to_user_id)
                                ->select('id','name','email','device_token','profile_image','quickblox_id')
                                ->first();

        $from_user_info   = User::where('id', $from_user_id)
                                ->select('id','name','email','device_token','profile_image','quickblox_id')
                                ->first();                                

        if($event_type == 'L'){ //like notification

            if(!empty(@$to_user_info->device_token)) {    
                $t_token = $to_user_info->device_token;
                $t_device_type = $to_user_info->device_type;

                $to_user_data = [
                    'id'    => $to_user_info->id,
                    'name'  => $to_user_info->name,
                    'image' => $to_user_info->profile_image,
                    'email' => $to_user_info->email,
                ];

                $event = 'LIKE_NOTIFICATION';

                $data = [
                    'title'      =>  'Like Notification',
                    'body'       =>  $to_user_data,
                    'event_type' =>  $event,
                ];
                $this->notifyAndroid($t_token,$data);  
            }
        } else if($event_type == 'M'){ //match found notification
            
            //Send notification toUser with fromUser info
            if(!empty(@$to_user_info->device_token)) {    
                $t_token = $to_user_info->device_token;
                $t_device_type = $to_user_info->device_type;

                $from_user_data = [
                    'id'    => $from_user_info->id,
                    'name'  => $from_user_info->name,
                    'image' => $from_user_info->profile_image,
                    'email' => $from_user_info->email,
                    'quickblox_id' => $from_user_info->quickblox_id,
                ];

                $event = 'MATCH_NOTIFICATION';

                $data = [
                    'title'      => 'Match Notification',
                    'body'       => $from_user_data,
                    'event_type' => $event,
                ];
                $this->notifyAndroid($t_token,$data);  
            }

            //Send notification fromUser with touser info
            if(!empty(@$from_user_info->device_token)) {    
                $f_token       = $from_user_info->device_token;
                $f_device_type = $from_user_info->device_type;

                $to_user_data = [
                    'id'    => $to_user_info->id,
                    'name'  => $to_user_info->name,
                    'image' => $to_user_info->profile_image,
                    'email' => $to_user_info->email,
                    'quickblox_id' => $to_user_info->quickblox_id,
                ];

                $event = 'MATCH_NOTIFICATION';

                $data = [
                    'title'      => 'Match Notification',
                    'body'       => $to_user_data,
                    'event_type' => $event,
                ];
                $this->notifyAndroid($f_token,$data);  
            }      
        } else if($event_type == 'C'){ //Send Connect request notification
            
            if(!empty(@$to_user_info->device_token)) {    
                $t_token = $to_user_info->device_token;
                $t_device_type = $to_user_info->device_type;

                $form_user_data = [
                    'id'    => $from_user_info->id,
                    'name'  => $from_user_info->name,
                    'image' => $from_user_info->profile_image,
                    'email' => $from_user_info->email,
                    'quickblox_id' => $from_user_info->quickblox_id,
                    'connect_id' => $event_id   ,
                ];

                $event = 'SEND_CONNECT_REQUEST';

                $data = [
                    'title'      =>  'A new connect request',
                    'body'       =>  $form_user_data,
                    'event_type' =>  $event,
                ];
                $this->notifyAndroid($t_token,$data);  
            }
        } else if($event_type == 'A'){ //Accept connect request notification
            
            if(!empty(@$to_user_info->device_token)) {    
                $t_token = $to_user_info->device_token;
                $t_device_type = $to_user_info->device_type;

                $form_user_data = [
                    'id'    => $from_user_info->id,
                    'name'  => $from_user_info->name,
                    'image' => $from_user_info->profile_image,
                    'email' => $from_user_info->email,
                    'quickblox_id' => $from_user_info->quickblox_id,
                    'connect_id' => $event_id   ,
                ];

                $event = 'ACCEPT_CONNECT_REQUEST';

                $data = [
                    'title'      =>  'Accept the connect request',
                    'body'       =>  $form_user_data,
                    'event_type' =>  $event,
                ];
                $this->notifyAndroid($t_token,$data);  
            }
        } else if($event_type == 'R'){ //Reject connect request notification
            
            if(!empty(@$to_user_info->device_token)) {    
                $t_token = $to_user_info->device_token;
                $t_device_type = $to_user_info->device_type;

                $form_user_data = [
                    'id'    => $from_user_info->id,
                    'name'  => $from_user_info->name,
                    'image' => $from_user_info->profile_image,
                    'email' => $from_user_info->email,
                    'quickblox_id' => $from_user_info->quickblox_id,
                    'connect_id' => $event_id   ,
                ];

                $event = 'REJECT_CONNECT_REQUEST';

                $data = [
                    'title'      =>  'Reject the connect request',
                    'body'       =>  $form_user_data,
                    'event_type' =>  $event,
                ];
                $this->notifyAndroid($t_token,$data);  
            }
        } else if($event_type == 'S_M_R'){ //Send Chat messaging request notification
            
            if(!empty(@$to_user_info->device_token)) {    
                $t_token = $to_user_info->device_token;
                $t_device_type = $to_user_info->device_type;

                $form_user_data = [
                    'id'    => $from_user_info->id,
                    'name'  => $from_user_info->name,
                    'image' => $from_user_info->profile_image,
                    'email' => $from_user_info->email,
                    'quickblox_id' => $from_user_info->quickblox_id,
                    'connect_id' => $event_id   ,
                ];

                $event = 'SEND_CHAT_REQUEST';

                $data = [
                    'title'      =>  'A new chat request',
                    'body'       =>  $form_user_data,
                    'event_type' =>  $event,
                ];
                $this->notifyAndroid($t_token,$data);  
            }
        } else if($event_type == 'A_M_R'){ //Accept chat messaging request notification
            
            if(!empty(@$to_user_info->device_token)) {    
                $t_token = $to_user_info->device_token;
                $t_device_type = $to_user_info->device_type;

                $form_user_data = [
                    'id'    => $from_user_info->id,
                    'name'  => $from_user_info->name,
                    'image' => $from_user_info->profile_image,
                    'email' => $from_user_info->email,
                    'quickblox_id' => $from_user_info->quickblox_id,
                    'connect_id' => $event_id   ,
                ];

                $event = 'ACCEPT_CHAT_REQUEST';

                $data = [
                    'title'      =>  'Accept the chat request',
                    'body'       =>  $form_user_data,
                    'event_type' =>  $event,
                ];
                $this->notifyAndroid($t_token,$data);  
            }
        } else if($event_type == 'R_M_R'){ //Reject chat messaging request notification
            
            if(!empty(@$to_user_info->device_token)) {    
                $t_token = $to_user_info->device_token;
                $t_device_type = $to_user_info->device_type;

                $form_user_data = [
                    'id'    => $from_user_info->id,
                    'name'  => $from_user_info->name,
                    'image' => $from_user_info->profile_image,
                    'email' => $from_user_info->email,
                    'quickblox_id' => $from_user_info->quickblox_id,
                    'connect_id' => $event_id   ,
                ];

                $event = 'REJECT_CHAT_REQUEST';

                $data = [
                    'title'      =>  'Reject the chat request',
                    'body'       =>  $form_user_data,
                    'event_type' =>  $event,
                ];
                $this->notifyAndroid($t_token,$data);  
            }
        }  else{
            return false;
        }

        // return response()->json(['resp'=> true]);   
    }


    public function notifyAndroid($device_token, $message) { //For Android and IOS both
        
        $url = 'https://fcm.googleapis.com/fcm/send';
        /*$msg = array(
            'registration_ids'  =>  $device_token,
            'data'              =>  $message,
        );*/
        $msg = array(
            'to'            =>  $device_token,
            // 'notification'  =>  $message,
            'data'          =>  $message
        );
        // prx($message); die;  

        $headers = array(
            'Authorization: key=' . FCM_API_KEY,
            'Content-Type: application/json'
        );
        // Open connection
        $ch = curl_init();

        // Set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // Disabling SSL Certificate support temporarly
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($msg));

        // Execute post
        $result = curl_exec($ch);
        if ($result === FALSE) {
            //die('Curl failed: ' . curl_error($ch));
        }
        // Close connection
        curl_close($ch);
        //echo '<pre>'; print_r($result);die;
        return  $result;
    }

    // public function notifyIos($device_token, $data){
    //     // return false;    

    //     // Put your device token here (without spaces):
    //     $deviceToken = $device_token;
    //     // Put your private key's passphrase here:
    //     $passphrase = "";
    //     // Put your alert message here:
    //     $message = "Message";

    //     $ctx = stream_context_create();
    //     stream_context_set_option($ctx, 'ssl', 'local_cert', '1'.PEM_FILE_PATH);
    //     stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);

    //     // Open a connection to the APNS server
    //     $fp = stream_socket_client(IOS_APNS_SERVER, $err, $errstr, 60, STREAM_CLIENT_CONNECT | STREAM_CLIENT_PERSISTENT, $ctx);
    //     // $fp = stream_socket_client('ssl://gateway.push.apple.com:2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT | STREAM_CLIENT_PERSISTENT, $ctx);
    //     //ssl://gateway.sandbox.push.apple.com:2195
    //     //ssl://gateway.push.apple.com:2195
    //     // $fp = stream_socket_client('ssl://gateway.push.apple.com:2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT | STREAM_CLIENT_PERSISTENT, $ctx);
    //     //api.sandbox.push.apple.com:443
        
    //     if (!$fp) {
    //         //exit("Failed to connect: $err $errstr" . PHP_EOL);
    //         return false;
    //     }
    //     //echo 'Connected to APNS' . PHP_EOL;

    //     // Create the payload body
    //     $body['aps'] = array( 
    //         'alert' => $data,
    //         'sound' => 'default'
    //     );

    //     /*$body['aps'] = array( 
    //         'alert' => array(
    //             'title' => 'Whabaam',
    //             'event_type' => 'FRIEND_REQ',
    //             'body'  => 'You have a new request',
    //          ),
    //         'sound' => 'default'
    //     );*/
    //     //Note: 'event_type' => 'FRIEND_REQ', //'CLOSE_CONTACT'

    //     // Encode the payload as JSON
    //     $payload = json_encode($body);
    //     // Build the binary notification
    //     $msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;
    //     //pr($deviceToken); 
    //     // Send it to the server
    //     $result = fwrite($fp, $msg, strlen($msg));
    //     fclose($fp);
    //      // echo '<pre>'; print_r($result); //die;
        
    //     if (!$result) {
    //          // echo 'Message not delivered' . PHP_EOL;
    //         return true;
    //     } else {
    //          // echo 'Message successfully delivered' . PHP_EOL;
    //         return false;
    //     }

    //     // Close the connection to the server
    //     //DIE;
    // }
}