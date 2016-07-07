<cfinclude template="includes/header.cfm">

<cfset pageType = ( structKeyExists(url, "type") ? url.type : "bands" )>

<cfswitch expression="#pageType#">
	<cfcase value="billboard">
		<cfinclude template="includes/content/billboard.cfm">
	</cfcase>
	<cfcase value="cs">
		<cfinclude template="includes/content/cs.cfm">
	</cfcase>
	<cfdefaultcase>
		<cfinclude template="includes/content/home.cfm">
	</cfdefaultcase>
</cfswitch>

<cfinclude template="includes/footer.cfm">