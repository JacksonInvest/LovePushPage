@extends('frontEnd.layouts.master')

@section('styles')
    <!-- additional Css -->
    <style type="text/css">
    	header {
	    display: none;
	}
	 header.advisor-header {
      display: block;
  }

	
	h6 {
	    font-size: 16px;
	}
	.advisor-page.feature h2 {
    line-height: 1;
    margin-bottom: 25px;
    text-transform: uppercase;
}

section.feature.advisor-page {
    padding-left: 15px;
    padding-right: 15px;
    padding-top: 40px;
}
section.feature-advisor {
    padding: 50px 0;
}
section#page2, section#page4 {
    background-color: #f5f3f3;
}
    </style>
@endsection

@section('content')


<header class="main-head advisor-header">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3">
                <a class="site-logo" href="{{ url('/') }}"><img src="{{ url('frontEnd/assets/img/logo.png') }}"></a>
            </div>
            <div class="col-md-9 col-sm-9">
                <div class="navi ">
                    <nav class="navbar navbar-default">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#_" data-scroll="page1">Basics</a></li>
                                <li><a href="#_" data-scroll="#page2">Friendship</a></li>
                                <li><a href="#_" data-scroll="page3">Love</a></li>
                                <li><a href="#_" data-scroll="page4">Relationship</a></li>
                                <li><a href="#_" data-scroll="page5">Split Up</a></li>
                       
                            <!--     <li>
                                    <select class="selectpicker" data-width="fit" name="locale" id="lang_select">
                                        <option value="en" <?php if(Config::get('app.locale') == "en") echo "selected"; ?> data-content='<span class="flag-icon flag-icon-us"></span> English'>English</option>
                                        <option value="de" <?php if(Config::get('app.locale') == "de") echo "selected"; ?> data-content='<span class="flag-icon flag-icon-mx"></span> German'>German</option>
                                    </select>
                                </li> -->
                            </ul>
                        </div>
                        <!-- /.navbar-collapse -->
                    </nav>
                </div>
            </div>
        </div>
    </div>
</header>


