@extends('backEnd.layouts.login')
@section('title','ClickChefs: Admin Login')
@section('content')

<!--Header Start from Here-->
<div id="header">
   <div id="head_lt">
      <!--Logo Start from Here-->
      <span class="floatleft"><a href="dashboard.php"><img src="{{ asset('public/images/admin/logo.png') }}" alt="" /></a></span><span class="slogan">administration suite</span>
      <!--Logo end  Here-->
   </div>
   <div id="container">
      @include('backEnd.common.messages')
      <!--Admin logn section Start from Here-->
      <div id="login-box">
         <div class="white-box" style="width:325px; padding-top:60px;">
            <div class="tl">
               <div class="tr">
                  <div class="tm">&nbsp;</div>
               </div>
            </div>
            <div class="ml">
               <div class="mr">
                  <div class="middle">
                     <div class="lb-data">
                        <h1>Administrator Login</h1>
                        <p class="top15 gray12">Please enter a valid username and password to gain access to the administration console.</p>
                        <form method="post" action="{{ url('admin/login') }}" id="login-form">
                           <p class="top30"><span class="login_field">
                              <input type="text" name="user_name" class="inpt" size="38" value="" placeholder="Username">
                              </span>
                           </p>
                           <p class="top15"><span class="login_field">
                              <input type="text" name="password" class="inpt" size="38" value="" placeholder="Password" >
                              </span>
                           </p>
                           <div class="top15">
                              <div class="floatleft top15 gray12"><input type="checkbox" value="checkbox" name="checkbox" class="checkbox">
                                 Remember my login details
                              </div>
                              <div class="floatright">
                                 {{ csrf_field() }}
                                 <div class="black_btn2"><span class="upper"><input type="submit" value="SUBMIT" name=""></span></div>                                 
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
            <div class="bl">
               <div class="br">
                  <div class="bm">&nbsp;</div>
               </div>
            </div>
         </div>
      </div>
      <!--Admin logn section end Here-->
   </div>
   <!--Container end Here-->
</div>
<!--Wrapper End from Here-->

<script>
    $('#login-form').validate({
        rules:{
            user_name:"required",
            password:"required"
        }
    });   
</script>
@endsection