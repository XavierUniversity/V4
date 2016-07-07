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