<main class="main-content advisor-page">
  <section id="page1" class="feature-advisor">
    <div class="container">
        <div class="row">
          <div class="col-12">
              <h2>Bas<span>ics</span></h2>
              <p>1.1 Why to meet new people?<br>
             People are everything. They cause everything to occur. They inspire us, they bring their blessings by sharing their insight, and together, we share unforgettable moments. 
              We face a daily reality such that to breath life into your thoughts you have to concentrate on your quality and delegate the rest to other people. 
              There are many guys in this world there’s gotta be someone out there who can help you overcome your challenges. 
              For each problem you have, there's an answer. 
              Be that as it may, to make it, you need the people. 
              The truth is, your resources and potentials are limited to your network. 
              But there’s a way to expand your circle and reach new possibilities.
              You should constantly meet new individuals. 
              Simple right?</p>

              <p>1.2 What is the basis for a happy relationship?<br>
              The basis for a happy relationship is trust. Trusting someone and being trusted avoid conflict and when there’s no conflict, harmony arises. If we share our life with someone it is imperative to work on a good communication. If we don’t manage to understand each other and speak the “same language” we won’t be able to sort problems out. Be open to your partner, listen to her/him, make sure you are tuned and then have fun! Spend time together and enjoy every moment of it. Having a happy relationship only depends on your dedication to it and to your partner.</p>

              <p>1.3 How to find new people, dates or flirts?<br>
              The best way to meet new people is in real life. Sometimes we are too shy to approach someone we like or ask for a phone number but what is the worst that can happen? Getting a “no”? A “no” you already have if you 
              don’t try, so be wild and risk it - you can always get lucky. 
              If you don’t feel comfortable with this kind of “method” but you feel you are unable to connect with people in real life due lack of time, join our online dating LovePush community and get connected to people that attract you and have the same interests you do! It’s easy, fast and free. What are you waiting for? </p> 
          
          </div>
        </div>
    </div>
    </section>


     <section id="page2" class="feature-advisor">
    <div class="container">
        <div class="row">
          <div class="col-12">
              <h2>FRIEND<span>SHIP</span></h2>
              <p>2.1 How to maintain a long-term friendship?<br>
              A long-term friendship has no duties or obligations so, even if you don’t speak with your best friend for one month, the next time you get the chance to do it should feel as if you haven’t spoken to each other in 2 days, except for the fact that you will have too much to talk about. Anyway, it is always nice to give attention to the people we care about and love. If you are away, travelling or just busy, if a friend comes to your mind, call, send a pic or a joke, you will make this person happy and feeling special.</p>

              <p>2.2 How do I tell a good friend that she/he hurt my feelings?<br>
              The best is always to tell the other that a certain situation or something said made you sad. If it’s a real friend you will be understood and most probably you will get an apology. If the communication fails, give some space and time to both of you. Let things go and don’t give too much importance, just analyze the role your friend has in your life and readjust your relation with this person.</p>

              <p>2.3 How do I leave from a toxic friendship relation?<br>
              Leaving a person that we considered a friend is not an easy task. If you want to do it, you must have really strong reasons and surely toxicity is something we don’t want in our lives. Open your heart, be honest about your feelings and tell the person you feel that having her/him around is making you uncomfortable, since some negative feelings arise when you are together. Even if the truth hurts, it’s always better to make things clear. Be compassionate, gentle and nice when speaking and don’t give her/him a hard time. </p> 

              <p>2.4 How do I manage jealousy when belonging to a group of friends?<br>
              Every person has a different role in a group of friends. Because people have different personalities they will be more or less popular in the group. If your best friend - that is also part of your group - is more popular than you, don’t be too upset, you have your own space amongst those people. It’s always better to keep the ego low and bring good energy and love to the group. Friendship dynamics are not about the one who speaks louder or has more stories to tell but about the harmony one brings to the group. </p>
          
          </div>
        </div>
    </div>
    </section>

         <section id="page3" class="feature-advisor">
    <div class="container">
        <div class="row">
          <div class="col-12">
              <h2>LO<span>VE</span></h2>
              <p>3.1 How do I behave on a first date?<br>
              A first date is always a bit challenging, you never know what you are going to get. Regardless of the person’s appearance – if in the pictures she/he looked way cuter, don’t freak out, this is just the beginning! – be nice and polite. Soon you will know if you got a “catch” or a “ditch”. If after some time – everyone has a different timing, but we would say that after half an hour, you will probably know something! - you feel you like this person, keep up the good conversation and invite her/him to do something. If the person is not really your type, just say it kindly and leave.</p>

              <p>3.2 How do I know if she/he is the one?<br>
              Finding “the one” is something that many of us are looking for. The one can be anyone you are in love with, you want to share your life with and maybe she/he is not exactly what you imagined but try to see it from a different perspective. <br>
              If this person appeared in your life, there must have been a reason. <br>
              Give her/him a chance, share your dreams and goals and see what you get from it. If this person seems to be totally different from you - don’t forget that opposites also attract each other and there’s always something to learn with someone new.</p>

              <p>3.3 How do I get into relationships?<br>
              A relationship will come to your life at the right moment. 
              If having a partner is something you really desire, it will happen. 
              Don’t put a lot of your energy or waste too much time looking for it. 
              Enjoy being single, pursue your goals and think about what you want to achieve in life. <br>
              This is a good time to have fun with your friends and enjoy the freedom of doing whatever you want. We shouldn’t need someone just to make us feel happy, by ourselves or not, there’s always a way of living in peace by accepting things as they are. When the time comes you will “stumble” into someone interesting. 
              Just be patient and don’t think too much about having a partner. </p>
          
          </div>
        </div>
    </div>
    </section>


             <section id="page4" class="feature-advisor">
    <div class="container">
        <div class="row">
          <div class="col-12">
              <h2>RELATION<span>SHIPS</span></h2>
              <p>4.1 How to maintain a long-term relationship?<br>
                To maintain a long-term relationship you need to have a strong bond with your partner. The important thing is that you respect and know each other really well. The most common problem on long-term relationships is monotony; feeling like there’s no magic and that everyday is a repetition will tear you apart. Before everything starts to get into this direction, make sure you try everything to keep your relationship passionate and fresh. <br>
                A dynamic relationship where partners share different kinds of experiences and skills together will bring pleasure, growth and happiness!</p>

              <p>4.2 How do I make my partner happy?<br>
              Making a partner (and others in general!) happy should be a goal of our relationships. Small acts make the whole difference and pleasing someone will make us happy. Surprise her/him on a Sunday morning with a nice breakfast, pick up a flower or write a small “I love you” in the sand, be creative! Make her/him compliments and most important of all be transparent and talk about your feelings. The basis of a good relationship is always a good communication.</p>

              <p>4.3 How to deal with conflicts?<br>
              Conflicts are part of a relationship, we all know that and there’s no drama. Most conflicts start from bad communication, so be sure to make everything clear from your side when entering a discussion. Don’t raise your voice, don’t act aggressively and be as much comprehensive as you can. If your partner doesn’t seem to be in the mood to reach an understanding, just leave and give her/him some time. When you feel everything is more serene, approach the argument topic again and try to make peace. Usually conflicts aren’t more than misunderstandings. </p>
              <p>4.4 How to handle jealousy?<br>
              Jealousy is one of the most common reasons why people get into conflicts. “I saw you looking at her/him!”. Let’s be honest, we all have eyes and inevitably look at people we find attractive, all of us, not only your girlfriend or boyfriend. Why is someone good looking a problem? If you feel happy and you trust your partner, there’s no reason for that. Laugh about this kind of situation instead of getting angry, a beautiful person should be appreciated and not a reason to start a fight. If there’s something that is making you really uncomfortable and your jealousy actually has a reason to be, speak about this with your partner and act together.</p>
              <p>4.5 I don’t have any more feelings for my partner, what should I do?<br>
              Loosing love feelings for someone is something that can easily happen. Everything comes to an end and so does love in a relationship. Sometimes we try too hard to keep alive feelings that are no longer real. If you feel you don’t love your partner anymore - and you are sure of it - you must have the talk. Ask her/him some time on your own, so you can be able to see things from a different perspective. (Maybe you will miss this person or maybe not but either ways you will have to go back and leave everything clear). Never stay with a person for pity, your happiness comes first and “keeping” a relationship just because somehow is “easier”, will never work. </p>
          
          </div>
        </div>
    </div>
    </section>


    <section id="page5" class="feature-advisor">
    <div class="container">
        <div class="row">
          <div class="col-12">
              <h2>SPLIT <span>UP</span></h2>
              <p>5.1 How do I heal from a broken heart?<br>
              The only way to heal from a broken heart is by giving yourself time. Time heals everything, even a broken heart. The first thing is to accept that we are suffering and remember ourselves that everything is temporary, so all the unbearable pain we are feeling will vanish slowly. Suffering is inevitable and it’s part of the healing process. If you are not supposed to be with this person because she/he doesn’t love you anymore or your relationship doesn’t really work, embrace it and move on. You deserve to be loved and the right person is out there.</p>

              <p>5.2 How can I distract myself from suffering?<br>
              After embracing suffering you should make it as painless as possible and distractions are a good way of keeping your mind busy. The first ones you can rely on are your friends. No one wants to be a burden but sometimes we need some human support and friends are the ones we should look for. Go out and dance, take a nice walk on a pretty place, eat something you like, give yourself a treat! Taking good care of ourselves when we are feeling down is very important and a big push to help us follow our dreams.</p>

              <p>5.3 How do I find trust in people again?<br>
              You should never loose total trust in people. If you were betrayed once or more, it is difficult to trust a partner again. First important thing you should do is to be honest about your feelings. Tell her/him that you have trusting issues because of your past and ask for some patience. She/he will be for sure sympathetic and do the best to help on building trust between both. </p>
              
          
          </div>
        </div>
    </div>
    </section>


  </main>
   <script>
      
               AOS.init({
    disable: function() {
      var maxWidth = 767;
      return window.innerWidth < maxWidth;
    }
  });
        </script>



@endsection

