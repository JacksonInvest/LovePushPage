<!-- footer -->
<section class="section footer">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="subscription">
                    <div class="subscrbe-box" data-aos="fade-up">
                        <input type="text" type="" value="" placeholder="{{ trans('messages.website.Enter your e-Mail to Subscribe') }}">
                        <button type="btn" class="btn bt-default">{{ trans('messages.website.Subscribe') }}</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="foot-bottom" data-aos="fade-up">
            <div class="row">
                <div class="col-sm-6 col-md-4 hidden-xs">
                    <div class="foot-left-sec">
                        <a class="foot logo"><img src="{{ url('frontEnd/assets/img/foot-logo.png') }}" alt="#"></a><br>
                        <p class="">© {{ date('Y') }} {{ trans('messages.website.LovePush All Rights Reserved') }} </p>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 foot">
                    <div class="foot-links">
						<h2>{{ trans('messages.website.Company') }} </h2>
                        <ul>
                            <li><a href="{{ url('/AppInfoLovePush(1).pdf') }}" target="_blank">{{ trans('messages.website.App Information') }}</a></li>
                            <li><a href="{{ url('/AffiliateInfo(1).pdf') }}" target="_blank">{{ trans('messages.website.Affiliate Information') }}</a></li>
                            <li><a href="{{ url('/official-partners') }}" target="_blank">{{ trans('messages.website.Official Partner') }}</a></li>
                            <li><a href="#_">{{ trans('messages.website.Support') }}</a></li>
                        </ul>
                    </div>
                </div>
				<div class="col-sm-6 col-md-3 foot">
                    <div class="foot-links">
						<h2>{{ trans('messages.website.Legacy') }} </h2>
                        <ul>
                            <li><a href="{{ url('/ALLINONE-T&C-LovePush.pdf') }}" target="_blank">{{ trans('messages.website.Terms & Conditions') }}</a></li>
                            <li><a href="{{ url('/privacy-policy.pdf') }}" target="_blank">{{ trans('messages.website.Privacy Policy') }}</a></li>
                            <li><a href="{{ url('/ImpressumEnglish(1).pdf') }}" target="_blank">{{ trans('messages.website.Impressum') }}</a></li>
                        </ul>
                    </div>
                </div>
				<div class="col-sm-6 col-md-2 social-foot">
                    <div class="foot-links">
						<h2>{{ trans('messages.website.Connect With') }} </h2>
                        <ul class="social-icon">
                            <li><a href="https://www.facebook.com/Love-Push-369410110501230" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <!-- <li><a href="#_"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#_"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#_"><i class="fa fa-pinterest"></i></a></li> -->
                            <li><a href="https://www.youtube.com/channel/UCoj0MygRQfXMgvaPYFrKGww" target="_blank" title="You Tube"><i class="fa fa-youtube"></i></a></li>
                            <li><a href="https://www.instagram.com/lovepush_app/" target="_blank" title="Instagram"><i class="fa fa-instagram"></i></a></li>
                        </ul>
						
                    </div>
                </div>
				 <div class="col-sm-6 col-md-4 visible-xs">
                    <div class="foot-left-sec">
                        <a class="foot logo"><img src="{{ url('frontEnd/assets/img/foot-logo.png') }}" alt="#"></a><br>
                        <p class="">© {{ date('Y') }} {{ trans('messages.website.LovePush All Rights Reserved') }} </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>