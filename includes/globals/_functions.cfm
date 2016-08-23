<cffunction name="errorEmail" output="no" description="quick email">
	<cfargument name="address" type="string" required="yes">
	<cfargument name="subject" type="string" required="false" default="Quick Email">
	
	<cfmail to="#address#" from="Error Email <webmaster@xavier.edu>" subject="#subject#">
		IP: #listGetAt(structFind(GetHttpRequestData().headers, 'X-forwarded-for'),1)#
		<cfif cfcatch>
			<cfdump var="#cfcatch#" label="Catch">
		</cfif>
		<cfdump var="#variables#" label="Variables">
        <cfdump var="#session#" label="Session">
        <cfdump var="#application#" label="Application">
        <cfdump var="#form#" label="Form">
        <cfdump var="#cgi#" label="CGI">
        <cfdump var="#server#" label="Server">
	</cfmail>
</cffunction>

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
	
	<cfif isDefined("isCampusSuite") AND isCampusSuite>
		<cfset stylesheets &= '<link rel="stylesheet" href="#templatePath#css/cms.css">'>
		<cfif isdefined("session.user_id") AND session.user_id is not "">
			<cfset stylesheets &= '<link rel="stylesheet" href="#templatePath#css/admin.css">'>
		</cfif>
	<cfelse>
		<cfset stylesheets &= '<link rel="stylesheet" href="#templatePath#css/bands.css">'>
	</cfif>
		
	<cfreturn stylesheets>
</cffunction>

<cffunction name="v4renderBreadCrumbs" access="public" returntype="boolean" hint="" output="yes">
	<cfargument name="seperator" default="&gt;" required="no" type="string">
	<cfargument name="nav" required="yes">
	
	<cftry>
    	<cfset found = 0>
    
        <cfloop array="#nav.children#" index="child">
        	<cfif found eq 0>
            	<cfif child.open or child.selected>
                	<cfset found = 1>
                </cfif>
	            <cfset v4renderBreadCrumb(seperator, child)>
			</cfif>                   
        </cfloop>

    	<cfcatch type="any">        
    		<cfdump var="#cfcatch#">
        	<cfreturn false>
        </cfcatch>
    </cftry>

	<cfreturn true>
</cffunction>


<cffunction name="v4renderBreadCrumb" access="public" returntype="boolean" hint="Renders bread crumb for nav.nav item" output="yes">
	<cfargument name="seperator" default="&gt;" required="no" type="string">
	<cfargument name="nav" required="yes">
	
	<cftry>
		<cfoutput>
			<cfif (nav.open or nav.selected) and (right(trim(nav.getPath()),9) NEQ 'index.cfm' OR findNoCase('online',nav.getPath())) and nav.getPath() NEQ CGI.script_name >
#seperator#
				<cfif not nav.selected>
					<a href="#nav.getPath()#">
				</cfif>
				#nav.label#
				<cfif not nav.selected>
					</a>
				</cfif>
				<cfloop array="#nav.children#" index="child">
					<cfif child.hidden neq 1>
						<cfset v4renderBreadCrumb(seperator, child)>
					</cfif>
				</cfloop>
			</cfif>
		</cfoutput>
		<cfcatch type="any">
			<cfdump var="#cfcatch#">
			<cfreturn false>
			
		</cfcatch>
	</cftry>
	<cfreturn true>
</cffunction>