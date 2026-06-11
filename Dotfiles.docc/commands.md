# Commands reference

**NOTE:** This is the commands file located in the `./Docs` folder.

This file includes notes about how to do things from past research, but not needed in the current version of dotfiles. This is just notes to myself for later, in case I need these.





# ========================================================================
# TODO: removing the creation of Homebrew folders - let Homebrew install do that
# Homebrew uses /opt/homebrew on ARM and /usr/local on Intel, and /opt/bin on Linux
# Create these directories "just in case" on macOS
# sudo mkdir -p /opt/homebrew/bin
# sudo mkdir -p /usr/local/bin

# Reset ownership, note the directory name does not end in / or /*
# sudo chown -R "$USER":admin /opt/homebrew
# sudo chown -R "$USER":admin /usr/local/bin

# Set the permissions for the folders (read for all, write for just me)
# sudo chmod 744 /opt/homebrew/bin
# sudo chmod 744 /usr/local/bin


# ========================================================================
# Create a symlink to Dropbox's location in CloudStore if valid
#
#if [[ -d "$HOME/Dropbox/" ]]; then
#  bullet "~/Dropbox alias exists. Delete symlink if broken, then re-run"
#else
#  if [[ -d "$HOME/Library/CloudStorage/Dropbox/" ]]; then
#    bullet "✅ Setup ~/Dropbox - Symlink to ~/Library/CloudStorage/Dropbox/"
#    ln -s $HOME/Library/CloudStorage/Dropbox $HOME/Dropbox
#  else
#    alert "Dropbox not installed" "Missing folder: ~/Library/CloudStorage/Dropbox/"
#  fi
#sfi


# ========================================================================
# NOTE: disabled the Dropbox alias setup
#
# Check if $HOME/Library/CloudStorage/Dropbox exists, and if so create symlinks
#if [[ -d "$HOME/Dropbox/" ]]; then
#  message "Setup ~/Dropbox (existed)" "If symlink is broken, manually delete and rerun"
#else
#  if [[ -d "$HOME/Library/CloudStorage/Dropbox/" ]]; then
#    message "Setup ~/Dropbox and ~/Code" "Symlink to ~/Library/CloudStorage/Dropbox/"
#    ln -s $HOME/Library/CloudStorage/Dropbox $HOME/Dropbox
#    ln -s $HOME/Library/CloudStorage/Dropbox/Code $HOME/Code
#  else
#    message "Dropbox not installed" "Directory not found: ~/Library/CloudStorage/Dropbox/"
#  fi
#fi



# ========================================================================
# Other ideas for defaults settings

# Save screenshots to the downloads folder
# defaults write com.apple.screencapture location -string “$HOME/Downloads”

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
# defaults write com.apple.screencapture type -string “png”

# Stops Xcode IDE from saving the workspace layout (window size, etc)
# defaults write com.apple.dt.Xcode IDEDisableStateRestoration -bool YES

# Removes the delay in hide/show the Dock setting
# defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder: show hidden files by default
# defaults write com.apple.finder AppleShowAllFiles -bool true

# Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true




# Add Ruby gem to the PATH -- lots of issues running gems lately
# TODO: Fix the installer for Ruby, probably need to switch to chruby tool
# See: https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/
# export PATH=`gem environment gemdir`/bin:$PATH

# Node.js and npm setup (this first part loads NVM)
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads nvm bash_completion
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# EXAMPLE SETTING WITH MULTIPLE COMPARES
# if [[ $SHELL != "/bin/bash" && $MACOS == 1 ]]; then
#    export PATH="$XDG_BIN_HOME:/opt/homebrew/bin:/opt/homebrew/opt/ruby/bin:$PATH"
# fi



// end of file.
