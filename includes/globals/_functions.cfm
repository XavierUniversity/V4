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

<cffunction name="loadStylesheets" output="no" returnType="string" description="Builds styles as appropriate">
	<cfset stylesheets = '<link rel="stylesheet" href="#templatePath#css/globals.css">'>
	<cfset stylesheets &= '<link rel="stylesheet" href="#templatePath#css/bands.css">'>
	<!--- TO DO
		Check if CS and if Admin; Add those styles, replace band path
		<cfset stylesheet = "#path#css/bands.css">
			<cfif pageType EQ "cs">
				<cfset stylesheet = "#path#css/cms.css">
				<cfelseif pageType EQ "admin">
				<cfset stylesheet = "#path#css/admin.css">
		</cfif>
	--->
	
	<cfreturn stylesheets>
</cffunction>