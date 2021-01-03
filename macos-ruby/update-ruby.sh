#!/bin/zsh
#
# update-ruby.sh
#
# Import the default functions used in these scripts
source ${HOME}/.functions
status "update-ruby.sh" "Checking current installs of \"brew\" and \"rbenv\""

# ==============================================================================
# This script will install Ruby, rbenv, and Jekyll (blogging platform)
which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  # Install Homebrew
  error "Missing Homebrew" "Re-run dot-install.sh"
  exit 0
fi

which -s rbenv &> /dev/null
if [[ $? != 0 ]] ; then
  # Install Homebrew
  error "Missing rbenv" "Re-run dot-install.sh"
  exit 0
fi


CURRENT_RUBY=$(ruby -v 2> /dev/null)
status "Ruby -v" "$CURRENT_RUBY"

# Install some gems (Jekyll and Bundler to start) spawned from new shell
# The new shell allows the rbenv environment to be setup, so the new
# Ruby install is what is used, rather than the system Ruby that doesn't
# allow the user to install their own gems (write protected system)
bullet "Installing Bundler gem..."
gem install bundler

bullet "Installing Jekyll gem..."
gem install bundler



# ==============================================================================
exit 0


