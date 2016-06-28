/*! Xavier - v0.1.0 - 2016-06-28 */
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
    }
});
//# sourceMappingURL=main.js.map