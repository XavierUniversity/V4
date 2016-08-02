<!--- Campus Alert Variables --->
<cfset showAlert 	= false>
<cfset campusAlert 	= "weather"><!--- can be weather, shooter, power, network, clear, custom, or NULL (generic alert) --->
<cfset alertDate 	= dateFormat(now(), 'MMMM DD YYYY')><!--- The date of the alert --->
<cfset alertURI		= "http://www.xavier.edu/safety"><!--- URI for more information --->
<cfset customMsg 	= "I am a custom message, I can contain <strong>HTML</strong> code too."><!--- if custom alert, add your text. Code is wrapped in a <p> tag --->


<!--- Header --->
<cfset path = (CGI.SERVER_NAME EQ "localhost" OR CGI.SERVER_NAME EQ "webdev.xavier.edu" ? "" : "/Templates/temp-v4/" )>
<cfset mobileLogo = path & "img/xu-shield.svg">
<cfset desktopLogo = path & "img/xu-logo.svg">

<cffunction name="buildNav" description="Builds the navigation listing, based on vars" output="no" returnType="string">
	<cfargument name="navArray" required="true" type="array" hint="Multi-dimensional Array">
	<cfargument name="navWrap" default="true" type="boolean" required="true" hint="Wrap in UL?">
	<cfargument name="splitNav" default="false" type="boolean" required="true" hint="Split nav in half? Only works when navWrap = true.">
	<cfset html = ''>
	
	<cfif navWrap>
		<cfset html &= '<ul role="menubar">'>
	</cfif>
	
	<cfloop from="1" to="#arrayLen(navArray)#" index="i">
		<cfif navWrap>
			<cfset html &= '<li>'>
		</cfif>
		<cfset html &= '<a #( ArrayLen(navArray[i]) GT 2 AND navArray[i][3] NEQ '' ? "class='#navArray[i][3]#'" : '' )# href="#navArray[i][2]#" role="menuitem">#navArray[i][1]#</a>'>
		<cfif navWrap>
			<cfset html &= '</li>'>
			<cfif splitNav AND i EQ Int(arrayLen(#navArray#) / 2)>
				<cfset html &= "</ul><ul role='menubar'>">
			</cfif>
		</cfif>
	</cfloop>
	<cfif navWrap>
		<cfset html &= '</ul>'>
	</cfif>
	
	<cfreturn html>
</cffunction>


<cfset mainNav = ArrayNew(2)>
<cfset mainNav[1][1] = "Admisions">
<cfset mainNav[1][2] = "/admission">
<cfset mainNav[2][1] = "Academics">
<cfset mainNav[2][2] = "/academics">
<cfset mainNav[3][1] = "Life at Xavier">
<cfset mainNav[3][2] = "/life-at-xavier">
<cfset mainNav[4][1] = "Athletics">
<cfset mainNav[4][2] = "/athletics">
<cfset mainNav[5][1] = "About Xavier">
<cfset mainNav[5][2] = "/about">

<cfset mainNavHTML = buildNav(mainNav, true, false)>

<cfset audienceNav = ArrayNew(2)>
<cfset audienceNav[1][1] = "Current Students">
<cfset audienceNav[1][2] = "/students/index.cfm">
<cfset audienceNav[1][3] = "audience">
<cfset audienceNav[2][1] = "Alumni">
<cfset audienceNav[2][2] = "/alumni/index.cfm">
<cfset audienceNav[2][3] = "audience">
<cfset audienceNav[3][1] = "Employees">
<cfset audienceNav[3][2] = "/employees/index.cfm">
<cfset audienceNav[3][3] = "audience">
<cfset audienceNav[4][1] = "Request Info">
<cfset audienceNav[4][2] = "https://admissions.xavier.edu/register/requestinfo">
<cfset audienceNav[4][3] = "">
<cfset audienceNav[5][1] = "Maps &amp; Directions">
<cfset audienceNav[5][2] = "/about/map.cfm">
<cfset audienceNav[5][3] = "">
<cfset audienceNav[6][1] = "Employment">
<cfset audienceNav[6][2] = "/working-at-xavier/index.cfm">
<cfset audienceNav[6][3] = "">

<cfset audienceNavHTML = buildNav(audienceNav, true, true)>
<cfset footerAudienceHTML = BuildNav(audienceNav, false, false)>

<cfset cta = ArrayNew(2)>
<cfset cta[1][1] = "Visit">
<cfset cta[1][2] = "/visit">
<cfset cta[2][1] = "Apply">
<cfset cta[2][2] = "/apply">
<cfset cta[3][1] = "Give">
<cfset cta[3][2] = "/give">

<cfset ctaHTML = buildNav(cta, false, false)>

<cfset footerCtaHTML = buildNav(cta, false, false)>