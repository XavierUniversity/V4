<!--- 
	Template Name: V4 - Blue Blob
--->
<div class="breadcrumbs">
    <div class="inner">
	    
	    <cfif cgi.script_name is not "/index.cfm">
	    	<a href="/index.cfm">Xavier Home</a>
	    	
	    	<cfset schoolBreadcrumb()>
	    	
	    	<cftry>
	    	
	    		<cfset folderLength = listLen(session.folder,"/")>
	    		
	    		<cfif folderLength GE 2>
		    		<cfset workingFolder = ''>
		    		
		    		<cfloop from="1" to="#folderlength - 1#" index="i">
			    		<cfoutput>
				    		<!--- Add the working folder to the list --->
				    		<cfset workingFolder = listAppend(workingFolder, listGetAt(session.folder,i,"/"),"/")>
				    		
				    		<!--- see if there is a matching department in the database --->
				    		<cfquery name="getDept" dataSource="cs2011read">
					    		select name from groups_tbl
					    		where folder = <cfqueryparam value="#workingFolder#" CFSQLType="CF_SQL_VARCHAR">
				    		</cfquery>
				    		
				    		<cfif getDept.recordCount GT 0>
					    		<span>/</span> <a href="/#workingFolder#/">#getDept.name#</a>
				    		</cfif>
			    		</cfoutput>
		    		</cfloop>
	    		</cfif>
	    		
	    		
	    	
	    	<cfcatch>
	    		<cfmail from="v4Test@xavier.edu" to="mcmulleng@xavier.edu;lieslandr@xavier.edu" subject="V4 Breadcrumb Error" type="html">
	    			IP: #listGetAt(structFind(GetHttpRequestData().headers, 'X-forwarded-for'),1)#
	    			<cfdump var="#cfcatch#" label="Catch">
	    			<cfdump var="#variables#" label="Variables">
                    <cfdump var="#session#" label="Session">
                    <cfdump var="#application#" label="Application">
                    <cfdump var="#form#" label="Form">
                    <cfdump var="#cgi#" label="CGI">
                    <cfdump var="#server#" label="Server">
	    		</cfmail>
	    	</cfcatch>
	    	</cftry>
	    	
	    	<cfif session.folder is not "/"><cfoutput><span>/</span> <a href="/#session.folder#/">#session.department#</a></cfoutput></cfif>
            <cfset sideNav = CreateObject("component","campusuite25.objects.navigation.NavigationList").load(session.grp_id)>
			
			
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
									<cfset child.v4renderBreadCrumb(seperator)>
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
		  <!---<cfmail from="lieslandr@xavier.edu" to="lieslandr@xavier.edu" subject="sideNav Quick Email" type="html">
			  <p>#listGetAt(structFind(GetHttpRequestData().headers,'X-forwarded-for'),1)#</p>
			  <cfdump var="#sideNav#" label="sideNav">
			  <cfdump var="#cgi#" label="CGI">
			</cfmail>--->
		  
            <cfset v4renderBreadCrumbs("<span>/</span>", #sideNav#)>
            
	    </cfif>
    </div>
</div>