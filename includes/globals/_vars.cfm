<cfset templatePath = (CGI.SERVER_NAME EQ "localhost" OR CGI.SERVER_NAME EQ "webdev.xavier.edu" ? "" : "/Templates/temp-v41/" )>

<cfset mobileLogo = templatePath & "img/xu-shield.svg">
<cfset desktopLogo = templatePath & "img/xu-logo.svg">

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

<cfset ctaHTML = buildNav(cta, true, false)>