module.exports = function (grunt){
	
	// Timing
	require('time-grunt')(grunt);
	// Configuration
	require('load-grunt-tasks')(grunt);
	
	grunt.initConfig({
		pkg: grunt.file.redJSON('package.json');
		
		// Other tasks
	});
	
}