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