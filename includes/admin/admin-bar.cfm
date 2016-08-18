<!--- 
	Template Name: V4 - Blue Blob
	Defines the new admin toolbar with utilizing the bootstrap navbar vs foundation 
	Needs minor tweaking as of 12/9/2014
--->
Admin bar
<cfinclude template="/campusuite25/admin/includes/user-permissions.cfm">
<cfinclude template="/campusuite25/modules/navigation_version.cfm">
<cfinclude template="/campusuite25/modules/template_version.cfm">
<cfif isdefined("session.user_id") AND session.user_id is not "">
	<!--- adding XSS header ---><!--- JZ 2014-01-29 --->
	<cfheader name="X-XSS-Protection" value="0">
	
	<!--- adding "hacked" logic to enable quick recompiling of scss files ---><!--- JZ 2013-01-22 --->
<!--- Killing it. No more compiling on the server. Not worth the risk anymore
		<cfif IsDefined("SESSION.admin_level") AND SESSION.admin_level IS 3>
			<cfsavecontent variable="v4TemplateScripts2">
				<script type="text/javascript">
					(function ($) {
						$(document).ready(function () {
							//if (jQuery.
							//keys !== undefined) {
								$(document).bind('keydown.Ctrl_d', function (e) {
									e.preventDefault();
									e.stopPropagation();
									window.location.href = '/campusuite25/lib/tools/scss/scripts/quick_compile.cfm?grp_id=<cfoutput>#SESSION.grp_id#</cfoutput>';
									return false;
								});
							//} else {
								console.log('Undefined');
							//}
						});
					})(jQuery);
				</script>
			</cfsavecontent>
		</cfif>
