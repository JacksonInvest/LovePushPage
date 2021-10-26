<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="{{url('dist/img/default-usr.png')}}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>{{Auth::user()->name}}</p>
            </div>
        </div>
        <!-- search form -->
        <!-- <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
                </span>
            </div>
        </form> -->
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>
            <li class="@if(Route::currentRouteName() == route('dashboard')) active @endif">
                <a href="{{route('dashboard')}}">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
            </li>
            
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-user" aria-hidden="true"></i>
                    <span>Profile</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="{{route('edit-profile')}}"><i class="fa fa-circle-o"></i> Edit Profile</a></li>
                    <li><a href="{{route('change-password')}}"><i class="fa fa-circle-o"></i> Change Password</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-users" aria-hidden="true"></i>
                    <span>Users</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="{{route('users')}}"><i class="fa fa-circle-o"></i> List</a></li>
                    <!-- <li><a href="pages/charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li> -->
                </ul>
            </li>
            
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-question-circle" aria-hidden="true"></i>
                    <span>Personality Questions</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="{{route('personality-question-list')}}"><i class="fa fa-circle-o"></i>List</a></li>
                    <li><a href="{{route('add-question')}}"><i class="fa fa-circle-o"></i> Add New</a></li>
                </ul>
            </li>

            <li class="@if(Route::currentRouteName() == route('subscription-plan')) active @endif">
                <a href="{{route('subscription-plan')}}">
                <i class="fa fa-money" aria-hidden="true"></i><span>Subscription Plan</span>
                </a>
            </li>

            <!-- <li class="treeview">
                <a href="#">
                <i class="fa fa-share"></i> <span>Multilevel</span>
                <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
                </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                    <li class="treeview">
                        <a href="#"><i class="fa fa-circle-o"></i> Level One
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                        </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                            <li class="treeview">
                                <a href="#"><i class="fa fa-circle-o"></i> Level Two
                                <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                                </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                </ul>
            </li> -->
            <!-- <li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i> <span>Documentation</span></a></li> -->
            <li class="header">LABELS</li>
            <li>
                <a href="{{ url('/admin/logOut') }}"><i class="fa fa-circle-o text-red"></i> <span>Logout</span></a></li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>