$('.skip-link').on('click', function(e){
	e.preventDefault();
	ref = $(this).attr('href');
	console.log(ref);
	$(ref).focus().addClass('accessible-highlight');
	
	setTimeout( function(){
		$(ref).removeClass('accessible-highlight');	
	}, 2000);
});