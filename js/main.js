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
// Better to not rely on inline scripts to do what we want.
// Seperate JS from HTML for cleaner code.
$("#save-nav").on('click', function() {
	// Not needed since we can just call it directly as a global var
	// var pageData = $('#nestable-output').val();
	$.ajax({
		type: 'post',
		url: '/campusuite25/admin/nav_edit2/organize_nav_db.cfm',
		data: {
			pages: pageData,
			// grabbed directly from the global var 
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
			// do something if call fails..
			console.log(request);
			console.log(status);
			console.log(error);
		}
	});
});
AOS.init({		
	offset: 200,		
	delay: 200		
}); 
// Show search

var $searchContainer 	= $(".search-container");
var $searchInput		= $("#header-search-box");

var $navContainer		= $(".navigation");
var $firstNavItem		= $(".navigation.main-navigation:first-child a").focus();
var $searchIcon			= $(".show-nav a");

function headerToggle(hash){
	if (hash == "#search"){
		if ($searchContainer.hasClass("show")){
			$searchContainer.removeClass("show").addClass("hide");
		} else {
			$searchContainer.removeClass("hide").addClass("show");
			$searchInput.focus();
		}
	} else if (hash == "#nav"){
		if ($navContainer.hasClass("show")){
			$navContainer.removeClass("show").addClass("hide");
		} else {
			$navContainer.removeClass("hide").addClass("show");
			$firstNavItem.focus();
		}
		$searchIcon.toggleClass("open");
	}
	
}

function setPlaceholder(){
	var placeholderText = [
		"e.g. undergraduate admission",
		"e.g. biology",
		"e.g. graduate admission",
		"e.g. athletic trainig",
		"e.g. nursing programs",
		"e.g. Father Graham",
		"e.g. business programs",
		"e.g. occupational therapy"
	];
	
	var number = Math.floor((Math.random() * placeholderText.length) + 1);
	
	$("#header-search-box").attr('placeholder', placeholderText[number]);
	
}

$(".show-search, .show-nav a").on("click", function(e){
	e.preventDefault();
	var $hash = $(this).attr("href");
	headerToggle($hash);
});

$(document).ready(function(){
	if (window.location.hash == "#search"){
		$searchContainer.show();
		$searchInput.focus();
	}
	
	setPlaceholder();
	
});

$(window).resize(function(){
    var winwidth = $(window).innerWidth();
    if(winwidth > 1024){
        $navContainer.removeClass('show').removeClass('hide');
        $searchIcon.removeClass('open');
    }
});

$(".skip").click(function(event){
    
    // strip the leading hash and declare
    // the content we're skipping to
    var skipTo="#"+this.href.split('#')[1];

    // Setting 'tabindex' to -1 takes an element out of normal 
    // tab flow but allows it to be focused via javascript
    $(skipTo).attr('tabindex', -1).on('blur focusout', function () {

        // when focus leaves this element, 
        // remove the tabindex attribute
        $(this).removeAttr('tabindex');

    }).focus(); // focus on the content container
});