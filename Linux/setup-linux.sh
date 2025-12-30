#!/bin/bash
#
# dotfiles.sh - the Linux version

# TODO: abort if git, cc, or other needed tools are not available
source "$DOTFILES_ROOT/Linux/dot-functions.sh"
message "dotfiles.sh -- clean BASH setup for Linux via ${DOTFILES_ROOT}"
bullet "Cannot use SUDO in the Linux version of this script"

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
  message "✅ Created $HOME/bin and added it to PATH for your code"
fi


# ==============================================================================
message "✅ Installing root dotfiles" "Overwriting existing versions of these files"
cp $DOTFILES_ROOT/Linux/dot-profile.sh $HOME/.profile
cp $DOTFILES_ROOT/Linux/dot-aliases.sh $HOME/.aliases
cp $DOTFILES_ROOT/Linux/dot-functions.sh $HOME/.functions
rm $HOME/.bash_profile
rm $HOEM/.profile

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
message "✅ Setup defaults" "Adding paths and variables to .profile for bash"
echo " " >> ~/.profile
echo "# Add global DOTFILES_ROOT pointing Dotfiles install folder" >> ~/.profile
echo "export DOTFILES_ROOT=$DOTFILES_ROOT" >> ~/.profile


# ==============================================================================
# Check if the "~/local.sh" file exists, and if not, copy  the stub version to user home
if [[ -f "$HOME/local.sh" ]]; then
  bullet "~/local.sh exists - delete then re-run to reset from the template"
else
  message "✅ Creating ~/local.sh" "Modify this file to add GitHub and SSH tokens"
  cp $DOTFILES_ROOT/Linux/local-template.sh $HOME/local.sh
fi

message "✅ git config --global user.name" "= $(git config --get user.name)"
message "✅ git config --global user.email" "= $(git config --get user.email)"
echo
message "🎉 Success!" "Restart Terminal and run setup-brew.sh and setup-ruby.sh"

echo

exit 0

## end of file.
