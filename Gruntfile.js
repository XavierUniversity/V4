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
			},
			prod: {
  			options: {
    			sassDir: '_src/sass',
    			cssDir: 'dist/stylesheets',
    			environment: 'production',
    			outputStyle: 'compressed'
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
		copy: {
  		main: {
    		files: [{
      		expand: true,
      		flatten: true,
      		src: ['_src/fonts/*'],
      		dest: 'dist/fonts'
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
		},
		cascadeDeploy: {
      'default': {
        options: {
          url: 'https://cascade.xavier.edu',
          site: 'Xavier University'
        },
        files: [
          {src: ['dist/javascripts/*'], site: '', dest: '_files/js', type: 'file', rewriteLinks: true, maintainAbsoluteLinks: true},
          {src: ['dist/stylesheets/*'], site: '', dest: '_files/css', type: 'file', rewriteLinks: true, maintainAbsoluteLinks: true}
        ]
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
	grunt.loadNpmTasks('grunt-contrib-copy');
	grunt.loadNpmTasks('grunt-cascade-deploy');
	
	grunt.registerTask('setup', ['jshint','concat', 'compass:dev', 'postcss', 'imagemin', 'copy']);
  // define default task
  grunt.registerTask('default', ['setup', 'browserSync', 'watch']);
  grunt.registerTask('deploy', ['jshint', 'concat', 'compass:prod', 'postcss', 'imagemin', 'copy', 'cascadeDeploy']);
};