@extends('frontEnd.layouts.master')

@section('styles')
    <!-- additional Css -->
    <style type="text/css">
        label.error {
            font-weight: normal;
            color: red;
            font-size: 12px;
        }
        .alert {
            margin-bottom: 0;
            text-align: center;
        }
        .form-group.custom-input {
            position: relative;
            padding-bottom: 0px;
            display: inline-block;
            width: 100%;
        }
        .custom-input input {
            float: left;
            height: auto;
        }
        .form-group.custom-input label.error {
            bottom: -28px;
            position: absolute;
            left: 13px;
        }
        .custom-input label {
            float: left;
            width: calc(100% - 20px);
            padding-left: 10px;
            font-weight: normal;
            font-size: 12px;
        }
 
        .custom-input label a:hover {
            color: #111;
            text-decoration: none;
        }
        .form-right form#contactus_form .error {
            text-align: left;
            float: left;
            padding-left: 23px;
            margin-top: -29px;
            margin-bottom: 36px;
            width: 100%;
            display: inline-block;
        }
    </style>
@endsection

@section('content')

<!-- banner-->
<section id="page1" class="site-banner">
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
     <img  class="d-block w-100"  src="{{ url('frontEnd/assets/img/bnr-bg.jpg') }}" alt="">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    <div class="item">
     <img  class="d-block w-100"  src="{{ url('frontEnd/assets/img/two.jpg') }}" alt="">
      <div class="carousel-caption">
        ...
      </div>
    </div>
	<div class="item">
     <img  class="d-block w-100"  src="{{ url('frontEnd/assets/img/three.jpg') }}" alt="">
      <div class="carousel-caption">
        ...
      </div>
    </div>
  
  </div>


 
</div>
 
           
    <div class="container" data-aos="fade-up">
        <div class="row">
            <div class="col-md-5 col-sm-6">
                <div class="registration-form ">
                    <div class="panel-heading">
                        <h3 class="panel-title"> {{ trans('messages.website.Become part of the LovePush movement!') }}
                            <span>{{ trans('messages.website.Register now') }}</span>
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="POST" id="registration_form" action="{{ url('/signUp') }}">
                            {{ csrf_field() }}
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12">
                                    <div class="form-group">
                                        <input type="text" name="name" id="first_name" class="form-control input-sm" placeholder="{{ trans('messages.website.Name') }}" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="email" name="email" id="email" class="form-control input-sm" placeholder="{{ trans('messages.website.Email Address') }}" required="">
                            </div>
                            <div class="form-group custom-input">
                                <input type="checkbox" name="terms"  class="">
                                <label>{{ trans('messages.website.I agree') }}<br>
                                    {{ trans('messages.website.The following') }} <a href="{{ url('/privacy-policy.pdf') }}" target="_blank">{{ trans('messages.website.privacy policy') }}</a> {{ trans('messages.website.apply') }}<br>
                                    {{ trans('messages.website.My agreement') }}
                                </label>
                            </div>
                            <!-- <div class="form-group">
                                <input type="text" name="last_name" id="last_name" class="form-control input-sm" placeholder="Phone">
                            </div> -->
                            <!-- <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12">
                                    <div class="form-group">
                                        <input type="password" name="password" id="password" class="form-control input-sm" placeholder="Password" required="">
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12">
                                    <div class="form-group">
                                        <input type="password" name="confirm_password" id="password_confirmation" class="form-control input-sm" placeholder="Confirm Password">
                                    </div>
                                </div>
                            </div> -->
                            <input type="submit" value="{{ trans('messages.website.Submit') }}" class="btn btn-info btn-block">
                            <!-- <div class="dawn-option">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="app-dawn">
                                        <a href="#_"><i><img src="{{ url('frontEnd/assets/img/app1.png') }}" alt="#"></i>Play Store</a>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="app-dawn">
                                        <a href="#_"><i><img src="{{ url('frontEnd/assets/img/app2.png') }}" alt="#"></i>App Store</a>
                                    </div>
                                </div>
                            </div> -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- main -->
