// Show search

var $searchContainer 	= $(".search-container");
var $searchInput		= $("#header-search-box");

var $navContainer		= $(".navigation");
var $firstNavItem		= $(".navigation.main-navigation:first-child a").focus();

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
    if(winwidth > 1000){
        $navContainer.removeClass('show').removeClass('hide');    
    }
});