--->
	<!--- --->
	
	<!--- adding hack for default content approver, temporary fix for content approval stuff --->
	<cfset REQUEST.tempGlobalContentApprover = 0>
	<cftry>
		<cfif NOT IsDefined("APPLICATION.tempGlobalContentApprover") OR APPLICATION.tempGlobalContentApprover IS 0>
			<cfquery name="getContentApproverQ" datasource="#APPLICATION.dsn#">
				SELECT TOP 1
					fac.faculty_id AS faculty_id
				FROM
					faculty_tbl AS fac
					LEFT JOIN
							groups_tbl AS grps
						ON
							fac.owner_id = grps.grp_id
				WHERE
						grps.site_id = <cfqueryparam value="#APPLICATION.siteId#" cfsqltype="CF_SQL_INTEGER" />
					AND
						fac.email = 'csadmin@innersync.com';
			</cfquery>
		<cfelse>
			<cfquery name="getContentApproverQ" datasource="#APPLICATION.dsn#">
				SELECT TOP 1
					fac.faculty_id AS faculty_id
				FROM
					faculty_tbl AS fac
					LEFT JOIN
							groups_tbl AS grps
						ON
							fac.owner_id = grps.grp_id
				WHERE
						grps.site_id = <cfqueryparam value="#APPLICATION.siteId#" cfsqltype="CF_SQL_INTEGER" />
					AND
						fac.faculty_id = <cfqueryparam value="#APPLICATION.tempGlobalContentApprover#" cfsqltype="CF_SQL_INTEGER" />;
			</cfquery>
		</cfif>
		<cfset REQUEST.tempGlobalContentApprover = getContentApproverQ['faculty_id'][1]>
		<cfcatch>
			<cfset REQUEST.tempGlobalContentApprover = 0>
		</cfcatch>
	</cftry>
	<!--- --->
	
	<cfif not isDefined("in_data_module")>
		<cfset in_data_module = 0>
	</cfif>
    
	<!---Administration Buttons <cfif CGI.SCRIPT_NAME NEQ "/_application/admin/index.cfm"> --->
	<cfset count = ListLen(application.base_path, "\") + 1>
	<cftry>
		<cfset thisDirectory = "#ListGetAt(GetDirectoryFromPath(GetBaseTemplatePath()), count, "\")#">
		<cfcatch type="any">
			<cfset thisDirectory = "">
		</cfcatch>
	</cftry>
	
	<cfparam name="URL.draftView" default="NO">
	
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="z-index: 99999999999">
		<div class="container-fluid">
			<!--- Brand and menu toggle --->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#admin-nav">
					<span class="sr-only">Toggle Navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="/campusuite25/admin/index.cfm" class="navbar-brand">
					<img src="/campusuite25/images/dashboard/cs-adminbar-logo.png" alt="Campus Suite" style="height:25px;" />
				</a>
			</div><!--- navbar-header --->
		
			<!--- Left hand navigation items
				1. Drafts
				2. News (needs testing)
				3. Calendar (needs work)
				4. Faculty (needs work)
				5. Pages (default)
			--->
			<!--- Admin Nav bar - Content --->
			<div class="collapse navbar-collapse" id="admin-nav" style="z-index: 99999999999;">
				<!--- Left Navigation Items --->
				<ul class="nav navbar-nav">
					<!--- Drafts menu --->
					<cfif find("/drafts/", CGI.SCRIPT_NAME)>
						<cfinclude template="/Templates/temp-v4/includes/page-draft-buttons.cfm">
					<!--- News menu --->
					<cfelseif find("modules/news.cfm", CGI.SCRIPT_NAME)>
						<cfinclude template="/Templates/temp-v4/includes/news-draft-buttons.cfm">
					<!--- Calendar menu --->
					<cfelseif find("modules/calendar.cfm", CGI.SCRIPT_NAME)>
						<cfinclude template="/Templates/temp-v4/includes/calendar-draft-buttons.cfm">
					<!--- Faculty/Staff menu --->
				    <cfelseif find("modules/faculty.cfm", CGI.SCRIPT_NAME)>
						<cfinclude template="/Templates/temp-v4/includes/faculty-draft-buttons.cfm">
					<cfelse>
						<cfoutput>
							<cfif (isdefined("session.admin_level") and session.admin_level neq 0) OR userIsPageAdmin>
				          
								<cfif isdefined("session.area") AND session.area is "Nav Editor">
				                    <cfif navigationVersion eq 1>
								<li>
									<a href="/campusuite25/admin/nav_edit/backtopage.cfm?grp_id=#session.grp_id#" onclick="this.blur();">Back to Pages</a>
								</li>
				                    <cfelse>
								<li>
									<a href="/campusuite25/admin/nav_edit2/backtopage.cfm?grp_id=#session.grp_id#" onclick="this.blur();">Back to Pages</a>
								</li>
				                </cfif>
				                
				                <cfelse>       
				          
								<cfif session.folder is "/">
									<cfset draft_found = FileExists(expandPath("/drafts/#getFileFromPath(cgi.SCRIPT_NAME)#"))>
									<cfset draft_folder = "/drafts/">
								<cfelse>
									<cfset draft_found = FileExists(expandPath("/#session.folder#/drafts/#getFileFromPath(cgi.SCRIPT_NAME)#"))>        
									<cfset draft_folder = "/#session.folder#/drafts/">
								</cfif>
				          
								<cfset edit_page_type = "Main">
									<cfif (isdefined("session.access_list") AND listfind("#trim(session.access_list)#","#trim(session.grp_id)#") GT 0) or (isdefined("session.admin_level") and session.admin_level EQ 3)>
									<cfif draft_found>
								        <cfset draft_file = getFileFromPath(cgi.SCRIPT_NAME)>
							          	<cfset draft_path = "#draft_folder##draft_file#">
							
							          	<cfquery name="getDraft" datasource="#application.dsn#">
							                SELECT * FROM drafts_tbl
							                WHERE draft_file = '#draft_path#' AND site_id = #application.siteId#;
							            </cfquery>
							
							            <cfif getDraft.recordcount gt 0>
											<li>
												<a class="basicBtnMain" onClick="this.blur();"  href="#draft_path#">View Draft</a>
											</li>
							    	        <cfset edit_page_type = "Gray">
							            </cfif>
									</cfif>
								</cfif>
				          
								<cfset lock_file = cgi.SCRIPT_NAME & ".csl">
								<cfset lock_file = expandPath(lock_file)>
				          
								<!--- adding better checking, mainly timing out an old lock ---><!--- JZ 2014-10-17 --->
								<cftry>
								<cfif FileExists(lock_file)>
									<cfset info = GetFileInfo(lock_file)>
									<cfif DateCompare(info.LastModified, DateAdd("h", -2, Now())) EQ -1>
										<cfset FileDelete(lock_file)>
									</cfif>
								</cfif>
								<cfcatch></cfcatch>
								</cftry>
				          
								<cfif (isdefined("session.access_list") AND listfind("#trim(session.access_list)#","#trim(session.grp_id)#") GT 0) or (isdefined("session.admin_level") and session.admin_level EQ 3)>
							
				            
									<cfif (not isDefined("url.pe") and in_data_module eq 0) AND thisDirectory NEQ "campusuite" AND thisDirectory NEQ "campusuite25" and NOT isDefined("hidePageEdit")>
						            	<cfif (session.admin_level eq 1 and not draft_found) or (session.admin_level eq 2 or session.admin_level eq 3) OR userIsPageAdmin>
											<cfif not fileExists(lock_file)>
												<li>
													<a onClick="this.blur(); checkForm(document.newsform); return false;" href="/campusuite25/modules/page_edit.cfm?grp_id=#session.grp_id#&return=#cgi.SCRIPT_NAME#&pe=1">
														<cfif session.admin_level eq 1 AND NOT userIsPageAdmin>
															Create Draft
														<cfelse>
															Edit This Page
														</cfif>
													</a>
												</li>
						                    <cfelse>
						                        <cffile action="read" file="#lock_file#" variable="edited_by">
						                        <cfquery name="getEditor" datasource="#application.dsn#">
						                            SELECT faculty_id, l_name, f_name, email FROM faculty_tbl WHERE faculty_id = #edited_by#
						                        </cfquery>
						                        <cfif getEditor.faculty_id is not session.user_id>
						                            <cfset locked = 1>
						                        <cfelse>
						                        <li>
													<a onClick="this.blur(); checkForm(document.newsform); return false;" href="/campusuite25/modules/page_edit.cfm?grp_id=#session.grp_id#&return=#cgi.SCRIPT_NAME#&pe=1">
														<cfif session.admin_level eq 1 AND NOT userIsPageAdmin>
															Create Draft
														<cfelse>
															Edit This Page
														</cfif>
													</a>
												</li>
						                        </cfif>
						                    </cfif>
										</cfif>
									</cfif>
				            
									<cfif not isDefined("url.ne") and NOT isDefined("hideNavEdit")>
										<cfif NOT isDefined("url.pe")>
											<cfif not isDefined("locked")>
												<cfset nav_found = 0>
				
							                    <cfif isDefined("xml_path")>
													<cfset nav_found = fileExists(xml_path)>
												</cfif>
				                   
												<cfif nav_found or navigationVersion eq 2>
												<li>
													<a onClick="this.blur(); checkForm(document.newsform); return false;"  href="/campusuite25/modules/nav_edit.cfm?grp_id=#session.grp_id#&return=#cgi.SCRIPT_NAME#&ne=1">Edit Navigation</a>
												</li>
							                    </cfif>
											</cfif>
										</cfif>
									</cfif>
							
							
									<cfif session.admin_level gte 2 and (isDefined("session.newsletter") and session.newsletter eq 1)>
										<li>
											<a href="/campusuite25/global-components/aggregator/aggregator-create-email.cfm?g=#SESSION.grp_id#&s=#cgi.SCRIPT_NAME#" target="_blank">Create Email</a>
										</li>
						            </cfif>
								</cfif>
							</cfif>
						</cfif>
				
						<cfif isDefined("locked") and locked eq 1>
							<li>
								<p class="navbar-text">
									<i class="fa fa-lock"></i> <a href="mailto:#getEditor.email#">#getEditor.f_name# #getEditor.l_name#</a> is editing this page.
								<cfif session.admin_level eq 2 or session.admin_level eq 3>
									<a href="/campusuite25/admin/page_edit2/clear_lock.cfm?return=#cgi.SCRIPT_NAME#">Clear Lock</a>
								</cfif>
								</p>
							</li>
						</cfif>
						</cfoutput>				
					</cfif>
				</ul>
				
				<!--- Right Navigation Items (Profile and User information) --->
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><cfset userName()> <span class="caret"></span></a>
						
						<ul class="dropdown-menu" role="menu">
				            <li><a href="/campusuite25/admin/index.cfm">Dashboard</a></li>
	            
				            <cfif (isdefined("session.access_list")) and session.admin_level neq 0>
								<cfif fileExists(expandPath("/members/member-profile.cfm")) or (isDefined("application.showProfileLink") and application.showProfileLink eq 1) 
								OR fileExists(expandPath("/members/index.cfm"))>
									<cfif isDefined("application.showProfileLink")>
										<li><a href="/members/index.cfm">Profile</a></li>
									<cfelse>
										<cfif not isDefined("application.hideProfileLink") or (isDefined("application.hideProfileLink") and application.hideProfileLink eq 0)>
											<li><a href="/members/index.cfm">Profile</a></li>
										</cfif>
									</cfif>
								</cfif>
								
								<li><a href="http://www.campusuite.com/support/Using-Documentation.cfm" target="_blank">User Guide</a></li>
				            	<!--- XU Change ---><!--- JZ 2013-12-11 --->
				            	<!---<li><a href="/campusuite25/admin/support/cs-form.cfm?form=support&attach=1" target="_blank">Submit a Ticket</a></li>--->
							</cfif>
							<cfif isdefined("session.user_id") AND session.user_id is not "">
					            <cfset redir_args = replacenocase(cgi.QUERY_STRING, "&", "|", "all")>
								<li>
									<cfoutput><a href="/campusuite25/login/logoff.cfm?loggedoff=yes&rand=#rand()#&goto=#cgi.script_name#<cfif cgi.query_string is not "">!#redir_args#</cfif>">
										Logout
									</a></cfoutput>
								</li>
							</cfif>
				        </ul>
					</li>
				</ul><!--- navbar-right (user menu) --->
			</div><!--- #admin-nav --->
		</div><!--- .container-fluid --->
	</nav><!--- .navbar --->
</cfif>