<cfset pageType = ( structKeyExists(url, "type") ? url.type : "" )>

<cfsavecontent variable="secondaryNav">
	<ul role="menubar">
		<li><a id="index.cfm--body-secondaryNav-map" href='map.cfm'>Campus Map</a></li>
		<li><a id="index.cfm--body-secondaryNav-map" href='a-z.cfm'>A &ndash; Z Indez</a></li>
	</ul>
</cfsavecontent>

<cfinclude template="includes/globals/header.cfm">



<cfswitch expression="#pageType#">
	<cfcase value="billboard">
		<cfinclude template="includes/content/billboard.cfm">
	</cfcase>
	<cfcase value="cs">
		<cfinclude template="includes/content/cs.cfm">
	</cfcase>
	<cfcase value="academic">
		<cfinclude template="includes/content/academic.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="includes/content/home.cfm">
	</cfdefaultcase>
</cfswitch>

<cfinclude template="includes/globals/footer.cfm">