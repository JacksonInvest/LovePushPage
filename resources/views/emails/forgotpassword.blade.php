<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Love Push</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700" rel="stylesheet">
        <style>
            *{margin: 0px; padding: 0px;}
            body{font-family: 'Montserrat', sans-serif; margin: 0; padding: 0; font-size: 18px; color: #555; vertical-align: baseline;}
            table tr td{padding: 15px; text-align: center;}
        </style>
        
        <table cellpadding="0" cellspacing="0" style="width: 750px;max-width:100%; border-radius: 5px 5px 0 0px; overflow: hidden; margin: 30px auto; box-shadow: 0 0 10px 5px rgba(0,0,0,0.05);">
            <tbody>
                <tr>
                    <td style="background-color: #b70016 ; line-height: 1;">
                        <img src="{{ asset('frontEnd/assets/img/foot-logo.png') }}" alt=""/>
                       <!-- <img src="http://dev2.xicom.us/lovepush/public/frontEnd/assets/img/foot-logo.png" alt=""/> -->
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 30px;">
                        <h1 style="line-height: 1; color: #333; font-weight: 400; font-size: 32px;"><span style="font-weight: 700;">Hi, {{ $mailObj->receiver }}</span></h1>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 0;">
                        <p style="color: #545065;font-size:16px;">
                            We have received a request to reset password. If It is not you, then you can simply ignore this email.
                        </p>
                        <p style="color: #545065;font-size:16px;">Click the link below to reset your password:</p>
                    </td>
                </tr>
                <br>
                <tr>
                    <td>
                    <p></p>
                    <a href="{{ $mailObj->reset_link }}" style="height: 43px;
                                                    background: #207ad1;
                                                    border: solid 8px #207ad1;
                                                    font-size: 17px;
                                                    font-weight: 500;
                                                    text-transform: uppercase;
                                                    border-radius: 5px;
                                                    margin-top: 12px;
                                                    color: #fff;
                                                    text-decoration: none;
                                                    cursor: pointer;" target="_blank">Reset Password</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p style="color: #545065;font-size:16px;">
                            Your Love Push team
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
<!--                         <p style="color: #545065;font-size:16px;">
                            Your Love Push team
                        </p>
 -->                    </td>
                </tr>
                <tr>
                    <td style="background-color: #b70016 ; line-height: 1;">
                        <img src="{{ asset('frontEnd/assets/img/foot-logo.png') }}" alt=""/>
                       <!-- <img src="http://dev2.xicom.us/lovepush/public/frontEnd/assets/img/foot-logo.png" alt=""/> -->
                       <p style="color: #fff">LovePush Ltd., St. Domenica Street 36, Victoria 9030 Malta</p>
                    </td>
                </tr>
            </tbody>
        </table>
    </head>
    <body>
    </body>
</html>
