<cfif isDefined("pageType") and pageType IS 'homepg'>
	<!--- 	No navigational elements here. --->
<cfelse>
	<cfif pagetype is 'fullpg' or (isDefined('module') and (module IS 'blogXU' or module is 'blog' or module is 'cdn'))>
		</div>
	<cfelse>
		</article><!--- Content area ---->
		<!--- Add navigation --->	
		<div id="subnav" class="subnav-container">
			<a class="nav-jump scroll" href="#content">Back To Top <span class="fa fa-angle-up fa-lg" aria-hidden="true"></span></a>
			
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