<main class="main-content">
    <!--feature-->
    <section id="page2" class="feature">
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-sm-7">
                    <div class="feature-steps" data-aos="fade-up">
                        <h2 >{{ trans('messages.website.Why') }} <span>{{ trans('messages.website.Love') }}</span> {{ trans('messages.website.Push') }} ?</h2>
                        <p>{{ trans('messages.website.We provide you with unlimited possibilities to find your luck and sweeten your life') }}</p>
                        <ul>
                            <li>
                                <i class="check-icon"><img src="{{ url('frontEnd/assets/img/check.png') }}" alt=""></i>{{ trans('messages.website.Personality Test') }}<br>
                                <p>{{ trans('messages.website.Tired of bad dates or boring people') }}<br>{{ trans('messages.website.You will receive suggestions for people who suit your character and have the same interests as you based on our personality test') }}</p>
                            </li>
                            <li>
                                <i class="check-icon"><img src="{{ url('frontEnd/assets/img/check.png') }}" alt=""></i>{{ trans('messages.website.Love Connect Ads') }}<br>
                                <p> {{ trans('messages.website.Are you looking for great love, new friendships, people for daily activities, travel buddies or have other intentions?') }} <br>
								{{ trans('messages.website.You have the possibility to publish Love or Connecting ads in a selected city or country') }}<br>
								{{ trans('messages.website.So you can be sure to meet or get to know the right people in the right place') }}</p>
                            </li>
                            <li>
                                <i class="check-icon"><img src="{{ url('frontEnd/assets/img/check.png') }}" alt=""></i>{{ trans('messages.website.Swipe') }}<br>
                                <p>{{ trans('messages.website.Among other things') }}</p>
                            </li>
                            <li>
                                <i class="check-icon"><img src="{{ url('frontEnd/assets/img/check.png') }}" alt=""></i>{{ trans('messages.website.Around') }}<br>
                                <p>{{ trans('messages.website.You have an overview of the people in your area and can also search for people in another city or country') }}'
								<br>
								With our interactive map, you can find trendy places and activities near you and suggest them to your contacts and friends.</p>
                            </li>
                            <li>
                                <i class="check-icon"><img src="{{ url('frontEnd/assets/img/check.png') }}" alt=""></i>{{ trans('messages.website.Live Streams') }} <br>
                                <p>{{ trans('messages.website.You can start or join a live session and other people can watch and comment') }}</p>
                            </li>
                            <li>
                                <i class="check-icon"><img src="{{ url('frontEnd/assets/img/check.png') }}" alt=""></i>{{ trans('messages.website.Messenger') }}<br>
                                <p>{{ trans('messages.website.Our Messenger enables communication via text and voice messages, as well as real-time voice and video chats') }}'
								<br>
								{{ trans('messages.website.With the integrated Translator, we offer you the possibility to communicate with people all over the world, no matter which language they speak')}}</p>
                            </li>
                            <li>
                                <i class="check-icon"><img src="{{ url('frontEnd/assets/img/check.png') }}" alt=""></i>{{ trans('messages.website.Earn passive income') }}<br>
                                <p>{{ trans('messages.website.LovePush is the first social dating app that lets you build a passive income through our network marketing system') }}'
								<br>
								{{ trans('messages.website.Tell your friends and you will receive 20% direct provision and earn up to 35% provision within 5 levels') }}
								<br>{{ trans('messages.website.Take this chance and benefit from a huge market!') }}</p>
								<p>{{ trans('messages.website.There are no limits on what you can achieve with your life, except the limits you accept in your mind!') }}</p>
                            </li>
                        </ul>
                        <!-- <div class="app-dawn">
                            <a href="#_"><i><img src="{{ url('frontEnd/assets/img/app1.png') }}" alt="#"></i>Play Store</a>
                            <a href="#_"><i><img src="{{ url('frontEnd/assets/img/app2.png') }}" alt="#"></i>App Store</a>
                        </div> -->
                    </div>
                </div>
                <div class="col-md-5 col-sm-5" data-aos="fade-up">
                    <span class="mob-view-img">
                    <img class="mob-feature" src="{{ url('frontEnd/assets/img/mob.png') }}" alt="#">
                    </span>
                </div>
            </div>
        </div>
    </section>
    <!-- app-screen -->
    <section id="page3" class="app-screen">
        <div class="screentitle" data-aos="fade-up">
            <h2>{{ trans('messages.website.App Scr') }}<span>{{ trans('messages.website.ee') }}</span>{{ trans('messages.website.ns') }}</h2>
            <p class="sm-heading">{{ trans('messages.website.Here you can find an overview of screenshots and get a first impression of what to expect in our unique app') }}</p>
        </div>
        <div class="screen-slider">
            <div class="outer">
                <div id="big" class="owl-carousel owl-theme">
                    <div class="item">
                        <img src="{{ url('frontEnd/assets/img/recomd.jpg') }}" alt="#">
                    </div>
                    <div class="item">
                        <img src="{{ url('frontEnd/assets/img/screen3.jpg') }}" alt="#">
                    </div>
                    <div class="item">
                        <img src="{{ url('frontEnd/assets/img/screen2.jpg') }}" alt="#">
                    </div>
					<div class="item">
                        <img src="{{ url('frontEnd/assets/img/watch-live.png') }}" alt="#">
                    </div>
					
					
					
                    <div class="item">
                        <img src="{{ url('frontEnd/assets/img/screen1.jpg') }}" alt="#">
                    </div>
				
                   <div class="item">
                        <img src="{{ url('frontEnd/assets/img/matched.png') }}" alt="#">
                    </div>
					<div class="item">
                        <img src="{{ url('frontEnd/assets/img/screen4.jpg') }}" alt="#">
                    </div>
					
					<div class="item">
                        <img src="{{ url('frontEnd/assets/img/recomd.jpg') }}" alt="#">
                    </div>
                    <div class="item">
                        <img src="{{ url('frontEnd/assets/img/screen3.jpg') }}" alt="#">
                    </div>
                    <div class="item">
                        <img src="{{ url('frontEnd/assets/img/screen2.jpg') }}" alt="#">
                    </div>
					<div class="item">
                        <img src="{{ url('frontEnd/assets/img/watch-live.png') }}" alt="#">
                    </div>				
					
                    <div class="item">
                        <img src="{{ url('frontEnd/assets/img/screen1.jpg') }}" alt="#">
                    </div>
				
                   <div class="item">
                        <img src="{{ url('frontEnd/assets/img/matched.png') }}" alt="#">
                    </div>
					<div class="item">
                        <img src="{{ url('frontEnd/assets/img/screen4.jpg') }}" alt="#">
                    </div>
			
                </div>
                <div id="thumbs" class="owl-carousel owl-theme">
                    <div class="item fix-box">
                        <h1>{{ trans('messages.website.Home') }}</h1>
                    </div>
                    <div class="item fix-box">
                        <h1>{{ trans('messages.website.Recommended Profile') }}</h1>
                    </div>
                    <div class="item fix-box">
                        <h1>{{ trans('messages.website.Messages') }}</h1>
                    </div>
					<div class="item fix-box">
                        <h1>{{ trans('messages.website.Watch Live') }}</h1>
                    </div>
					
					<div class="item fix-box">
                        <h1>{{ trans('messages.website.Home') }}</h1>
                    </div>
                 
                    <div class="item fix-box">
                        <h1>{{ trans('messages.website.Messages') }}</h1>
                    </div>
					 
					<div class="item fix-box">
                        <h1>{{ trans('messages.website.Watch Live') }}</h1>
                    </div>

					<div class="item fix-box">
                        <h1>{{ trans('messages.website.Home') }}</h1>
                    </div>
                    <div class="item fix-box">
                        <h1>{{ trans('messages.website.Recommended Profile') }}</h1>
                    </div>
                    <div class="item fix-box">
                        <h1>{{ trans('messages.website.Messages') }}</h1>
                    </div>
					<div class="item fix-box">
                        <h1>{{ trans('messages.website.Watch Live') }}</h1>
                    </div>
					
					<div class="item fix-box">
                        <h1>{{ trans('messages.website.Home') }}</h1>
                    </div>
                   
                    <div class="item fix-box">
                        <h1>{{ trans('messages.website.Messages') }}</h1>
                    </div>
					 
					<div class="item fix-box">
                        <h1>{{ trans('messages.website.Watch Live') }}</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- conatct-sec -->
    <section id="page4" class="section contact-sec">
        <div class="container">
            <div class="screentitle" data-aos="fade-up">
                <h2 class="sec-heading">{{ trans('messages.website.Contact Us') }}</h2>
                <p class="sm-heading">{{ trans('messages.website.If you have any questions feel free to contact us, we will get back to you as soon as possible!') }}</p>
            </div>
            <div class="row map-sec" data-aos="fade-up">
                <div class="col-md-6 col-sm-6 map">
                    <img src="{{ url('frontEnd/assets/img/map.jpg') }}" alt="">         
                </div>
                <div class="col-md-6 col-sm-6 form-right">
                    <div class=""></div>
                    <form method="POST" action="{{ url('/contactUs') }}" id="contactus_form">
                        {{ csrf_field() }}
                        <input type="email" class="text-box" placeholder="{{ trans('messages.website.Enter your e-Mail') }}" name="c_email">
                        <input type="text" class="text-box" placeholder="{{ trans('messages.website.Subject') }}" name="c_subject">
                        <textarea class="text-box message-box" placeholder="{{ trans('messages.website.Enter Messages') }}" name="c_message"></textarea>
                        <button class="btn blue-btn" type="submit"> {{ trans('messages.website.Send Message') }} </button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</main>
