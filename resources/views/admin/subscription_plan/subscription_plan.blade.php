@extends('admin.master')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Subscription Plan
            <small>Control panel</small>
        </h1>
        <!-- <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Edit Profile</li>
            </ol> -->
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="col-sm-12">
                            @if ($message = Session::get('success'))
                            <div class="alert alert-success alert-block">
                                <button type="button" class="close" data-dismiss="alert">×</button> 
                                <strong>{{ $message }}</strong>
                            </div>
                            @endif
                            <form role="form" action="{{route('edit-profile')}}" method="post">
                                @csrf
                                <div class="table-responsive-sm sub-table">
                                    <table class="table table-striped subscription-table">
                                        <thead>
                                            <tr>
                                                <th scope="col"> </th>
                                                <th scope="col"> Free </th>
                                                <th scope="col"> Premium <span class="pricing">4,90</span> </th>
                                                <th scope="col"> V.I.P <span class="pricing">9,90</span> </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">Messages to unknown users (per day)</th>
                                                <td>
                                                    <span class="visible-xs"> Messages to unknown users </span> 
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" class="inp_show" name="free_message_to_unknown_users_r" value="1" checked /> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" class="inp_show" name="free_message_to_unknown_users_r" value="2" /> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1"  name="free_message_to_unknown_users" id="free_message_to_unknown_users"/> 
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> Messages to unknown users </span> 
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_message_to_unknown_users" class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_message_to_unknown_users" class="inp_show"  value="2"/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="5" /> 
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> Messages to unknown users </span> 
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_message_to_unknown_users" class="inp_show"  value="1"/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_message_to_unknown_users" checked="checked" class="inp_show"  value="2"/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control hidden" value="1 / day" /> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Voice memo and call</th>
                                                <td> 
                                                    <span class="visible-xs"> Voice memo and call </span> 
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" class="inp_show" name="free_voice_memo_and_call" value="1" checked /> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" class="inp_show" name="free_voice_memo_and_call" value="2" /> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1"  name="free_message_to_unknown_users" id="free_message_to_unknown_users"/> 
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> Voice memo and call </span> 
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" class="inp_show" name="premium_voice_memo_and_call" value="1" checked /> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" class="inp_show" name="premium_voice_memo_and_call" value="2" /> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1"  name="free_message_to_unknown_users" id="free_message_to_unknown_users"/> 
                                                </td>
                                                <td> 
                                                    <span class="visible-xs"> Voice memo and call </span> 
                                                     <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" class="inp_show" name="vip_voice_memo_and_call" value="1" checked /> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" class="inp_show" name="vip_voice_memo_and_call" value="2" /> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1"  name="free_message_to_unknown_users" id="free_message_to_unknown_users"/> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">likes (Per Day)</th>
                                                <td>
                                                    <span class="visible-xs"> Likes </span> 
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="free_likes" checked class="inp_show"  value="1"/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="free_likes" class="inp_show"  value="2"/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="20" /> 
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> Likes </span> 
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_likes" checked class="inp_show"  value="1"/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_likes" class="inp_show"  value="2" /> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="50" /> 
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> Likes </span> 
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_likes" class="inp_show"  value="1" /> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_likes" checked class="inp_show"  value="2"/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control hidden" value="unlimited" /> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">See likes</th>
                                                <td>
                                                    <span class="visible-xs"> See likes </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="free_see_likes" class="inp_show"  value="1"  checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="free_see_likes" class="inp_show"  value="2" /> See all
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                <!-- <select class="input-text form-control">
                                                    <option> Only amount of likes and visitors <br/> pictures are blurried </option>
                                                    <option> See visitors, likes blurried. <br/>Make 3 visible per day </option>
                                                    <option> See all </option>
                                                    </select> -->
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> See likes </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_free_likes"  class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_free_likes" class="inp_show"  value="2" /> See all
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> See likes </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_free_likes"  class="inp_show"  value="1" /> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_free_likes" checked class="inp_show"  value="2"/> See all
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control hidden" value="1"/> 
                                                </td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">See  Visitors</th>
                                                <td>
                                                    <span class="visible-xs"> See Visitors </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="free_see_visitors" class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="free_see_visitors" class="inp_show"  value="2"/> See all
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> See Visitors </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_see_visitors" class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_see_visitors" class="inp_show"  value="2" /> See all
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> See Visitors </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_see_visitors"  /> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_see_visitors" checked/> See all
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control hidden" value="1" /> 
                                                </td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Personal swiping</th>
                                                <td>
                                                    <span class="visible-xs"> Personal swiping </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="free_personal_swiping" class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="free_personal_swiping" class="inp_show"  value="2"/> As much suggestions as possible
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> Personal swiping </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_personal_swiping" class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_personal_swiping" class="inp_show"  value="2"/> As much suggestions as possible
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> Personal swiping </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_personal_swiping"  class="inp_show"  value="1"/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_personal_swiping" class="inp_show"  value="2" checked/> As much suggestions as possible
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control hidden" value="1" /> 
                                                </td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">ads</th>
                                                <td>
                                                    <span class="visible-xs"> ads (Per Month)</span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="free_ads" class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="free_ads" class="inp_show"  value="2"/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> ads </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_ads" class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_ads" class="inp_show"  value="2"/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> ads </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_ads" class="inp_show"  value="1"/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_ads" class="inp_show"  value="2" checked/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control hidden" value="1" /> 
                                                </td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">See Live Video</th>
                                                <td>
                                                    <span class="visible-xs"> See Live Video </span>
                                                    <select class="input-text form-control" name="free_see_live_video">
                                                        <option> Yes </option>
                                                        <option> No </option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> See Live Video </span>
                                                    <select class="input-text form-control" name="premium_see_live_video">
                                                        <option> Yes </option>
                                                        <option> No </option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> See Live Video </span>
                                                    <select class="input-text form-control" name="vip_see_live_video">
                                                        <option> Yes </option>
                                                        <option> No </option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Live Video streaming</th>
                                                <td>
                                                    <span class="visible-xs"> Live Video streaming </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="free_live_video_streaming" class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="free_live_video_streaming" class="inp_show"  value="2"/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> Live Video streaming </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_live_video_streaming" class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_live_video_streaming" class="inp_show"  value="2" /> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> Live Video streaming </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_live_video_streaming" class="inp_show"  value="1"/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_live_video_streaming" class="inp_show"  value="2" checked/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control hidden" value="1" /> 
                                                </td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">View storys (Per Day)</th>
                                                <td>
                                                    <span class="visible-xs"> View storys </span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="free_view_storys" class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="free_view_storys" class="inp_show"  value="2"/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> View storys</span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_view_storys" class="inp_show"  value="1" checked/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="premium_view_storys" class="inp_show"  value="2"/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control" value="1" /> 
                                                </td>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> View storys</span>
                                                    <div class="form-group radio-select"> 
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_view_storys" class="inp_show"  value="1"/> Quantity
                                                        </label>
                                                        <label class="options"> 
                                                        <input type="radio" name="vip_view_storys" class="inp_show"  value="2" checked/> Unlimited
                                                        </label>
                                                    </div>
                                                    <input class="input-text form-control hidden" value="1" /> 
                                                </td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Network marketing</th>
                                                <td>
                                                    <span class="visible-xs"> Network marketing </span>
                                                    <select class="input-text form-control" name="free_network_marketing">
                                                        <option> Direct comission </option>
                                                        <option> Binary plan </option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> Network marketing </span>
                                                    <select class="input-text form-control" name="premium_network_marketing">
                                                        <option> Direct comission </option>
                                                        <option> Binary plan </option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <span class="visible-xs"> Network marketing </span>
                                                    <select class="input-text form-control" name="vip_network_marketing">
                                                        <option> Direct comission </option>
                                                        <option> Binary plan </option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.box-body -->
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
@endsection
<style>
    .options { padding: 0 20px; font-size: 17px; font-weight:normal;}
    .options input { margin: 2px 5px 0 0; }
</style>
@push('custom-js')
<script type="text/javascript">
    $(document).ready(function(){
        $(document).on('click', '.inp_show', function(){
            if($(this).val() == '1') { 
                $(this).parent().parent().siblings().removeClass('hidden');
            }
             if($(this).val() == '2') { 
                $(this).parent().parent().siblings().addClass('hidden');
            }
        });
    });
</script>
@endpush