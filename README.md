# gruntjs

A wercker step to execute commands using the grunt-cli.

You should have nodejs and npm installed and you have to add the `grunt`
package to your package.json.

As of version `2.0.0` this won't update npm anymore. If you require a newer npm
version install this before executing this step.

# What's new

Do not install npm as part of the installation anymore. If your npm version is
too old, update it manually using ascript step.

## Example Usage

In your [wercker.yml](http://devcenter.wercker.com/articles/werckeryml/) file under the `build` section:

``` bash
build:
  steps:
    - grunt:
        tasks: test
```

## Properties

### tasks
- type: string
- optional: true
- description: Tasks which should be run. You can use spaces to specify multiple tasks. If no tasks have been specified, then grunt-cli will run the `default` task.
- example: `tasks: jshint buster`

### gruntfile
- type: string
- optional: true
- description: Specify an alternate Gruntfile. By default, grunt looks in the source directory or it's parent directories for the nearest Gruntfile.js or Gruntfile.coffee file.

### stack
- type: boolean
- optional: true (default: false)
- description: Print a stack trace when exiting with a warning or fatal error.

### verbose
- type: boolean
- optional: true (default: false)
- description: Run grunt in verbose mode

### debug
- type: boolean
- optional: true (default: false)
- description: Enable debugging mode for tasks that support it.

### fail-on-warnings
- type: boolean
- optional: true (default: false)
- description: If grunt returns an error code of 6 (warning) then fail the build.

# Changelog

## 2.0.0

- Do not upgrade npm as part of the installation

## 1.0.0

- Add `fail-on-warnings` property.

## 0.1.0

- added: verbose option

## 0.0.9

- Fixed a bug in which `grunt` should have been installed via npm

## 0.0.8

- Use `grunt-cli` if it is installed in `./node_modules/grunt-cli`

## 0.0.7

- always update npm

## 0.0.6

- Remove support for PATH, use cwd instead

## 0.0.5

- Initial release