<div id="cookie-msg"><span class="msg"> {{ trans("messages.website.Im glad youre here We use cookies") }} <a href="{{ url('/privacy-policy.pdf') }}" target="_blank">{{ trans('messages.website.privacy policy') }}</a> <a href="javascript:;" class="btn-aceptar" onclick="cookieAccept('yes')">{{ trans('messages.website.Accept Cookies') }}</a></span></div>

@endsection

@section('scripts')
 
    <script>
        var word_array = ['sex','penis','cock','vagina','pussy','dick'];
        $(function(){
            $.validator.addMethod("restricted_word1", function(value,element) {
                return /^((?!sex).)*$/i.test(value);
            }, "Name mustn't contain word sex/SEX!");
            $.validator.addMethod("restricted_word2", function(value,element) {
                return /^((?!penis).)*$/i.test(value);
            }, "Name mustn't contain word penis/PENIS!");
            $.validator.addMethod("restricted_word3", function(value,element) {
                return /^((?!cock).)*$/i.test(value);
            }, "Name mustn't contain word cock/COCK!");
            $.validator.addMethod("restricted_word4", function(value,element) {
                return /^((?!vagina).)*$/i.test(value);
            }, "Name mustn't contain word vagina/VAGINA!");
            $.validator.addMethod("restricted_word5", function(value,element) {
                return /^((?!pussy).)*$/i.test(value);
            }, "Name mustn't contain word pussy/PUSSY!");
            $.validator.addMethod("restricted_word6", function(value,element) {
                return /^((?!dick).)*$/i.test(value);
            }, "Name mustn't contain word dick/DICK!");

            $("#registration_form").validate({
                rules:{
                    name:{
                        required: true,
                        // regex: /^[a-zA-Z'.\s]{2,40}$/
                        restricted_word1: true,
                        restricted_word2: true,
                        restricted_word3: true,
                        restricted_word4: true,
                        restricted_word5: true,
                        restricted_word6: true,
                    },
                    email:{
                        required: true,
                        email: true,
                        remote: "{{ url('/checkEmailExists') }}",
                    },
                    terms:{
                        required: true,
                    },
                    // password : "required",
                    // confirm_password: {
                    //     equalTo : "#password"
                    // }
                },
                messages: {
                    name:{
                        required: "{{ trans('messages.website.This field is required') }}",
                        regex: "{{ trans('messages.website.Invalid Character') }}"
                    },
                    email:{
                        required: "{{ trans('messages.website.This field is required') }}",
                        remote: "{{ trans('messages.website.Email already exists') }}",
                    },
                    terms:{
                        required: "{{ trans('messages.website.This field is required') }}",
                    },
                    // password : "This field is required.",
                    // confirm_password:{
                    //     required: 'This field is required',
                    // },
                },
                submitHandler: function (form) {
                    console.log(1)
                    form.submit();
                }
            })
            return false;  
        });
    </script>

    <script>
        $("#contactus_form").validate({
            rules:{
                c_subject:{
                    required: true,
                },
                c_email:{
                    required: true,
                    email: true,
                    // remote: "{{ url('/checkEmailExists') }}",
                },
                c_message : "required",
            },
            messages: {
                c_subject:{
                    required: "{{ trans('messages.website.This field is required') }}",
                    // regex: "Invalid Character"
                },
                c_email:{
                    required: "{{ trans('messages.website.This field is required') }}",
                    // remote: "Email already exists",
                },
                c_message : "{{ trans('messages.website.This field is required') }}",
            },
            submitHandler: function (form) {
                console.log(1)
                form.submit();
            }
        })   
    </script>

    <script>
        function setCookie(status, value, exdays) {
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
            document.cookie = status + "=" + c_value;
        }

        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for(var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        function checkCookie() {
            var user=getCookie("accepted");
            if (user != "") {
                $('#cookie-msg').hide();
            } else {
                $('#cookie-msg').show();
            }
        }

        function cookieAccept(value) {
            setCookie("accepted",value, 30);
            $('#cookie-msg').hide();
        }
    </script>


 
@endsection