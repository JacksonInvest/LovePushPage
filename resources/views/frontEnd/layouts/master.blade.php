<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Title -->
        <title>{{ PROJECT_NAME }}</title>
		<link rel="icon" type="image/png" sizes="32x32" href="frontEnd/assets/img/favicon-32x32.png">
        <link href="{{ url('frontEnd/assets/css/bootstrap.min.css') }}" rel="stylesheet">
        <link href="{{ url('frontEnd/assets/css/owl.carousel.min.css') }}" rel="stylesheet">
        <link href="{{ url('frontEnd/assets/css/aos.css') }}" rel="stylesheet">
        <link href="{{ url('frontEnd/assets/css/slick.css') }}" rel="stylesheet">
        <link href="{{ url('frontEnd/assets/css/style.css') }}" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        @yield('styles')
    </head>
    <body class="fixed-sidebar fixed-header content-appear skin-default" onload="checkCookie()">
        <div class="wrapper">
            <!-- Preloader -->
            <div class="preloader"></div>

            <!-- Sidebar -->
            <div class="site-overlay"></div>

            @include('frontEnd.common.header')

            <div class="site-content">
                @include('frontEnd.include.notify')
                @yield('content')
                @include('frontEnd.common.footer')
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript"  src="{{ url('frontEnd/assets/js/jquery.validate.js')}}"></script>
        <script src="{{ url('frontEnd/assets/js/bootstrap.min.js') }}"></script>
        <script src="{{ url('frontEnd/assets/js/owl.carousel.min.js') }}"></script>
        <script src="{{ url('frontEnd/assets/js/aos.js') }}"></script>
        <script src="{{ url('frontEnd/assets/js/smartScroll.js') }}"></script>
        <script src="{{ url('frontEnd/assets/js/slick.min.js') }}"></script>
        <script>
            AOS.init({
              easing: 'ease-in-out-sine'
            });
        </script>
        <script>
            $(function(){
              $('.slick-arrow').click(function(){
                  $('.caption-box').removeClass('active');
                  $(this).addClass('active');
              });
            });
        </script>

        <script>
          $(document).ready(function(){
            $('#lang_select').on('change', function () {
              var url = $(this).val(); // get selected value
              // alert(url);
              if (url == "en") { // require a URL
                window.location = "{{ url('locale/en') }}"; // redirect
              }
              else if(url == "de")
              {
                window.location = "{{ url('locale/de') }}"; // redirect
              }
              return false;
            });
          }); 
        </script>
        <script>
            jQuery(document).ready(function($) {
              $('.destination-slider.owl-carousel').owlCarousel({
                items: 5,
              autoplay: true,
              dots: true,
              pagination: true,
              autoplayTimeout: 5000,
                loop: true,
                margin: 30,
                nav: true,    
                responsive:{
                    0:{
                        items:1,
                  dots: false,
                    margin: 10
                    },
                    600:{
                        items:3,
                    },
                    1000:{
                        items:5,
                    }
                }
              });  
            });
        </script>
        <script>
            (function ($) {
                "use strict";
                // all parameters are optional
                smartScroll.init({
                    speed: 700, // default 500
                    addActive: true, // default true
                    activeClass: "active", // default active
                    offset: 105 // default 100
                }, function () {
                    console.log("callback");
                });
                if (screen.width < 991) {
            smartScroll.init({
                    offset: 94 // default 100
                }, function () {
                    console.log("callback");
                });
            }
            })(jQuery);
        </script>
        <script>
            $(document).on('ready', function() {
            $(".center").slick({
                 dots: false,
                 infinite: true,
                 centerMode: false,
                 slidesToShow: 5,
                 slidesToScroll: 1,
                 autoplay:false,
                 autoplayTimeout:5000,
                 autoplayHoverPause:false,
               });
             });
        </script>
        <script>
            $(document).ready(function() {
            var bigimage = $("#big");
            var thumbs = $("#thumbs");
            //var totalslides = 10;
            var syncedSecondary = true;
            
            bigimage
              .owlCarousel({
              items: 5,
              slideSpeed: 2000,
              nav: true,
              autoplay: true,
              dots: false,
              loop: true,
              responsiveRefreshRate: 200,
             
              responsive : {
                  320 : {items: 1,},
                  480 : {items: 2,margin: 10,},
                  768 : {items: 3,margin: 20,},
                  992 : {items: 4,},
                  1200 : {items: 5,},
                  
              }
            
             
            })
            
              .on("changed.owl.carousel", syncPosition);
            
            thumbs
              .on("initialized.owl.carousel", function() {
              thumbs
                .find(".owl-item")
                .eq(0)
                .addClass("current");
            })
              .owlCarousel({
              items: 1,
              dots: true,
              nav: true,
              navText: [
                '<i class="fa fa-angle-left" aria-hidden="true"></i>',
                '<i class="fa fa-angle-right" aria-hidden="true"></i>'
              ],
              smartSpeed: 200,
              slideSpeed: 500,
              slideBy: 4,
              responsiveRefreshRate: 100
            })
              .on("changed.owl.carousel", syncPosition2);
            
            function syncPosition(el) {
              //if loop is set to false, then you have to uncomment the next line
              //var current = el.item.index;
            
              //to disable loop, comment this block
              var count = el.item.count - 1;
              var current = Math.round(el.item.index - el.item.count / 2 - 0.5);
            
              if (current < 0) {
                current = count;
              }
              if (current > count) {
                current = 0;
              }
              //to this
              thumbs
                .find(".owl-item")
                .removeClass("current")
                .eq(current)
                .addClass("current");
              var onscreen = thumbs.find(".owl-item.active").length - 1;
              var start = thumbs
              .find(".owl-item.active")
              .first()
              .index();
              var end = thumbs
              .find(".owl-item.active")
              .last()
              .index();
            
              if (current > end) {
                thumbs.data("owl.carousel").to(current, 100, true);
              }
              if (current < start) {
                thumbs.data("owl.carousel").to(current - onscreen, 100, true);
              }
            }
            
            function syncPosition2(el) {
              if (syncedSecondary) {
                var number = el.item.index;
                bigimage.data("owl.carousel").to(number, 100, true);
              }
            }
            
            thumbs.on("click", ".owl-item", function(e) {
              e.preventDefault();
              var number = $(this).index();
              bigimage.data("owl.carousel").to(number, 300, true);
            });
            });
        </script> 
        @yield('scripts')
    </body>
</html>