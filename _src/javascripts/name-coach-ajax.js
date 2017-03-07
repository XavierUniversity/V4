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