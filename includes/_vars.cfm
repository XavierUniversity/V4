<!--- Campus Alert Variables --->
<cfset showAlert 	= false>
<cfset campusAlert 	= "weather"><!--- can be weather, shooter, power, network, clear, custom, or NULL (generic alert) --->
<cfset alertDate 	= dateFormat(now(), 'MMMM DD YYYY')><!--- The date of the alert --->
<cfset alertURI		= "http://www.xavier.edu/safety"><!--- URI for more information --->
<cfset customMsg 	= "I am a custom message, I can contain <strong>HTML</strong> code too."><!--- if custom alert, add your text. Code is wrapped in a <p> tag --->


<cfset path = (CGI.SERVER_NAME EQ "localhost" OR CGI.SERVER_NAME EQ "webdev.xavier.edu" ? "" : "/Templates/temp-v4/" )>
<cfset mobileLogo = path & "img/xu-shield.svg">
<cfset desktopLogo = path & "img/xu-logo.svg">

<cfset mainSiteNav = StructNew()>
<cfset mainSiteNav[1]["title"] = "Admissions">
<cfset mainSiteNav[1]["url"] = "/admission">
<cfset mainSiteNav[2]["title"] = "Academics">
<cfset mainSiteNav[2]["url"] = "/academics">
<cfset mainSiteNav[3]["title"] = "Life at Xavier">
<cfset mainSiteNav[3]["url"] = "/life-at-xavier">
<cfset mainSiteNav[4]["title"] = "Athletics">
<cfset mainSiteNav[4]["url"] = "/athletics">
<cfset mainSiteNav[5]["title"] = "About Xavier">
<cfset mainSiteNav[5]["url"] = "/about">
<cfset mainNavHTML = buildNav(mainSiteNav, true, false)>

<cfset audienceNav = StructNew()>
<cfset audienceNav[1]["title"] = "Current Students">
<cfset audienceNav[1]["url"] = "/students/index.cfm">
<cfset audienceNav[1]["class"] = "audience">
<cfset audienceNav[2]["title"] = "Alumni">
<cfset audienceNav[2]["url"] = "/alumni/index.cfm">
<cfset audienceNav[2]["class"] = "audience">
<cfset audienceNav[3]["title"] = "Employees">
<cfset audienceNav[3]["url"] = "/employees/index.cfm">
<cfset audienceNav[3]["class"] = "audience">
<cfset audienceNav[4]["title"] = "Request Info">
<cfset audienceNav[4]["url"] = "https://admissions.xavier.edu/register/requestinfo">
<cfset audienceNav[4]["class"] = "">
<cfset audienceNav[5]["title"] = "Maps &amp; Directions">
<cfset audienceNav[5]["url"] = "/about/map.cfm">
<cfset audienceNav[5]["class"] = "">
<cfset audienceNav[6]["title"] = "Employment">
<cfset audienceNav[6]["url"] = "/working-at-xavier/index.cfm">
<cfset audienceNav[6]["class"] = "">
<cfset audienceNavHTML = buildNav(audienceNav, true, true)>
<cfset footerAudienceHTML = BuildNav(audienceNav, false, false)>

<cfset cta = StructNew()>
<cfset cta[1]["title"] = "Visit">
<cfset cta[1]["url"] = "/visit">
<cfset cta[2]["title"] = "Apply">
<cfset cta[2]["url"] = "/apply">
<cfset cta[3]["title"] = "Give">
<cfset cta[3]["url"] = "/give">

<cfset ctaHTML = buildNav(cta, false, false)>
<cfset footerCtaHTML = buildNav(cta, false, false)>








<!---
	Functions -- To be moved, possibly.
	------------------
--->

<cffunction name="buildNav" output="no" returnType="string" description="Builds the navigation listing, based on vars">
	<cfargument name="navStruct" required="true" type="struct" hint="Multi-dimensional Array">
	<cfargument name="navWrap" default="true" type="boolean" required="true" hint="Wrap in UL?">
	<cfargument name="splitNav" default="false" type="boolean" required="true" hint="Split nav in half? Only works when navWrap = true.">
	<cfset html = ''>
	
	<cfif navWrap>
		<cfset html &= '<ul role="menubar">'>
	</cfif>
	
	<cfloop collection="#navStruct#" item="item">	
		<cfset currentItem = navStruct[item]>
		<cfif navWrap>
			<cfset html &= '<li>'>
		</cfif>
		<cfset html &= '<a #( structKeyExists(currentItem, "class") AND currentItem.class NEQ "" ? "class='#currentItem.class#'" : '' )# href="#currentItem.url#" role="menuitem">#currentItem.title#</a>'>
		<cfif navWrap>
			<cfset html &= '</li>'>
			<cfif splitNav AND item EQ Int(structCount(#navStruct#) / 2)>
				<cfset html &= "</ul><ul role='menubar'>">
			</cfif>
		</cfif>
	</cfloop>	
	<cfif navWrap>
		<cfset html &= '</ul>'>
	</cfif>
	
	<cfreturn html>
</cffunction>
	
	
