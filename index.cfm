<cfinclude template="includes/header.cfm">

<cfset pageType = ( structKeyExists(url, "type") ? url.type : "bands" )>

<cfswitch expression="#pageType#">
	<cfcase value="cs">
		<cfinclude template="includes/content/cs.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="includes/content/bands.cfm">
	</cfdefaultcase>
</cfswitch>

<cfinclude template="includes/footer.cfm">