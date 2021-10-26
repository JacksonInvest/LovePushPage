@extends('backEnd.layouts.base')

<?php if(!isset($faq)){
		$form_title  = 'Add';
		$form_action = url('admin/faq/add');
	} else{
		$form_title  = 'Edit';
		$form_action = url('admin/faq/edit/'.$faq->id);
	}
?>
@section('title', $form_title.': FAQ')
@section('content')

<div class="content-area py-1">
    <div class="container-fluid">
    	<div class="box box-block bg-white">
            <a href="{{  url('admin/faqs') }}" class="btn btn-default pull-right"><i class="fa fa-angle-left"></i> Back</a>

			<h5 class="mb-2em">FAQ</h5>
            <form class="form-horizontal" action="{{ $form_action }}" method="POST" role="form">

            	<div class="form-group row">
					<label for="language_id" class="col-md-2 col-xs-12 col-form-label">Language</label>
					<div class="col-xs-10">
						<select name="language_id" id="language_id" class="form-control">
							<option value="">Select Language</option>
							<option value="1"
								@if(null !== old('language_id') )
									@if(old('language_id') == '1')
										selected
									@endif
								@elseif(@$faq->language_id == 1)
									selected
								@endif
							>English</option>

							<option value="2"
								@if(null !== old('language_id') )
									@if(old('language_id') == '2')
										selected
									@endif
								@elseif(@$faq->language_id == 2)
									selected
								@endif
							>German</option>
						</select>
					</div>
				</div>

				<div class="form-group row" id="english">
					<label for="ques_type" class="col-md-2 col-xs-12 col-form-label">Category</label>
					<div class="col-xs-10">
						<select name="ques_type" id="eng_type" class="form-control">
							<option value="">Select Category</option>
							<option value="General"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'General')
										selected
									@endif
								@elseif(@$faq->ques_type == 'General')
									selected
								@endif
							>General</option>

							<option value="Registration and first steps"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'Registration and first steps')
										selected
									@endif
								@elseif(@$faq->ques_type == 'Registration and first steps')
									selected
								@endif
							>Registration and first steps</option>

							<option value="Account"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'Account')
										selected
									@endif
								@elseif(@$faq->ques_type == 'Account')
									selected
								@endif
							>Account</option>

							<option value="Features LovePush"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'Features LovePush')
										selected
									@endif
								@elseif(@$faq->ques_type == 'Features LovePush')
									selected
								@endif
							>Features LovePush</option>

							<option value="Memberships"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'Memberships')
										selected
									@endif
								@elseif(@$faq->ques_type == 'Memberships')
									selected
								@endif
							>Memberships</option>

							<option value="Affiliate"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'Affiliate')
										selected
									@endif
								@elseif(@$faq->ques_type == 'Affiliate')
									selected
								@endif
							>Affiliate</option>
						</select>
					</div>
				</div>

				<div class="form-group row" id="german">
					<label for="ques_type" class="col-md-2 col-xs-12 col-form-label">Category</label>
					<div class="col-xs-10">
						<select name="ques_type1" id="ger_type" class="form-control">
							<option value="">Select Category</option>
							<option value="Allgemein"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'Allgemein')
										selected
									@endif
								@elseif(@$faq->ques_type == 'Allgemein')
									selected
								@endif
							>Allgemein</option>

							<option value="Anmeldung und erste Schritte"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'Anmeldung und erste Schritte')
										selected
									@endif
								@elseif(@$faq->ques_type == 'Anmeldung und erste Schritte')
									selected
								@endif
							>Anmeldung und erste Schritte</option>

							<option value="Account"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'Account')
										selected
									@endif
								@elseif(@$faq->ques_type == 'Account')
									selected
								@endif
							>Account</option>

							<option value="Features LovePush"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'Features LovePush')
										selected
									@endif
								@elseif(@$faq->ques_type == 'Features LovePush')
									selected
								@endif
							>Features LovePush</option>

							<option value="Mitgliedschaften"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'Mitgliedschaften')
										selected
									@endif
								@elseif(@$faq->ques_type == 'Mitgliedschaften')
									selected
								@endif
							>Mitgliedschaften</option>

							<option value="Affiliate"
								@if(null !== old('ques_type') )
									@if(old('ques_type') == 'Affiliate')
										selected
									@endif
								@elseif(@$faq->ques_type == 'Affiliate')
									selected
								@endif
							>Affiliate</option>
						</select>
					</div>
				</div>

            	<div class="form-group row">
					<label for="question" class="col-md-2 col-xs-12 col-form-label">Question</label>
					<div class="col-xs-10">
						<input class="form-control" type="text" value="{{ (null !== (old('question'))) ? old('question') : @$faq->question  }}" name="question" required id="question" placeholder="Name" maxlength="255">
					</div>
				</div>
            	<div class="form-group row">
					<label for="content" class="col-md-2 col-xs-12 col-form-label">Answer</label>
					<div class="col-xs-10">
						<textarea name="answer" class="form-control" max-length="6000" rows="8" required>{{ (null !== (old('answer'))) ? old('answer') : @$faq->answer  }}</textarea>
					</div>
				</div>
				<div class="form-group row">
					<label  class="col-md-2 col-xs-12 col-form-label"></label>
					<div class="col-xs-10 ">
            			{{csrf_field()}}
						<button type="submit" class="btn btn-primary">Save</button>
						<a href="{{ url('admin/faqs')}}" class="btn btn-default">Cancel</a>
					</div>
				</div>
			</form>
		</div>
    </div>
</div>
@endsection

@section('scripts')
<script>
    $(document).ready(function() {

		var language_id = $("#language_id").val();
		if(language_id == '1'){
			$("#english").show();
			$("#german").hide();
			$("#ger_type").val('');
		}
		else if(language_id == '2'){
			$("#english").hide();
			$("#eng_type").val('');
			$("#german").show();
		}
		else{
			$("#english").show();
			$("#german").hide();
			$("#ger_type").val('');
		}

		$("#language_id").on('change', function(){
			var language_id = $("#language_id").val();
			if(language_id == '1'){
				$("#english").show();
				$("#german").hide();
				$("#ger_type").val('');
			}
			else if(language_id == '2'){
				$("#english").hide();
				$("#eng_type").val('');
				$("#german").show();
			}
		});

	});
</script>

@endsection