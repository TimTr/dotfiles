#!/bin/zsh
#
# setup-ruby.sh   -- macOS version (simple version, installs latest)

source ${HOME}/.functions
message "setup-ruby.sh" "Running [brew install ruby] instead of [rbenv]"
bullet "The latest Ruby is installed via this script and put first in PATH"

which -s brew
if [[ $? != 0 ]] ; then
  error "Missing Homebrew" "Must first install Homebrew before installing Ruby"
  exit 0
fi

brew install ruby

# Update to the latest version of Ruby Gems installers
sudo gem update



# TODO: below may require Terminal is restarted once before it succeeds?

# ==============================================================================
# Install some gems (Jekyll and Bundler to start)
which -s bundler &> /dev/null
if [[ $? != 0 ]] ; then
  bullet "Installing Bundler" "Installing the Bundler gem for the first time"
  sudo gem install bundler
else
  message "Updating Bundler" "Updating the Bundler gem to latest version"
  sudo gem update bundler
fi

which -s jekyll &> /dev/null
if [[ $? != 0 ]] ; then
  bullet "Installing Jekyll" "Installing the Jekyll gem for the first time"
  sudo gem install jekyll
else
  bullet "Updating Jekyll" "Updating the Jekyll gem to latest version"
  sudo gem update jekyll
fi



# ==============================================================================
exit 0
