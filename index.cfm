<cfset pageType = ( structKeyExists(url, "type") ? url.type : "" )>

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