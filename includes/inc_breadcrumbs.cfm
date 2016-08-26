<!--- 
	Template Name: V4 - Blue Blob
--->
<div class="breadcrumbs">
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
    		
    		<cfif session.folder is not "/"><span>/</span> <cfoutput><a href="/#session.folder#/">#session.department#</a></cfoutput></cfif>
			<cfset sideNav = CreateObject("component","campusuite25.objects.navigation.NavigationList").load(session.grp_id)>
            
            <cfset v4renderBreadCrumbs("<span>/</span>", sideNav)>
    	<cfcatch>
    		<!--- <cfset errorEmail("mcmulleng@xavier.edu;lieslandr@xavier.edu", "V4 Breadcrumb Error", true)> --->
    	</cfcatch>
    	</cftry>
    </cfif>
</div>