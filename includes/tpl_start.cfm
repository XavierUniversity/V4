<!--- The header file for Campus Suite based pages --->
<cfset isCampusSuite = true>
<cfinclude template="globals/header.cfm">

<!--- Banner image, yo --->
<section class="banner-small" <!--- needs FeatureImage() ---> style="background-image: url(http://www.xavier.edu/marketing-and-communications/images/dept-header-graphic.jpg);">
    <div class="banner-main">
	    <div class="breadcrumb">
		    <div class="trail">
			    <cfset breadCrumbs()>
			    <cfif isdefined('headerTitle')>
	                <cfset header = headerTitle>
	            <cfelse>
	            	<cfif isdefined("session.grp_id") and session.grp_id EQ 2854 and listLen(pageTitle,'|') EQ 2>
						<cfset titleList = replace(listFirst(pageTitle,'|'), ' - ', '#chr(7)#', 'all')>
	                    <cfset header = trim(listFirst(titleList,'#chr(7)#'))>
	                    <cfset header = replace(header,'-','&ndash;','ALL')> 
	                <cfelse>
						<cfset titleList = replace(pageTitle, ' - ', '#chr(7)#', 'all')>
	                    <cfset header = trim(listLast(titleList,'#chr(7)#'))>
	                    <cfset header = replace(header,'-','&ndash;','ALL')> 
	                </cfif>
	            </cfif> 
	            
				<h1 class='heading'><cfoutput>#header#</cfoutput></h1>
			</div>
	    </div>
    </div>
</section>

<!--- Header navigation stuff --->
<cfinclude template="#templatePath#/includes/cms/header-nav.cfm">

<!--- begin CS content area 
	
	if homepage, the entire area is the main copy; No navigation
	else, only one section is main content. We should target it with "skip to content"
		include navigation
--->
<cfif isDefined("pageType") and pageType IS 'homepg' or (isDefined('module') and (module IS 'blogXU' or module is 'blog' or module is 'cdn'))>
	<section id="site-content" class="container-fluid">
	<!--- 	No navigational elements here. --->
	<!--- nothing else to really do here. --->
<cfelse>
	<section id="site-content" class="container">
		<div class="row">
			<div class="col-sm-12">
				<cfif isDefined("sideNav") && pageType EQ 'secondaryPg'>
					<div class="subnav-jump">
						<a class="scroll" href="#subnav">Section Menu <span class="fa fa-angle-down fa-lg"></span></a>
					</div>
				</cfif>
			</div>
		</div>
		<div class="row">
			
			<cfif pagetype is 'fullpg' or (isDefined('module') and (module IS 'blogXU' or module is 'blog' or module is 'cdn'))>
				<div class="col-md-12">
					<!--- START EDITOR ENTRY --->
			<cfelse>
				<div class="col-md-9 col-md-push-3">
					<!--- START EDITOR ENTRY --->
			</cfif>
</cfif>