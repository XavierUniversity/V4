var pageData = '';
// Moved to global scope. Made a valid data attr; FYI custom attributes are not valid HTML
var grp_id = $('.dd').data('grp-id');
var updateOutput = function(e) {
		var list = e.length ? e : $(e.target);
		if (window.JSON) {
			// instead out outputting to a textarea, just save the data in a global var
			pageData = window.JSON.stringify(list.nestable('serialize'));
		} else {
			// Give a visual message for users to see.
			$("#saveAlert").addClass('alert-danger').html('There was an error saving your navigation. Contact the <a href="mailto:webmaster@xavier.edu?subject=Navigation Ordering">webmaster</a>.').fadeIn();
		}
	};
	// Init nestable; get first pageData details
	$("#nestable").nestable({
		maxDepth: 4
	}).on("change", updateOutput);
updateOutput($('#nestable'));

$("#save-nav").on('click', function() {
	$.ajax({
		type: 'post',
		url: '/campusuite25/admin/nav_edit2/organize_nav_db.cfm',
		data: {
			pages: pageData,
			grp_id: grp_id
		},
		dataType: "json",
		success: function(response) {
			$("#saveAlert").addClass('alert-' + response.result).html(response.msg).fadeIn();
			if (response.result == "success") {
				$("#saveAlert").append(" <a href=\"#\" onClick=\"window.location.reload(1);\">Reload Now</a>.");
				setTimeout(function() {
					window.location.reload(1);
				}, 10000);
			} else {
				setTimeout(function() {
					$("#saveAlert").removeClass('alert-' + response.result).html('').fadeOut();
				}, 5000);
			}
		},
		error: function(request, status, error) {
			console.log(request);
			console.log(status);
			console.log(error);
		}
	});
});