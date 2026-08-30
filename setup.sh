#!/bin/bash
#
#  'setup.sh' is used by GitHub and other VMs at startup
#
#  This script is setup to launch using the BASH shell since it is
#  common across supported platforms. Likely works in zsh as well.
#  On macOS, `zsh` is the default. Most Linux systems default to `bash`.
# =============================================================================

echo
# Set DOTFILES value to be the directory in which `./setup.sh` was run
export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source setup files, note that profile.sh (.profile) works in all shells
source "${DOTFILES}/Shell/profile.sh"
source "${DOTFILES}/Shell/functions.sh"


# =============================================================================
# Running output (first the setup configuration)
message "🟢 \$DOTFILES =" "${DOTFILES}"


# =============================================================================
# Create directories to match the XDG definitions in .profile
# XDG reference:  https://specifications.freedesktop.org/basedir/latest/
message "📂 Directories" "Creating and configuring XDG and other directories"

mkdir -p   $XDG_BIN_HOME    2> /dev/null
chmod 0700 $XDG_BIN_HOME
bullet "User scripts PATH: $XDG_BIN_HOME "

mkdir -p $XDG_CONFIG_HOME 2> /dev/null
bullet "App config folder: $XDG_CONFIG_HOME "

mkdir -p $XDG_DATA_HOME    2> /dev/null
mkdir -p $XDG_STATE_HOME   2> /dev/null
mkdir -p $XDG_CACHE_HOME   2> /dev/null


# =============================================================================
# Create default directories for common work
if [[ -d "$HOME/Code/" ]]; then bullet "Personal projects: $HOME/Code"
else
    mkdir $HOME/Code
    message "✅ $HOME/Code : created folder for personal development work"
fi

if [[ -d "$HOME/Documents/" ]]; then bullet "Work repositories: $HOME/Documents"
else
    mkdir $HOME/Documents
    message "✅ $HOME/Documents : created for work repositories"
fi


# =============================================================================
# Claim ownership of all my dotfiles
chown -R $USER $DOTFILES     2> /dev/null

# Make all directories (-type d) 755 executable, files (-type f) as 644
find $DOTFILES -type d -print0 | xargs -0 chmod 755
find $DOTFILES -type f -print0 | xargs -0 chmod 644

# Make all .sh files (-type f) also executable
find $DOTFILES -name "*.sh" -type f -print0 | xargs -0 chmod 755

# Get rid of the quarantine bit (which occasionally gets set via downloads)
xattr -d com.apple.quarantine $DOTFILES/* 2> /dev/null


# =============================================================================
# Shell:  copy the global files that work on both macOS and Linux
bullet "Copying .profile, .zshrc, and others to override root files"
cp $DOTFILES/Shell/profile.sh $HOME/.profile
cp $DOTFILES/Shell/zshrc.sh $HOME/.zshrc
cp $DOTFILES/Shell/zshenv.sh $HOME/.zshenv
cp $DOTFILES/Shell/zprofile.sh $HOME/.zprofile
cp $DOTFILES/Shell/aliases.sh $HOME/.aliases
cp $DOTFILES/Shell/functions.sh $HOME/.functions
cp $DOTFILES/Shell/profile.local.sh $HOME/.profile.local


# =============================================================================
# XDG based ./config filder:  ommon app settings across platforms
mkdir -p $HOME/.config 2> /dev/null
cp -r $DOTFILES/Config/* $HOME/.config

# =============================================================================
# Zed:  ommon app settings across platforms
# mkdir -p $HOME/.config/zed/themes 2> /dev/null
# cp $DOTFILES/Zed/settings.json $HOME/.config/zed
# cp $DOTFILES/Zed/zed-theme*.json $HOME/.config/zed/themes


# =============================================================================
# Terminals: cross-platform CMUX and Ghostty terminal settings install
# mkdir -p $XDG_CONFIG_HOME/ghostty/themes 2> /dev/null
# cp $DOTFILES/Terminals/ghostty.config ~/.config/ghostty/config
# cp $DOTFILES/Terminals/ghostty-timtr-theme ~/.config/ghostty/themes/TimTr


# =============================================================================
# Copy VSCode settings -- commented out while using GitHub sync
# cp $DOTFILES/VSCode/settings.json "$HOME/Library/Application Support/Code/User/"


# =============================================================================
# Copy dotfiles custom scripts into the additional PATH folder
cp $DOTFILES/Bin/* $XDG_BIN_HOME


# =========================================================================
# Add the DOTFILES environment setting to the end of the .profile file
echo " " >> $HOME/.profile
echo "# Set DOTFILES to point at this install folder" >> $HOME/.profile
echo "export DOTFILES=$DOTFILES" >> $HOME/.profile


# =============================================================================
# Setup Git with customization for platform or work directories
[[ $MACOS == 1 ]] && cp $DOTFILES/Git/gitconfig-mac $HOME/.gitconfig
[[ $LINUX == 1 ]] && cp $DOTFILES/Git/gitconfig-linux $HOME/.gitconfig

cp $DOTFILES/Git/gitignore $HOME/.gitignore
cp $DOTFILES/Git/gitconfig-work $HOME/Documents/.gitconfig-work
git config --global core.excludesfile $HOME/.gitignore


# =============================================================================
# Setup platform-specific bits
[[ $MACOS == 1 ]] && source "$DOTFILES/Mac/setup-mac.sh"
[[ $LINUX == 1 ]] && source $DOTFILES/Linux/setup-linux.sh


# =============================================================================
# Print out current config settings such as Git, etc.
message "👀 Current settings" "General settings you may wish to update:"

bullet "git config --global user.name = \"$(git config --get user.name)\""
bullet "git config --global user.email = \"$(git config --get user.email)\""


# =============================================================================
# Check if the ~/.profile.local file exists, if not then install from template
if [[ -f "$HOME/.profile.local" ]]; then
    message "🏠 ~/.profile.local" "Customize specific to this computer"
else
    message "🏠 Creating local profile" "Creating: $HOME/.profile.local"
    bullet "Configure local settings by editing $HOME/.profile.local"
    cp $DOTFILES/Shell/profile.local.sh $HOME/.profile.local
fi


# =========================================================================
message "\n🎉 Success" "Restart Terminal."
echo

# end of file.

exit 0
