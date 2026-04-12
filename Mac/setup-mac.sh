#!/bin/zsh
#
# setup-macos.sh - the macOS version
echo
source "$DOTFILES/Mac/Root/dot-functions.sh"


message "🔔 Environment:" "Locations being used for this install of Dotfiles"
bullet "DOTFILES = $DOTFILES"
bullet "Run location = ${0:a:h}"
bullet "git config --global user.name = \"$(git config --get user.name)\""
bullet "git config --global user.email = \"$(git config --get user.email)\""


# ==============================================================================
# Require that Xcode is installed and selected before proceeding
if xcode-select -p &> /dev/null
then
  bullet "xcode-select -p = $(xcode-select -p)"
else
  error "❌ Install Xcode, run xcode-select -p, and then re-run setup.sh"
  exit 0
fi



# ==============================================================================
# Require `zsh` as the default on macOS, and set the default shell if needed
if [ $SHELL != "/bin/zsh" ]; then
  chsh -s /bin/zsh
  echo "❌ Script has set default shell to ZSH, now re-run setup.sh"
  exit 0
fi


# ==============================================================================
message "📂 Creating directories" "Creating and/or setting file permissions"

# Claim ownership of all my dotfiles
chown -R $USER $DOTFILES     2> /dev/null

# Make all directories (-type d) 755 executable, files (-type f) as 644
find $DOTFILES -type d -print0 | xargs -0 chmod 755
find $DOTFILES -type f -print0 | xargs -0 chmod 644

# Make all .sh files (-type f) also executable
find $DOTFILES -name "*.sh" -type f -print0 | xargs -0 chmod 755

# Get rid of the quarantine bit (which occasionally gets set via downloads)
xattr -d com.apple.quarantine $DOTFILES/* 2> /dev/null


# ==============================================================================
# Create XDG:  https://specifications.freedesktop.org/basedir/latest/
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.local/cache
export XDG_BIN_HOME=$HOME/.local/bin

# mkdir -m 700 -p folder



if [[ -d "$HOME/.local/bin" ]]; then
  bullet "$HOME/.local/bin exists. Added to the PATH for user content"
else
  mkdir -p $HOME/.local/bin
  chown -R "$USER":admin $HOME/.local/bin
  chmod 0700 $HOME/.local/bin
  message "✅ Created $HOME/local/bin and (will) add it to PATH"
fi

# Create ~/Developer folder in which to put local code repositorities
if [[ -d "$HOME/Developer/" ]]; then
  bullet "$HOME/Developer exists. Use this folder for personal repositories"
else
  mkdir ~/Developer
  message "✅ Created $HOME/Developer - use this folder for personal developer work"
fi

# Create a ~/Documents folder if it doesn't exist already (on macOS likely does)
if [[ -d "$HOME/Documents/" ]]; then
  bullet "$HOME/Documents exists. Use this folder for work repositories"
else
  mkdir ~/Documents
  message "✅ Created $HOME/Documents - use this folder for work repositories"
fi



# ==============================================================================
# Check if the ~/local.sh file exists, if not then copy the template to $HOME
if [[ -f "$XDG_CONFIG_HOME/local.sh" ]]; then
  bullet "$XDG_CONFIG_HOME/local.sh file exists. Delete the file and re-run to install from template"
else
  message "✅ Installing $XDG_CONFIG_HOME/local.sh - Creating new from ./dotfiles/Mac/Root/local.sh"
  cp $DOTFILES/Mac/Root/local.sh $XDG_CONFIG_HOME/local.sh
fi


# ==============================================================================
message "✅ Setup root dot-files" "Overwriting existing files at $HOME"
cp $DOTFILES/Mac/Root/dot-zshrc.sh $HOME/.zshrc
cp $DOTFILES/Mac/Root/dot-zshenv.sh $HOME/.zshenv
cp $DOTFILES/Mac/Root/dot-aliases.sh $HOME/.aliases
cp $DOTFILES/Mac/Root/dot-functions.sh $HOME/.functions

#  Mac-specific Git configuration files (assumes ./Documents for work repos)
cp $DOTFILES/Mac/Root/dot-gitconfig $HOME/.gitconfig
cp $DOTFILES/Mac/Root/dot-gitconfig-work $HOME/Documents/.gitconfig-work

# Common Git settings across platforms, and register those settings
cp $DOTFILES/Common/Root/dot-gitignore $HOME/.gitignore
git config --global core.excludesfile ~/.gitignore

# Common app settings across platforms
cp $DOTFILES/Common/Root/dot-vimrc $HOME/.vimrc

echo "This dummy file silences the [new shell] messages\n" >> $HOME/.hushlogin


# ==============================================================================
message "✅ Copy scripts to PATH" "Using $XDG_BIN_HOME for user scripts"
cp $DOTFILES/Mac/Bin/* $XDG_BIN_HOME


# ==============================================================================
message "✅ Setup app preferences" "Overwriting Terminal, Xcode, and other settings"

# Copy app settings
cp $DOTFILES/Mac/Preferences/* $HOME/Library/Preferences/

# Copy Xcode preferences (fails silently if no Xcode installed)
cp -R $DOTFILES/Mac/Xcode/* $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/ 2> /dev/null

# ==============================================================================
# on MacOS, eza will look for the theme file in ~/Library/Application Support/eza
# by default. That directory can be overridden by setting EZA_CONFIG_DIR.
# TODO: set this up on macOS


# ==============================================================================
message "✅ Setup defaults" "Adding paths and variables to .zshenv"
echo " " >> ~/.zshenv
echo "# Add global DOTFILES pointing Dotfiles install folder" >> ~/.zshenv
echo "export DOTFILES=$DOTFILES" >> ~/.zshenv

# Example Xcode defaults:  https://github.com/ctreffs/xcode-defaults
# Xcode always opens with the "Welcome to Xcode" window, not last project
defaults write com.apple.dt.Xcode ApplePersistenceIgnoreState -bool YES

# Sets Xcode to show extensions for a few additional file types
# FORMAT IS IMPORTANT! Use single-quote, comma + space , no space at end.
defaults write com.apple.dt.Xcode IDEFileExtensionDisplayShowOnlyList '(c, cc, cpp, h, hpp, m, mm, gif, icns, jpeg, jpg, png, tiff, sh, md, html, css, js)'

# Set macOS to not write .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Set macOS to not write .DS_Store files on USB drives
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool TRUE


# ==============================================================================
echo
message "🎉 Success!" "Restart Terminal and run setup-brew.sh and setup-ruby.sh"
echo

## End of file.
exit 0






# ==============================================================================
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


# ==============================================================================
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


# ==============================================================================
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



# ==============================================================================
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
