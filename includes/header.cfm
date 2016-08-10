<cfinclude template="_vars.cfm">


<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Xavier University</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        <!-- Place favicon.ico in the root directory -->

        <link rel="stylesheet" href="<cfoutput>#path#</cfoutput>css/globals.css">
        <link rel="stylesheet" href="<cfoutput>#stylesheet#</cfoutput>">
        <!--- Grunt should LOOK for modernizr needs
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>--->
        
        <style>
        </style>
        
    </head>
    <body>
	    
	    <a href="#main-content" class="skip">Skip to main content</a>
	    
	    <div class="search-container">
		    <form action="#0" id="header-search-form">
			    <div class="search-box">
				    <label for="header-search-box">Find programs, activities and more...</label>
			    	<input name="q" id="header-search-box" type="text"  required />
			    	
			    </div>
		    	<input type="submit" value="Search" />
		    </form>
	    </div>
    	
    	<cfif showAlert EQ true AND isDefined("campusAlert")>
	    	<cfinclude template="header-alert.cfm">
    	</cfif>
	    <div class="page">
	    	
		    <header class="site-header">
			    <div class="show-nav">
				    <a id="nav-icon" href="#nav">
					    <span></span>
						<span></span>
						<span></span>
						<span></span>
				    </a>
			    </div>
			    
			    <div class="site-logo">
				    <a href="#home">
					    <img src="<cfoutput>#mobileLogo#</cfoutput>" class="mobile-logo" alt="Xavier University Home" />
					    <img src="<cfoutput>#desktopLogo#</cfoutput>" class="desktop-logo" alt="Xavier University Home" />
				    </a>
			    </div>
			    
			    <div class="search-icon">
				    <a href="#search" class="show-search" role="button">
					    <img src="<cfoutput>#path#</cfoutput>img/search.svg" alt="toggle search bar" />
				    </a>
			    </div>
			    
			    <div class="navigation">
				    <nav class="main-navigation" role="navigation">
						<cfoutput>#mainNavHTML#</cfoutput>
				    </nav>
				    
				    <nav class="audience-navigation" role="navigation">
					    <cfoutput>#audienceNavHTML#</cfoutput>
					</nav>
					
					<nav class="cta" role="navigation">
						<cfoutput>#ctaHTML#</cfoutput>
					</nav>
			   </div>
			    
		    </header>
		    
			<main id="main-content" tabindex="-1">