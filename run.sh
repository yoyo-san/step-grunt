#!/bin/sh

# First make sure bundler is installed
if ! type grunt &> /dev/null ; then
    info "grunt-cli not installed, trying to install it through npm"

    if ! type npm &> /dev/null ; then
        fail "npm not found, make sure you have npm or grunt-cli installed"
    else
        info "npm is available"
        debug "npm version: $(npm --version)"

        info "installing grunt-cli"
        sudo npm install -g --silent grunt-cli
    fi
else
    info "grunt is available"
    debug "npm version: $(grunt --version)"
fi

grunt_command="grunt"
grunt_working_path=""

# Parse some variable arguments
if [ "$WERCKER_GRUNT_DEBUG" = "true" ] ; then
    grunt_command="$grunt_command --debug"
fi

if [ "$WERCKER_GRUNT_STACK" = "true" ] ; then
    grunt_command="$grunt_command --stack"
fi

if [ -n "$WERCKER_GRUNT_GRUNTFILE" ] ; then
    grunt_command="$grunt_command --gruntfile $WERCKER_GRUNT_GRUNTFILE"
fi

if [ -n "$WERCKER_GRUNT_TASKS" ] ; then
    grunt_command="$grunt_command $WERCKER_GRUNT_TASKS"
fi

# Figure out the working directory
if [ -n "$WERCKER_GRUNT_PATH" ] ; then
  grunt_working_path="$WERCKER_GRUNT_PATH"
else
  grunt_working_path="$WERCKER_SOURCE_DIR"
fi

info "Switching to path: $grunt_working_path"
cd $grunt_working_path

debug "$grunt_command"
$grunt_command

if [[ $? -ne 0 ]]
then
    warn "$result"
    fail "grunt command failed"
else
    success "finished $grunt_command"
fi