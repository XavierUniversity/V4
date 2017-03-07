$('.tab').on('click', function(e){
	e.preventDefault();

	var clickedElement = $(this);
	var contentID = $(this).data('content');

	$('.button.active, .details-item.active').removeClass('active');
	clickedElement.addClass('active');

	$(contentID).addClass('active');
	$(contentID + " h3").focus();
});
$('.skip-link').on('click', function(e){
	e.preventDefault();
	ref = $(this).attr('href');
	$(ref).focus().addClass('accessible-highlight');
	
	setTimeout( function(){
		$(ref).removeClass('accessible-highlight');	
	}, 2000);
});

/*
var email = ( $(".email-address a") ? $(".email-address a").attr("href").substring(7) : "" );
var audio = document.getElementById("namecoach");
if (email) {
  $.ajax({
  	url: 'https://name-coach.com/api/private/v3/name',
  	data: { auth_token: "C-JyZjtGhy1-u-sNPyg5", email: email },
  	success: function(d){
    	console.log(d.data);
    	$('#namecoach').attr('src', d.data.recording_link);
    	$('.namecoach .play').append('<span class="fa fa-volume-up"></span><span class="sr-only">Name Proununciation for' + d.data.first_name + " " + d.data.last_name + '"</span>');
  	}
  });  
}

$(".namecoach .play").on('click', function(e){
  e.preventDefault();
  if (!audio.paused) {
			audio.pause();
	} else {
		audio.volume = 0.75;
		audio.play();
	}
});
*/


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

$("#show-subnav").on('click', function(e){
	e.preventDefault();
	
	$("#subnav").toggleClass('active');
	
	if ( $("#subnav").hasClass('active') ) {
		$('#subnav li:first-child a' ).focus();
	} else {
		$("#show-subnav").focus();	
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



$("#search-toggle").on('click', function(e){
	e.preventDefault();
	$("#header-search").toggleClass('show');
	if ($("#header-search").hasClass('show')) {
		$("#header-search-box").focus();
	} else {
		$("#search-toggle").focus();
	}
});
// Function for SVG clipping
function clipSVG(id){
    var svg = document.getElementsByTagName("svg")[0];
		
	if (svg.getAttribute('id') === id){
		var bbox = svg.getBBox();
		var viewBox = [bbox.x, bbox.y, bbox.width, bbox.height].join(" ");
		svg.setAttribute("viewBox", viewBox);
	}
}

// on window resize; we'll need to refire this
if(window.addEventListener) {
	window.addEventListener('resize', function() {
		clipSVG('logo');
	}, true);
}

clipSVG('logo');