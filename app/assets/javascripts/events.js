$(document).on("page:change", function(){
	$.ajax({
		url:'/get_map',
		type: 'GET',
		dataType: 'script'
	});

	$('.js-limited').change(function() {
		if ($(this).is(":checked")) {
			$('.js-cupos').prop('disabled', false);
		} else{
			$('.js-cupos').prop('disabled', true);
		};
	})

});

