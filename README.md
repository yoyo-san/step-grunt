# gruntjs

A wercker step to execute commands using the grunt-cli.

You should have nodejs installed and you have to add the `grunt` package to your package.json.

## Arguments

### tasks
- type: string
- optional: true
- description: Tasks which should be run. You can use spaces to specify multiple tasks. If no tasks have been specified, then grunt-cli will run the `default` task. 
- example: `tasks: jshint buster`

### gruntfile
- type: string
- optional: true
- description: Specify an alternate Gruntfile. By default, grunt looks in the source directory or it's parent directories for the nearest Gruntfile.js or Gruntfile.coffee file.

### debug
- type: boolean
- optional: true (default: false)
- description: Enable debugging mode for tasks that support it.

### stack
- type: boolean
- optional: true (default: false)
- description: Print a stack trace when exiting with a warning or fatal error.