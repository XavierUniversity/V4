// Show search

var $searchContainer 	= $(".search-container");
var $searchInput		= $("#header-search-box");

var $navContainer		= $(".navigation");
var $firstNavItem		= $(".navigation.main-navigation:first-child a").focus();

function headerToggle(hash){
	if (hash == "#search"){
		$searchContainer.toggle();
		$searchInput.focus();
	} else if (hash == "#nav"){
		$navContainer.toggle();
		$firstNavItem.focus();
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