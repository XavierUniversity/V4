$(".nav-toggle").on('click', function(e){
	e.preventDefault();
	$('#nav-icon').toggleClass('open');
	
	$(".navigation").toggleClass('show');
	// Set focus on the first nav item, if open; else focus on self
	if ( $(".navigation").hasClass('show') ) {
		$('.main-navigation li:first-child a').focus();	
	} else {
		$('#nav-icon').focus();
	}
});

$('.toggle-secondary').on('click', function(e){
	e.preventDefault();
	
	$('.secondary-nav-menubar').toggleClass('show');
	// Set focus on the first nav item, if open; else focus on self
	if ( $('.secondary-nav-menubar').hasClass('show') ) {
		$('.secondary-nav-menubar li:first-child a').focus();
	} else {
		$("#main-secondary-button").focus();
	}
});

$(".toggle-content-header-nav").on('click', function(e){
	e.preventDefault();
	
	$("#content-header-navigation").toggleClass('active');
	
	if ( $("#content-header-navigation").hasClass('active') ) {
		$('#content-header-navigation li:first-child a' ).focus();
	} else {
		$(".toggle-content-header-nav").focus();	
	}
});
