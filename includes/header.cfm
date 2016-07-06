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

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/main.css">
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
			    	<input name="q" id="header-search-box" type="text" placeholder="e.g. undergraduate admission" />
			    	<label for="header-search-box">Search Xavier.edu</label>
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
					    <img src="img/xu-shield.svg" class="mobile-logo" />
					    <img src="img/xu-logo.svg" class="desktop-logo" />
				    </a>
			    </div>
			    
			    <div class="search-icon">
				    <a href="#search" class="show-search" role="button">
					    <img src="img/search.svg" alt="toggle search bar" />
				    </a>
			    </div>
			    
			    <div class="navigation">
				    <nav class="main-navigation" role="navigation">
						<ul role="menubar">
							<li>
								<a href="#" role="menuitem">Admission</a>
							</li>
							<li>
								<a href="#" role="menuitem">Academics</a>
							</li>
							<li>
								<a href="#" role="menuitem">Life at Xavier</a>
							</li>
							<li>
								<a href="#" role="menuitem">Athletics</a>
							</li>
							<li>
								<a href="#" role="menuitem">About Xavier</a>
							</li>
					   </ul>
				    </nav>
				    
				    <nav class="audience-navigation" role="navigation">
						<ul role="menubar">
							<li><a class='audience' href='/students/index.cfm' role="menuitem">Current Students</a></li>
							<li><a class='audience' href='/alumni/index.cfm' role="menuitem">Alumni</a></li>
							<li><a class='audience' href='/employees/index.cfm' role="menuitem">Employees</a></li>
						</ul>
						<ul role="menubar">
							<li><a href='https://admissions.xavier.edu/register/requestinfo' role="menuitem">Request Info</a></li>
					        <li><a href='/about/map.cfm' role="menuitem">Maps &amp; Directions</a></li>
					        <li><a href='https://careersatxavier.silkroad.com' role="menuitem">Employment</a></li>
						</ul>
					</nav>
					
					<nav class="header-cta" role="navigation">
						<ul role="menubar">
							<li>
								<a href="#" role="menuitem">Visit</a>
							</li>
							<li>
								<a href="#" role="menuitem">Apply</a>
							</li>
							<li>
								<a href="#" role="menuitem">Give</a>
							</li>
						</ul>
					</nav>
			   </div>
			    
		    </header>