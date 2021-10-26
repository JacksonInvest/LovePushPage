<?php $url = Request::url(); ?> 
<?php echo "url";
	if(str_contains($url, ['admin/users','admin/user/add','admin/user/edit'])) { 
		$a = 'active'; 
	} else{ 
		$a = 'no'; 
	} //die;*/ 
?>

<div class="site-sidebar">
	<div class="custom-scroll custom-scroll-light">
		<ul class="sidebar-menu">
			<li class="menu-title">Main </li>
			<li class="<?php if(str_contains($url, ['admin/dashboard'])) { echo 'active'; } ?>" >
				<a href="{{ url('admin/dashboard') }}" class="waves-effect  waves-light ">
					<span class="s-icon"><i class="fa fa-dashboard"></i></span>
					<span class="s-text">Dashboard</span>
				</a>
			</li>
			
			<li class="menu-title">Members </li>
			<li class="with-sub  <?php if(str_contains($url, ['admin/users','admin/user/add','admin/user/edit/'] ) ) { ?> active1 <?php } ?>" >
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="ti-user"></i></span>
					<span class="s-text">Users</span>
				</a>
				<ul class="<?php if(str_contains($url, ['admin/users','admin/user/add','admin/user/edit/'] ) ) { ?> d-blk <?php } ?>">
					<li class="<?php if(str_contains($url, ['admin/users','admin/user/edit/'] ) ) { ?> active1 <?php } ?> "><a href="{{url('admin/users?type=app')}}">App Users</a></li>
					<li class="<?php if(str_contains($url, ['admin/users','admin/user/edit/'] ) ) { ?> active1 <?php } ?> "><a href="{{url('admin/users?type=web')}}">Website Users</a></li>
					<!-- <li><a href="{{url('admin/user/add')}}">Add New User</a></li> -->
				</ul>
			</li>

			<li class="menu-title">System </li>

			<li class="with-sub  <?php if(str_contains($url, ['admin/postads','admin/postad/edit'] ) ) { ?> active1 <?php } ?>" >
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="fa fa-clipboard"></i></span>
					<span class="s-text">Post Ads</span>
				</a>
				<ul class="<?php if(str_contains($url, ['admin/postads','admin/postad/edit'] ) ) { ?> d-blk <?php } ?>">
					<li class="<?php if(str_contains($url, ['admin/postads','admin/postad/edit/'] ) ) { ?> active1 <?php } ?> "><a href="{{url('admin/postads')}}">Post Ads List</a></li>
					<!-- <li><a href="{{url('admin/school/add')}}">Add New School</a></li> -->
				</ul>
			</li>

			<li class="with-sub  <?php if(str_contains($url, ['admin/posts','admin/posts/edit'] ) ) { ?> active1 <?php } ?>" >
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="fa fa-clipboard"></i></span>
					<span class="s-text">Posts</span>
				</a>
				<ul class="<?php if(str_contains($url, ['admin/posts','admin/posts/edit'] ) ) { ?> d-blk <?php } ?>">
					<li class="<?php if(str_contains($url, ['admin/posts','admin/posts/edit/'] ) ) { ?> active1 <?php } ?> "><a href="{{url('admin/posts')}}">Posts List</a></li>
					<!-- <li><a href="{{url('admin/school/add')}}">Add New School</a></li> -->
				</ul>
			</li>

			<!-- <li class="with-sub  <?php if(str_contains($url, ['admin/plans','admin/plan/edit/'] ) ) { ?> active1 <?php } ?>" >
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="fa fa-paper-plane-o"></i></span>
					<span class="s-text">Subscription Plans</span>
				</a>
				<ul class="<?php if(str_contains($url, ['admin/plans','admin/plan/edit'] ) ) { ?> d-blk <?php } ?>">
					<li class="<?php if(str_contains($url, ['admin/plans','admin/plan/edit'] ) ) { ?> active1 <?php } ?> "><a href="{{url('admin/plans')}}">Subscription Plans List</a></li>
				</ul>
			</li> -->

			<li class="with-sub  <?php if(str_contains($url, ['admin/reported_users','admin/reported_users/edit'] ) ) { ?> active1 <?php } ?>" >
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="fa fa-clipboard"></i></span>
					<span class="s-text">Report</span>
				</a>
				<ul class="<?php if(str_contains($url, ['admin/reported_users','admin/reported_users/edit'] ) ) { ?> d-blk <?php } ?>">
					<li class="<?php if(str_contains($url, ['admin/reported_users','admin/reported_users/edit/'] ) ) { ?> active1 <?php } ?> "><a href="{{url('admin/reported_users')}}">Reported Users</a></li>
					<li class="<?php if(str_contains($url, ['admin/reported_images','admin/reported_images/edit/'] ) ) { ?> active1 <?php } ?> "><a href="{{url('admin/reported_images')}}">Reported Images</a></li>
				</ul>
			</li>

			<li class="with-sub">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="fa fa-question"></i></span>
					<span class="s-text">Faq</span>
				</a>
				<ul>
					<li><a href="{{ url('admin/faqs') }}">Faq's List</a></li>
				</ul>
			</li>

			<li>
				<a href="{{url('admin/deleted_accounts')}}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-bag"></i></span>
					<span class="s-text">Deleted Accounts</span>
				</a>
			</li>
			<!-- 
			<li class="with-sub  <?php if(str_contains($url, ['admin/plans', 'admin/plan/edit/'] ) ) { ?> active1 <?php } ?>" >
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="fa fa-paper-plane-o"></i></span>
					<span class="s-text">Subsciption Plans</span>
				</a>
				<ul class="<?php if(str_contains($url, ['admin/plans'] ) ) { ?> d-blk <?php } ?>">
					<li><a href="{{url('admin/plans')}}">Plans</a></li>
				</ul>
			</li>	

			<li class="with-sub  <?php if(str_contains($url, ['admin/reports', 'admin/report/edit/'] ) ) { ?> active1 <?php } ?>" >
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="fa fa-th-list"></i></span>
					<span class="s-text">User Reports</span>
				</a>
				<ul class="<?php if(str_contains($url, ['admin/reports'] ) ) { ?> d-blk <?php } ?>">
					<li><a href="{{url('admin/reports')}}">Reports</a></li>
				</ul>
			</li>	

			<li class="with-sub <?php if(str_contains($url, ['admin/pages','admin/page/edit/'] ) ) { ?> active1 <?php } ?>">
				<a href="#" class="waves-effect  waves-light">
					<span class="s-caret"><i class="fa fa-angle-down"></i></span>
					<span class="s-icon"><i class="fa fa-file-text-o"></i></span>
					<span class="s-text">Cms Pages</span>
				</a>
				<ul class="<?php if(str_contains($url, ['admin/pages','admin/page/edit/'] ) ) { ?> d-blk <?php } ?>">
					<li><a href="{{url('admin/pages')}}">Cms Page's List</a></li>
				</ul>
			</li> 	-->		 

			<li class="menu-title">Plan Management</li>
			<li>
				<a href="{{url('admin/plan_list')}}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-view-list"></i></span>
					<span class="s-text">Plans</span>
				</a>
			</li>
			<li>
				<a href="{{url('admin/plan_subscriptions')}}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-package"></i></span>
					<span class="s-text">Subscriptions</span>
				</a>
			</li>
	
			<li class="menu-title">Account</li>
			<li>
				<a href="{{url('admin/profile')}}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-user"></i></span>
					<span class="s-text">Account Settings</span>
				</a>
			</li>
			<li>
				<a href="{{url('admin/change-password')}}" class="waves-effect  waves-light">
					<span class="s-icon"><i class="ti-exchange-vertical"></i></span>
					<span class="s-text">Change Password</span>
				</a>
			</li>
			<li class="compact-hide">
				<a href="{{ url('admin/logout') }}">
					<span class="s-icon"><i class="ti-power-off"></i></span>
					<span class="s-text">Logout</span>
                </a>
            </li>
			
		</ul>
	</div>
</div>