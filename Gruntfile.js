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
			main: {
				src: ['_src/js/**/*.js'],
				dest: 'js/main.js'
			},
			vendor: {
				// combine some vendor scripts for production, to reduce requests
				src: [
					'bower_components/devbridge-autocomplete/dist/jquery.autocomplete.js',
					'bower_components/owl.carousel/dist/owl.carousel.js',
					'bower_components/aos/dist/aos.js'
				],
				dest: 'js/vendor.js'
			}
		},
		uglify: {
			options: {
				banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
					'<%= grunt.template.today("yyyy-mm-dd") %> */\n',
				sourceMap: true
			},
			prod: {
				files: {
					'js/main.min.js' : ['js/main.js'],
					'js/vendor.min.js': ['js/vendor.js'],
					'js/plugins.min.js' : ['js/plugins.js']	
				}
			}	
		},
		// Image tasks
		imagemin: {
			dynamic: {                         // Another target
				files: [{
					expand: true,                  // Enable dynamic expansion
					cwd: '_src/img/',                   // Src matches are relative to this path
					src: ['**/*.{png,jpg,gif}'],   // Actual patterns to match
					dest: 'img/'                  // Destination path prefix
				}]
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
		copy: {
			main: {
				files: [
					{
						expand: true,
						flatten: true,
						src: ['bower_components/fontawesome/fonts/*'],
						dest: 'fonts/',
						filter: 'isFile'
					}
				]
			}	
		},
		
		// Watch should always be the last task, just because.
		watch: {
			css: {
				files: ['_src/sass/**/*.{scss,sass}'],
				tasks: ['compass:dev', 'newer:postcss']
			},
			js: {
				files: ['_src/js/**/*.js'],
				tasks: ['newer:jshint', 'newer:concat:main', 'newer:uglify']
			},
			images: {
				files: ['_src/img/**/*.{svg,png,jpg,gif}'],
				tasks: ['newer:imagemin']
			}
		}
	});
	
	// Load tasks
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-newer');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-imagemin');
	grunt.loadNpmTasks('grunt-contrib-compass');
	grunt.loadNpmTasks('grunt-postcss');
	grunt.loadNpmTasks('grunt-contrib-copy');
	grunt.loadNpmTasks('grunt-contrib-watch');
	
	// Register Tasks
	grunt.registerTask('check', ['jshint']);
	grunt.registerTask('default', ['newer:jshint', 'compass:dev', 'newer:postcss', 'newer:jshint', 'newer:concat:main', 'newer:uglify', 'watch']);
};