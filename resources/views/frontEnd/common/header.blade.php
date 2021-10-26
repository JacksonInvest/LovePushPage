 <!-- Header -->
<header class="main-head">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3">
                <a class="site-logo" href="{{ url('/') }}"><img src="{{ url('frontEnd/assets/img/logo.png') }}"></a>
            </div>
            <div class="col-md-9 col-sm-9">
                <div class="navi">
                    <nav class="navbar navbar-default">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#_" data-scroll="page1">{{ trans('messages.website.Home') }}</a></li>
                                <!-- <li><a href="#_" data-scroll="#page2">{{ trans('messages.website.Why Love push') }}</a></li> -->
                                <li><a href="#_" data-scroll="page3">{{ trans('messages.website.App screenshots') }}</a></li>
                                <!-- <li><a href="#_" data-scroll="#page4">{{ trans('messages.website.Contact Us') }}</a></li> -->
                               <!--  <li class="down-pdf"><a href="#_">Download PDF </a></li> -->
                               <li><a href="{{ url('/advisor') }}" target="_blank">{{ trans('messages.website.Advisor') }} </a></li>
							    <li><a href="{{ url('/official-partners') }}" target="_blank">{{ trans('messages.website.Official Partner') }} </a></li>
							    <li>
                                    <select class="selectpicker" data-width="fit" name="locale" id="lang_select">
                                        <option value="en" <?php if(Config::get('app.locale') == "en") echo "selected"; ?> data-content='<span class="flag-icon flag-icon-us"></span> English'>English</option>
                                        <option value="de" <?php if(Config::get('app.locale') == "de") echo "selected"; ?> data-content='<span class="flag-icon flag-icon-mx"></span> German'>German</option>
                                    </select>
                                </li>
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>

