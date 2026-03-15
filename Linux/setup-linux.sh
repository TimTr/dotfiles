#!/bin/bash
#
# dotfiles.sh - the Linux version uses BASH
#
# NOTE:  Cannot use SUDO in the Linux version of this script

echo
source "$DOTFILES_ROOT/Linux/dot-functions.sh"

message "🔔 Environment:" "Locations being used for this install of Dotfiles"
bullet "DOTFILES_ROOT = $DOTFILES_ROOT"
bullet "Run location = ${0:a:h}"
bullet "git config --global user.name = \"$(git config --get user.name)\""
bullet "git config --global user.email = \"$(git config --get user.email)\""


# TODO: abort if git, cc, or other needed tools are not available


# ==============================================================================
# Require `bash` as the default on Linux, and set the default shell if needed
if [ $SHELL != "/bin/bash" ]; then
  chsh -s /bin/bash
  echo "❌ Script has set default shell to BASH, now re-run setup.sh"
  exit 0
fi

# Claim ownership of all my dotfiles
chown -R $USER $DOTFILES_ROOT     2> /dev/null

## Make sure all the dotfiles have proper ownership before starting
chown -R $USER ${DOTFILES_ROOT}/*  2> /dev/null
chmod -R 777 ${DOTFILES_ROOT}/*    2> /dev/null

# Make all .sh files (-type f) also executable
find $DOTFILES_ROOT -name "*.sh" -type f -print0 | xargs -0 chmod 755


# ==============================================================================
# Create $HOME/Bin folder in which to put local code repositorities
if [[ -d "$HOME/bin" ]]; then
  bullet "$HOME/bin exists. Added to the PATH for user content"
else
  mkdir -p $HOME/bin
  chown -R $USER $HOME/bin
  chmod 744 $HOME/bin
  message "📂 Created $HOME/bin and added it to PATH for your code"
fi


# ==============================================================================
message "✅ Installing root dotfiles" "Overwriting existing versions of these files"
cp $DOTFILES_ROOT/Linux/dot-bashrc.sh $HOME/.bashrc
cp $DOTFILES_ROOT/Linux/dot-aliases.sh $HOME/.aliases
cp $DOTFILES_ROOT/Linux/dot-functions.sh $HOME/.functions

# Copy over tool and app settings
cp $DOTFILES_ROOT/Linux/dot-gitconfig $HOME/.gitconfig

# Copy common files used across platforms (keeps them in sync)
cp $DOTFILES_ROOT/Common/dot-vimrc $HOME/.vimrc
cp $DOTFILES_ROOT/Common/dot-gitignore $HOME/.gitignore

# Register gitignore and other git stuff
git config --global core.excludesfile ~/.gitignore

# ==============================================================================
message "✅ Copy scripts to PATH" "Using $HOME/bin for user scripts"
cp $DOTFILES_ROOT/Linux/Path/* $HOME/bin


# ==============================================================================
message "✅ Setup defaults" "Adding paths and variables to .bashrc for bash"
echo " " >> ~/.bashrc
echo "# Add global DOTFILES_ROOT pointing Dotfiles install folder" >> ~/.bashrc
echo "export DOTFILES_ROOT=$DOTFILES_ROOT" >> ~/.bashrc

# copy .bashrc to .profile to support some different SSH sessions
rm $HOME/.bash_profile 2> /dev/null
cp $HOME/.bashrc $HOME/.bash_profile
cp $HOME/.bashrc $HOME/.profile


# ==============================================================================
# On Linux copy the ./Common/Eza/* theme to ~/.config/eza/theme.yml
# TODO: set this up on Linux


# ==============================================================================
# Check if the "~/local.sh" file exists, and if not, copy  the stub version to user home
if [[ -f "$HOME/local.sh" ]]; then
  bullet "~/local.sh exists - delete then re-run to reset from the template"
else
  message "✅ Creating ~/local.sh" "Modify this file to add GitHub and SSH tokens"
  cp $DOTFILES_ROOT/Linux/local-template.sh $HOME/local.sh
fi

# ==============================================================================
echo
message "🎉 Success!" "Restart Terminal and run setup-brew.sh and setup-ruby.sh"
echo

## end of file.
exit 0
