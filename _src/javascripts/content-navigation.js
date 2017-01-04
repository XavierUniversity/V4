$("#show-subnav").on('click', function(e){
	e.preventDefault();
	
	$("#subnav").toggleClass('active');
	
	if ( $("#subnav").hasClass('active') ) {
		$('#subnav li:first-child a' ).focus();
	} else {
		$("#show-subnav").focus();	
	}
});
