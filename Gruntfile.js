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
				dest: 'javascripts/base.js'
			}
		},
		watch: {
			styles: {
				files: '_src/sass/**/*.scss',
				tasks: [
					'compass:dev'
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
			}
		},
		compass: {
			dev: {
				options: {
					sassDir: '_src/sass',
					cssDir: 'stylesheets',
					environment: 'development',
					outputStyle: 'nested'
				}
			}
		},
		imagemin: {
			dynamic: {
				files: [{
					expand: true,
					cwd: '_src/images',
					src: ['**/*.{png,jpg,gif,svg}'],
					dest: 'images/'
				}]
			}
		},
		browserSync: {
			dev: {
				bsFiles: {
					src: [
						'stylesheets/*.css',
						'javascripts/*.js'
					]
				},
				options: {
					watchTask:true,
					server: './'
				}
			}
		}
	});
	
	// load npm tasks
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-compass');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-browser-sync');
	grunt.loadNpmTasks('grunt-contrib-imagemin');
	
    // define default task
    grunt.registerTask('default', ['browserSync', 'watch']);
};