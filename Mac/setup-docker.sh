#!/bin/zsh
#
# setup-brew.sh   -- macOS version
#
# ==============================================================================

source ~/.functions

message "setup-docker.sh" "Installing Docker using Homebrew"

which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing Homebrew" "Installing for the first time..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  message "Found Homebrew" "Updating and upgrading first..."

  brew update
  brew upgrade
fi

brew install --cask docker
sudo open /Applications/Docker.app

# ==============================================================================
exit 0
