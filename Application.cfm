<!--- Campus Alert Variables --->
<cfset showAlert 	= false>
<cfset campusAlert 	= "weather"><!--- can be weather, shooter, power, network, clear, custom, or NULL (generic alert) --->
<cfset alertDate 	= dateFormat(now(), 'MMMM DD YYYY')><!--- The date of the alert --->
<cfset alertURI		= "http://www.xavier.edu/safety"><!--- URI for more information --->
<cfset customMsg 	= "I am a custom message, I can contain <strong>HTML</strong> code too."><!--- if custom alert, add your text. Code is wrapped in a <p> tag --->


<cfset path = (CGI.SERVER_NAME EQ "localhost" OR CGI.SERVER_NAME EQ "webdev.xavier.edu" ? "" : "/Templates/temp-v4/" )>

<!---
	Functions -- To be moved, possibly.
	------------------
--->

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