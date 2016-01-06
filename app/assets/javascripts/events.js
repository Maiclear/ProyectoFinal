$(document).on("page:change", function(){
	$.ajax({
		url:'/get_map',
		type: 'GET',
		dataType: 'script'
	});
});