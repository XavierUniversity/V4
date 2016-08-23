<!--- The header file for Campus Suite based pages --->
<cfset isCampusSuite = true>
<cfinclude template="globals/header.cfm">

<!--- Banner image, yo --->
<section class="banner-small" style="background-image: url(http://www.xavier.edu/marketing-and-communications/images/dept-header-graphic.jpg);">
    <div class="banner-main">
	    <div class="breadcrumb">
		    <div class="trail">
			    <cfset breadCrumbs()>
		    </div>
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
</section>

<!--- begin CS content area --->
<section id="content">