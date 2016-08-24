<cfif isDefined("pageType") and pageType IS 'homepg'>
	<!--- 	No navigational elements here. --->
	</section><!--- content section --->
<cfelse>
	<cfif pagetype is 'fullpg' or (isDefined('module') and (module IS 'blogXU' or module is 'blog' or module is 'cdn'))>
		</div>
	<cfelse>
		</div><!--- Content area ---->
		<!--- Add navigation --->	
		<div id="subnav" class="subnav-container">
			<div class="subnav-top center-block text-center visible-xs-block visible-sm-block">
				<a class="scroll" href="#page">Back To Top <span class="fa fa-angle-up fa-lg"></span></a>
			</div>
			
			<cfif (pageType is "secondaryPg" OR pageType is "full") and isDefined("sideNav")>
				<div class="col-md-3 col-md-pull-9">
					<div class="subnav">
						<cfset secondaryNav()>
					</div>
				</div>
			</cfif>
		</div><!--subnav-->
	</cfif>
	</div><!--- content row --->
</cfif>
</section>
<!--- Close out CS --->

<!--- Footer --->
<cfinclude template="globals/footer.cfm">