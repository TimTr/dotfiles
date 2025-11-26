#!/bin/bash
#
# dotfiles.sh - the Linux version

# TODO: abort if git, cc, or other needed tools are not available
source "$DOTFILES_ROOT/Linux/dot-functions.sh"
message "dotfiles.sh -- clean BASH setup for Linux via ${DOTFILES_ROOT}"

chown -R $USER ${DOTFILES_ROOT}/*  2> /dev/null
chmod -R 777 ${DOTFILES_ROOT}/*    2> /dev/null

# ==============================================================================
message "Installing root dotfiles" "Overwriting existing versions of these files"
cp $DOTFILES_ROOT/Linux/dot-bashrc.sh $HOME/.bashrc
cp $DOTFILES_ROOT/Linux/dot-bashprofile.sh $HOME/.profile
cp $DOTFILES_ROOT/Linux/dot-aliases.sh $HOME/.aliases
cp $DOTFILES_ROOT/Linux/dot-functions.sh $HOME/.functions

# Copy over tool and app settings
cp $DOTFILES_ROOT/Linux/Config/dot-gitconfig $HOME/.gitconfig
cp $DOTFILES_ROOT/Linux/Config/dot-gitignore $HOME/.gitignore
cp $DOTFILES_ROOT/Linux/Config/dot-vimrc $HOME/.vimrc

echo "Empty file to silence new shell messages" >> $HOME/.hushlogin

# Register gitignore and other git stuff
git config --global core.excludesfile ~/.gitignore


# ==============================================================================
# Check if the "~/local.sh" file exists, and if not, copy  the stub version to user home
if [[ -f "$HOME/local.sh" ]]; then
  message "~/local.sh exists" "Delete the file then re-run to install a template version"
else
  message "Creating ~/local.sh" "Modify this file to add GitHub and SSH tokens"
  cp $DOTFILES_ROOT/Linux/Root/local-template.sh $HOME/local.sh
fi


message "Restart the terminal" "After restart, you can run the following commands:"
bullet "git config --global user.name \"Your Name\""
bullet "git config --global user.email \"youremail@yourdomain.com\""
bullet "setup-brew.sh  <-- install or update Homebrew"
bullet "setup-ruby.sh  <-- setup a newer version (or update) of Ruby via Homebrew"
echo

exit 0

## end of file.
