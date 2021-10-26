$(document).ready(function() {
	$(document).on('.del-btn','click', function(){
		if(confirm('Are You sure ?')){
			return true;
		} else{
			return false;			
		}
	})
});
