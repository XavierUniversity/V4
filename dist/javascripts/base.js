$('.tab').on('click', function(e){
	e.preventDefault();

	var clickedElement = $(this);
	var contentID = $(this).data('content');

	$('.button.active, .details-item.active').removeClass('active');
	clickedElement.addClass('active');

	$(contentID).addClass('active');
	$(contentID + " h3").focus();
});
// Globals
var level,
    list;

// Check for mobile browsers
window.mobilecheck = function() {
	var check = false;
	(function(a){
  	if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true; })(navigator.userAgent||navigator.vendor||window.opera);
		return check;
};

$('#show-programs').on('click', function(e){
  e.preventDefault();
  $('#show-programs span').toggleClass('fa-rotate-180');
  $('.programs-list').toggleClass('show');
});
	
$('.program-buttons a').on('click', function(e){
  e.preventDefault();
  // Clear 'show' classes on items, clear select box on switch
  $('.program-buttons a, .major-buttons li, .major-buttons').removeClass('show');
  $('.major-buttons select option').prop('selected', false);
  $(this).addClass('show');
  
  list = $('.major-list > li');
  $(list).removeClass('show');
  
  level = $(this).data('category');
  
  $('[id='+level+']').addClass('show');
});

$('.major-buttons a, .major-buttons select').on('click change', function(e){
  e.preventDefault();
  
  $('.major-buttons li').removeClass('show');
  $(this).parent('li').addClass('show');
  
  if ( !level ){
    level = $(this).parents('.major-buttons').attr('id');
  }
  
  var cat = ( $(this).data('category') === undefined ? $(this).find(':selected').data('category') : $(this).data('category') );
  
  if ( cat == 'undecided' ){
    $(".major-list").addClass('single');
  } else {
    $(".major-list").removeClass('single');
  }
  
  filterMajors(cat, level, list);
  
});


function filterMajors(value, progLevel, list){
	$(list).removeClass('show');
	if (value == 'all') {
		$(".major-list").find("li").each(function (i){
			if($(this).data("program") === progLevel && $(this).text().indexOf("Licensure") < 0 && $(this).text().indexOf("Endorsement") < 0 && !$(this).hasClass("undecided")) {
				$(this).addClass("show");
			}
		});
	} else { 
		$(".major-list").find("li[class*="+value+"]").each(function (i){
			if($(this).data("program") === progLevel){
				$(this).addClass("show");	
			}
		});
	}
}

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
	
	$("#subnav").toggleClass('show');
	
	if ( $("#subnav").hasClass('show') ) {
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
	
	$("#content-header-navigation").toggleClass('show');
	
	if ( $("#content-header-navigation").hasClass('show') ) {
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