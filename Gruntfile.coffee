module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
        files: [
          expand: true
          src: ['loadthis.litcoffee']
          ext: '.js'
        ]
    watch:
      options:
        atBegin: true
      coffee:
        files: ['queueup.litcoffee']
        tasks: ['coffee']
    bump:
      options:
        files: ['package.json', 'bower.json']
        commit: true
        commitFiles: ['package.json', 'bower.json']
        createTag: true
        push: true

  # Load grunt plugins
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-bump'

  # Define tasks.
  grunt.registerTask 'build', ['coffee']
  grunt.registerTask 'default', ['build']
