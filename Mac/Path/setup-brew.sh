#!/bin/zsh
#
# setup-brew.sh   -- macOS version
#
# ==============================================================================

source ~/.functions

message "setup-brew.sh" "Installing Homebrew using default script"

which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing Homebrew" "Installing for the first time..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  message "Found Homebrew" "Updating, upgrading, installing Jekyll and others"

  brew update
  brew upgrade
  brew install automake bison openssl readline libyaml gdbm libffi wget
  brew install eza

  # Install ruby gems, specifically Jekyll for blogs
  gem update
  gem install jekyll
  
  message "Homebrew update complete" "Reporting current versions:"
  python3 --version
  ruby --version
  jekyll --version
fi


# ==============================================================================
exit 0
