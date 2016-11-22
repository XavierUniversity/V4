// Xavier University HTML Template
module.exports = function (grunt) {
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		jshint: {
			files:['Gruntfile.js', '_src/javascripts/**/*.js'],
			options: {
				reporter: require('jshint-stylish')
			}
		},
		concat:{
			main: {
				src: ['_src/javascripts/**/*.js'],
				dest: 'dist/javascripts/base.js'
			}
		},
		watch: {
			styles: {
				files: '_src/sass/**/*.scss',
				tasks: [
					'compass:dev', 'postcss'
				]
			},
			images: {
				files: '_src/images/**/*.{svg,png,jpg,gif}',
				tasks: [
					'imagemin'
				]
			},
			js: {
				files: '_src/javascripts/**/*.js',
				tasks: [
					'jshint', 'concat'
				]
			},
			html: {
				files: ['_src/includes/**/*.html', '_src/*.html'],
				tasks: [
					'includes'
				]
			}
		},
		compass: {
			dev: {
				options: {
					sassDir: '_src/sass',
					cssDir: 'dist/stylesheets',
					environment: 'development',
					outputStyle: 'nested'
				}
			}
		},
		includes: {
			files: {
			    src: ['_src/*.html'], // Source files
			    dest: 'dist', // Destination directory
			    cwd: '.',
			    flatten: true,
			    options: {
			    	silent: true
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
				src: 'dist/stylesheets/**/*.css'
			}
		},
		imagemin: {
			dynamic: {
				files: [{
					expand: true,
					cwd: '_src/images',
					src: ['**/*.{png,jpg,gif,svg}'],
					dest: 'dist/images/'
				}]
			}
		},
		browserSync: {
			dev: {
				bsFiles: {
					src: [
						'dist/stylesheets/*.css',
						'dist/javascripts/*.js',
						'dist/*.html'
					]
				},
				options: {
					watchTask:true,
					server: './dist'
				}
			}
		}
	});
	
	// load npm tasks
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-compass');
	grunt.loadNpmTasks('grunt-postcss');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-browser-sync');
	grunt.loadNpmTasks('grunt-includes');
	grunt.loadNpmTasks('grunt-contrib-imagemin');
	
    // define default task
    grunt.registerTask('default', ['browserSync', 'watch']);
};