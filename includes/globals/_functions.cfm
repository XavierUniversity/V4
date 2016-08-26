<cffunction name="errorEmail" output="no" description="quick email without all the typing">
	<cfargument name="address" type="string"  required="true" default="mcmulleng@xavier.edu">
	<cfargument name="subject" type="string"  required="false" default="Quick Email">
	<cfargument name="catch"   type="boolean" required="true" default="false" hint="Show Catch?">
	
	<cfmail to="#address#" from="Template Error Email <webmaster@xavier.edu>" subject="#subject#" type="html">
		IP: #listGetAt(structFind(GetHttpRequestData().headers, 'X-forwarded-for'),1)#
		<cfif catch>
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

<cffunction name="loadCSS" output="no" returnType="string" description="Builds styles as appropriate">
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

<cffunction name="loadJS" output="no" returnType="string" description="Builds styles as appropriate">
	<cfset js = '<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>'
				& '<script>window.jQuery || document.write(''<script src="#templatePath#js/jquery.min.js"><\/script>'')</script>'
				& '<script src="#templatePath#js/vendor.min.js"></script>'
				& '<script src="#templatePath#js/main.min.js"></script>'
				& '<script src="scripts/local.js"></script>'>
    
    <cfif isDefined("session.user_id") AND session.user_id IS NOT "">
        <cfset js &= '<script src="#templatePath#js/admin.min.js"></script>'>
	</cfif>

	<cfreturn js>
	
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
    		<cfset errorEmail("mcmulleng@xavier.edu;lieslandr@xavier.edu", "V4 Breadcrumb Error - All", true)>
        	<cfreturn false>
        </cfcatch>
    </cftry>

	<cfreturn true>
</cffunction>

<cffunction name="v4renderBreadCrumb" access="public" returntype="boolean" hint="Renders bread crumb for nav.nav item" output="yes">
	<cfargument name="seperator" default="&gt;" required="no" type="string">
	<cfargument name="nav" required="yes">
	
	<cftry>
		<cfif (nav.open or nav.selected) and (right(trim(nav.getPath()),9) NEQ 'index.cfm' OR findNoCase('online',nav.getPath()) or trim(nav.getPath()) NEQ CGI.script_name)>
			#seperator#
			<cfif not nav.selected>
				<a href="#nav.getPath()#">
			</cfif>
			#nav.pageTitle#
			<cfif not nav.selected>
				</a>
			</cfif>
			<cfloop array="#nav.children#" index="child">
				<cfif child.hidden neq 1>
					<cfset v4renderBreadCrumb(seperator, child)>
				</cfif>
			</cfloop>
		</cfif>
		<cfcatch type="any">
			<cfset errorEmail("mcmulleng@xavier.edu;lieslandr@xavier.edu", "V4 Breadcrumb Error - Single", true)>
			<cfreturn false>
			
		</cfcatch>
	</cftry>
	<cfreturn true>
</cffunction>

<cffunction name="v4FeatureImage" returntype="void" output="yes" hint="Loads in the header graphic for Campus Suite pages.">
	<cfset var cur_dir = "/#currentDirectory#">
	<cfset var sess_dir = "/#session.folder#">
	<cfif cur_dir IS "//">
		<cfset cur_dir = "">
	</cfif>
	<cfif sess_dir IS "//">
		<cfset sess_dir = "">
	</cfif>
	<cfset cur_file = listgetat(cgi.script_name, listlen(cgi.script_name, "/"), "/")>
    <cfset cur_file = listgetat(cur_file, 1, ".")>
	<cfif fileExists(expandPath("#sess_dir#/images/header-#cur_file#.jpg"))>
        <cfset header = "#sess_dir#/images/header-#cur_file#.jpg">
    <cfelseif fileExists(expandPath("#sess_dir#/images/dept-header-graphic.jpg"))>
        <cfset header = "#sess_dir#/images/dept-header-graphic.jpg">
    <cfelseif fileExists(expandPath("#sess_dir#/images/dept-header-graphic.gif"))>
        <cfset header = "#sess_dir#/images/dept-header-graphic.gif">
    <cfelseif fileExists(expandPath("#sess_dir#/images/dept-header-graphic.png"))>
        <cfset header = "#sess_dir#/images/dept-header-graphic.png">
    <cfelse>
        <cfset header = "/Templates/temp-v4/img/cover/banner-content.jpg">
    </cfif>
    <cfif header is not "">
		style='background-image: url(<cfoutput>#header#</cfoutput>);'
    </cfif>
</cffunction>