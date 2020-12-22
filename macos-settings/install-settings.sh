#!/bin/zsh
#
# macos-settings.sh
#
# Import the default functions used in these scripts
source ${DOTFILES_ROOT}/template/dot-source.sh
status "macos-settings.sh - start" "Configuring app and tool settings"


# copy settings to $HOME root
cp ${DOTFILES_ROOT}/macos-settings/gitconfig.dotfile $HOME/.gitconfig
cp ${DOTFILES_ROOT}/macos-settings/gitignore.dotfile $HOME/.gitignore

# copy settings or $HOME/Library/Preferences
cp ${DOTFILES_ROOT}/macos-settings/*.plist $HOME/Library/Preferences


# ==============================================================================
status "macos-settings.sh - done." "Returning to parent script."
exit 0

