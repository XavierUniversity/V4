$("#search-toggle").on('click', function(e){
	e.preventDefault();
	$("#header-search").toggleClass('show');
	if ($("#header-search").hasClass('show')) {
		$("#header-search-box").focus();
	} else {
		$("#search-toggle").focus();
	}
});