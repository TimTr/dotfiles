#!/bin/bash
#
# dotfiles.sh - the Linux version uses BASH
#
# NOTE:  Cannot use SUDO in the Linux version of this script

echo
source "$DOTFILES/Linux/Root/dot-functions.sh"

message "🔔 Environment:" "Locations being used for this install of Dotfiles"
bullet "DOTFILES = $DOTFILES"
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
chown -R $USER $DOTFILES     2> /dev/null

## Make sure all the dotfiles have proper ownership before starting
chown -R $USER ${DOTFILES}/*  2> /dev/null
chmod -R 777 ${DOTFILES}/*    2> /dev/null

# Make all .sh files (-type f) also executable
find $DOTFILES -name "*.sh" -type f -print0 | xargs -0 chmod 755


# TODO: replace this with the XDG setup now in Mac for #HOME/.local/...
# ==============================================================================
# Create $HOME/Bin folder in which to put local code repositorities
if [[ -d "$HOME/Bin" ]]; then
  bullet "$HOME/Bin exists. Added to the PATH for user content"
else
  mkdir -p $HOME/Bin
  chown -R $USER $HOME/Bin
  chmod 744 $HOME/Bin
  message "📂 Created $HOME/Bin and added it to PATH for your code"
fi


# ==============================================================================
message "✅ Installing root dotfiles" "Overwriting existing versions of these files"
cp $DOTFILES/Linux/Root/dot-bashrc.sh $HOME/.bashrc
cp $DOTFILES/Linux/Root/dot-aliases.sh $HOME/.aliases
cp $DOTFILES/Linux/Root/dot-functions.sh $HOME/.functions

# Copy over tool and app settings
cp $DOTFILES/Linux/Root/dot-gitconfig $HOME/.gitconfig

# Copy common files used across platforms (keeps them in sync)
cp $DOTFILES/Common/Root/dot-vimrc $HOME/.vimrc
cp $DOTFILES/Common/Root/dot-gitignore $HOME/.gitignore

# Register gitignore and other git stuff
git config --global core.excludesfile ~/.gitignore

# ==============================================================================
message "✅ Copy scripts to PATH" "Using $HOME/Bin for user scripts"
cp $DOTFILES/Linux/Bin/* $HOME/Bin


# ==============================================================================
message "✅ Setup defaults" "Adding paths and variables to .bashrc for bash"
echo " " >> ~/.bashrc
echo "# Add global DOTFILES pointing Dotfiles install folder" >> ~/.bashrc
echo "export DOTFILES=$DOTFILES" >> ~/.bashrc

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
  cp $DOTFILES/Linux/Root/local.sh $HOME/local.sh
fi

# ==============================================================================
echo
message "🎉 Success!" "Restart Terminal and run setup-brew.sh and setup-ruby.sh"
echo

## end of file.
exit 0
