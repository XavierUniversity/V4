			</main>
		
		<!--- Close out the page wrapper --->
		</div>
		
		<footer>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3 col-sm-12 col-md-push-9">
						<div class="social-icons">
							<a href="http://www.facebook.com/XavierUniversity" target="_blank">
								<span class="fa fa-facebook" aria-label="Xavier University on Facebook"></span>
							</a>
							<a href="http://twitter.com/XavierUniv" target="_blank">
								<span class="fa fa-twitter" aria-label="Xavier University on Twitter"></span>
							</a>
							<a href="https://www.linkedin.com/groups?gid=65551&amp;trk=hb_side_g" target="_blank">
								<span class="fa fa-linkedin" aria-label="Xavier University LinkedIn Group"></span>
							</a>
							<a href="https://www.youtube.com/user/xavieruniversity" target="_blank">
								<span class="fa fa-youtube" aria-label="Xavier University YouTube Channel"></span>
							</a>
							<a href="http://instagram.com/xavieruniversity" target="_blank">
								<span class="fa fa-instagram" aria-label="Xavier University on Instagram"></span>
							</a>
						</div>
					</div>
					
					<div class="col-md-6 col-sm-12">
						<div itemscope itemtype="http://schema.org/EducationalOrganization">
							<p class="org" itemprop="name">Xavier University</p>
							<p class="address" itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
								<span itemprop="streetAddress">3800 Victory Parkway</span>
								<span><span itemprop="addressLocality">Cincinnati</span>, <span itemprop="addressRegion">OH</span> <span itemprop="postalCode">45207</span></span>	
								<span itemprop="telephone">513-745-3000</span>
							</p>
						</div>
						<p class="legal">&copy; <cfoutput>#dateFormat(now(),'YYYY')#</cfoutput> Xavier University</p>
					</div>
				</div>
			</div>
		</footer>
	
		<div class="backmatter">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-8 col-lg-9 nav-backmatter">
						<div class="footer-logo">
							<a href="/">
								<img src="<cfoutput>#mobileLogo#</cfoutput>" alt="Xavier University Home" />
							</a>
						</div>
						<div class="sitemap">
							<cfoutput>#footerAudienceHTML#</cfoutput>
						</div>
					</div>
					<div class="col-sm-4 col-lg-3 footer-cta">
						<div class="cta">
							<cfoutput>#ctaHTML#</cfoutput>
						</div>
					</div>
				</div>
			</div>
		</div>
		<cfoutput>#javascripts#</cfoutput>
		<cfif isDefined("pageFootScript")>
			<cfoutput>#pageFootScript#</cfoutput>
		</cfif>

	</body>
</html>