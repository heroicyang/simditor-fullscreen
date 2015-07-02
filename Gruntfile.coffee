module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'
    name: "simditor-fullscreen"

    sass:
      styles:
        options:
          style: 'expanded'
          sourcemap: 'none'
          bundleExec: true
        files:
          'styles/<%= name %>.css': 'styles/<%= name %>.scss'

    coffee:
      src:
        options:
          bare: true
        files:
          'lib/<%= name %>.js': 'src/<%= name %>.coffee'
      spec:
        files:
          'spec/<%= name %>-spec.js': 'spec/<%= name %>-spec.coffee'

    umd:
      all:
        src: 'lib/<%= name %>.js'
        template: 'umd.hbs'
        amdModuleId: '<%= pkg.name %>'
        objectToExport: 'SimditorFullscreen'
        globalAlias: 'SimditorFullscreen'
        deps:
          'default': ['$', 'Simditor']
          amd: ['jquery', 'simditor']
          cjs: ['jquery', 'simditor']
          global:
            items: ['jQuery', 'Simditor']
            prefix: ''

    watch:
      styles:
        files: ['styles/*.scss']
        tasks: ['sass']
      spec:
        files: ['spec/**/*.coffee']
        tasks: ['coffee:spec']
      src:
        files: ['src/**/*.coffee']
        tasks: ['coffee:src', 'umd']
      jasmine:
        files: ['lib/**/*.js', 'spec/**/*.js']
        tasks: 'jasmine'

    jasmine:
      test:
        src: ['lib/**/*.js']
        options:
          outfile: 'spec/index.html'
          specs: 'spec/<%= name %>-spec.js'
          styles: 'styles/<%= name %>.css'
          vendor: [
            'vendor/bower/jquery/dist/jquery.min.js'
            'vendor/bower/simple-module/lib/module.js'
            'vendor/bower/simple-hotkeys/lib/hotkeys.js'
            'vendor/bower/simditor/lib/simditor.js'
          ]

  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-umd'

  grunt.registerTask 'default', ['sass', 'coffee', 'umd', 'jasmine', 'watch']
  grunt.registerTask 'test', ['sass', 'coffee', 'umd', 'jasmine']
