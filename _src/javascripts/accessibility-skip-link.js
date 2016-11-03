$('.skip-link').on('click', function(e){
	e.preventDefault();
	ref = $(this).attr('href');
	
	$(ref).focus().addClass('accessible-highlight');
	
	setTimeout( function(){
		$(ref).removeClass('accessible-highlight');	
	}, 2000);
});