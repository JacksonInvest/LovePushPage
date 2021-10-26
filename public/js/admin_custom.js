
$(document).ready(function(){
	$(document).on('click', '.question_status', function(){
		var action = base_url + '/admin/question-status-change';
		var a_this = $(this);
		var question_id = $(this).data('questionid');
        $.ajax({
            url: action,
            type:'POST',
            data:{ question_id:question_id, _token:csrf_token},
            success:function(data){
            	//console.log(data);
                var status = data.status;
                console.log(status);
                if(status ==  'false'){
                	$(this).html('<i class="ion-checkmark all-btn-icon"></i>');

                	$('#err-status-msg').css('display', 'block');
                	$('#err-status-msg').html('<strong>'+data.message+'</strong>');
                }else if(status == 'true'){
                	console.log('coming');
                	var is_active = data.is_active;
                	if(is_active == 1){
                		console.log(a_this);
                		//$(this).find('.fa').removeClass('fa fa-times').addClass('fa fa-check');
                		$(a_this).find('i').toggleClass('fa fa-times fa fa-check');
                		$(a_this).find('i').css("color", "green");
                		$(a_this).attr('title', 'Acive');
                	}else{
                		$(a_this).attr('title', 'In-Active');
                		$(a_this).find('i').css("color", "red");
                		//$(this).find('.fa').removeClass('fa fa-check').addClass('fa fa-times');
                		$(a_this).find('i').toggleClass('fa fa-check fa fa-times');
                	}
                	$('#succ-status-msg').css('display', 'block');
                	$('#succ-status-msg').html('<strong>'+data.message+'</strong>');
                }
            }
        });
	});
});