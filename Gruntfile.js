module.exports = function (grunt){
	
	// Show execution time
	require('time-grunt')(grunt);
	
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		// JS tasks
		jshint: {
			files:['Gruntfile.js', '_src/js/**/*.js'], // Add more files to array
			options: {
				reporter: require('jshint-stylish')
			}
		},
		concat: {
			options: {
				banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
					'<%= grunt.template.today("yyyy-mm-dd") %> */\n',
				separator: ';\n',
				sourceMap: true
				
			},
			main: {
				src: ['_src/js/**/*.js'],
				dest: 'js/main.js'
			},
			vendor: {
				// combine some vendor scripts for production, to reduce requests
				src: [
					'bower_components/devbridge-autocomplete/dist/jquery.autocomplete.js',
					'bower_components/owl.carousel/dist/owl.carousel.js'
				],
				dest: 'js/vendor.js'
			}
		},
		
		// CSS tasks
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
			},
			clean: {
				options: {
					clean: true
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
		},
		// Watch should always be the last task.
		watch: {
			css: {
				files: ['_src/css/**/*.{scss,sass}'],
				tasks: ['compass:dev', 'postcss']
			},
			js: {
				files: ['_src/js/**/*.js'],
				tasks: ['jshint', 'concat:main']
			}
		}
	});
	
	// Load tasks
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-concat');
	
	grunt.loadNpmTasks('grunt-contrib-compass');
	grunt.loadNpmTasks('grunt-postcss');
	grunt.loadNpmTasks('grunt-contrib-watch');
	
	// Register Tasks
	grunt.registerTask('init', ['concat:vendor']);
	grunt.registerTask('check', ['jshint']);
	
};