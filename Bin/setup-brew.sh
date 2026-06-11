#!/bin/zsh
#
# setup-brew.sh   -- macOS version
# ==============================================================================


source ~/.functions

message "setup-brew.sh" "Installing Homebrew using default script"

which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing Homebrew" "Installing for the first time..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  message "Homebrew installed" "Re-run setup-brew.sh in a fresh terminal window"

else
  message "Found Homebrew" "Updating, upgrading, installing Jekyll and others"

  brew update
  brew upgrade
  
  # eza (ls replacement), gh (github) are favorites
  brew install automake bison openssl readline libyaml gdbm libffi wget eza gh
  
  message "Homebrew update complete" "Reporting current tool versions:"
  python3 --version
  brew --version
fi


# ==============================================================================
exit 0
