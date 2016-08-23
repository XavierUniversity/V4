<!--- The header file for Campus Suite based pages --->
<cfset isCampusSuite = true>
<cfinclude template="globals/header.cfm">

<!--- Banner image, yo --->
<section class="banner-small" style="background-image: url(http://www.xavier.edu/marketing-and-communications/images/dept-header-graphic.jpg);">
    <div class="banner-main">
	    <cfdump var="#breadCrumbs()#">
	    <div class="breadcrumb">
		    <div class="trail">
	            <a href="#">Xavier Home</a> <span>/</span> <a href="#">Department Name</a>
		    </div>
            <h1 class="heading">Page Name</h1>
	    </div>
    </div>
</section>

<!--- begin CS content area --->
<section id="content">