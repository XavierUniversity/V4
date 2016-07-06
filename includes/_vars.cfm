<!--- Campus Alert Variables --->
<cfset showAlert 	= false>
<cfset campusAlert 	= "weather"><!--- can be weather, shooter, power, network, clear, custom, or NULL (generic alert) --->
<cfset alertDate 	= dateFormat(now(), 'MMMM DD YYYY')><!--- The date of the alert --->
<cfset alertURI		= "http://www.xavier.edu/safety"><!--- URI for more information --->
<cfset customMsg 	= "I am a custom message, I can contain <strong>HTML</strong> code too."><!--- if custom alert, add your text. Code is wrapped in a <p> tag --->

