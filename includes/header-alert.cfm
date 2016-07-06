<div class="campus-alert">
    <cfswitch expression="#campusAlert#">
    	<cfcase value="weather">
	    	<cfoutput><p><strong>Campus Closed on #alertDate#.</strong><br />
				Xavier University is closed today, #alertDate#, due to inclement weather. For more information, visit <a href="#alertUri#">#alertUri#</a></p></cfoutput>
    	</cfcase>
    	<cfcase value="shooter">
	    	<cfoutput><p><strong>CAMPUS ALERT!</strong> <br />
		    	SHELTER IN PLACE IMMEDIATELY. Armed intruder @ Xavier University. Police are responding. More to follow. <a href="#alertUri#">#alertUri#</a> #alertDate#</p></cfoutput>
    	</cfcase>
    	<cfcase value="power">
	    	<cfoutput><p><strong>Power Outage</strong> @ Xavier University.<br />
		    	We are aware of power outage. Repairs underway. For emergencies call [Phone Number]. More info <a href="#alertUri#">#alertUri#</a>.</p></cfoutput>
    	</cfcase>
    	<cfcase value="network">
	    	<cfoutput><p><strong>Email Outage</strong> #alertDate#<br />
		    	Xavier University email/network systems down. Techs are working towards a fix. More info <a href="#alertUri#">#alertUri#</a></p></cfoutput>
    	</cfcase>
    	<cfcase value="clear">
	    	<cfoutput><p><strong>ALL CLEAR</strong> @ Xavier University. Situation has been resolved. Resume normal activity. More info <a href="#alertUri#">#alertUri#</a>.</p></cfoutput>
    	</cfcase>
    	<cfcase value="custom">
	    	<p><cfif isDefined("customMsg") and customMsg NEQ ""><cfoutput>#customMsg#</cfoutput></cfif></p>
    	</cfcase>
    	<cfdefaultcase>
	    	<cfoutput><p><strong>Campus Alert</strong> @ Xavier University Shelter in place. Lock doors/windows. Await further info. #alertDate# - <a href="#alertUri#">#alertUri#</a> for more information.</p></cfoutput>
    	</cfdefaultcase>
    </cfswitch>
</div>