module.exports = function (grunt){
	
	// Show execution time
	require('time-grunt')(grunt);
	
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		jshint: {
			files:['Gruntfile.js'], // Add more files to array
			options: {
				reporter: require('jshint-stylish')
			}
		},
		// Other tasks
		compass: {
			dev: {
				options: {
					sassDir: '_src/sass',
					cssDir: 'css',
					environment: 'development',
					outputStyle: 'nested'
					
				}
			},
			live: {
				options: {
					sassDir: '_src/sass',
					cssDir: 'css',
					environment: 'production',
					outputStyle: 'compressed',
					sourcemap: 'true'
				}
			}
		},
		postcss: {
			options: {
				processors: [
					require('autoprefixer')({
						browsers: ['last 2 versions']
					})
				]
			},
			dist: {
				src: 'css/**/*.css'
			}
		}
	});
	
	// Load tasks
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-compass');
	grunt.loadNpmTasks('grunt-postcss');
	
	// Register Tasks
	grunt.registerTask('check', ['jshint']);
	
};