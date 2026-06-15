#!/bin/bash
#
#  'setup.sh' is used by GitHub and other VMs at startup
#
#  This script is setup to launch using the BASH shell since it is
#  common across supported platforms. Likely works in zsh as well.
#  On macOS, `zsh` is the default. Most Linux systems default to `bash`.

# =============================================================================
echo
# This will setup common variables and define current OS
source "${DOTFILES}/Shell/profile.sh"
source "${DOTFILES}/Shell/functions.sh"

# Set DOTFILES value to be the directory in which `./setup.sh` was run
export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# =============================================================================
# Running output (first the setup configuration)
message "🟢 \$DOTFILES =" "${DOTFILES}"

# =============================================================================
# Create directories to match the XDG definitions in .profile
# XDG reference:  https://specifications.freedesktop.org/basedir/latest/
message "📂 Directories" "Creating and configuring XDG and other directories"

mkdir -p $XDG_BIN_HOME    2> /dev/null
mkdir -p $XDG_CONFIG_HOME 2> /dev/null
mkdir -p $XDG_DATA_HOME    2> /dev/null
mkdir -p $XDG_STATE_HOME   2> /dev/null
mkdir -p $XDG_CACHE_HOME   2> /dev/null

if [[ -d "$XDG_BIN_HOME" ]]; then
    bullet "User scripts PATH: $XDG_BIN_HOME "
    chmod 0700 $XDG_BIN_HOME
else
    error "Failed to create $XDG_BIN_HOME. Check permissions and re-run setup.sh"
    exit 1
fi

# Create ~/Developer folder in which to put local code repositorities
if [[ -d "$HOME/Developer/" ]]; then
    bullet "Personal projects: $HOME/Developer"
else
    mkdir $HOME/Developer
    message "✅ $HOME/Developer : created folder for personal development work"
fi

# Create a ~/Documents folder if it doesn't exist already (on macOS likely does)
if [[ -d "$HOME/Documents/" ]]; then
    bullet "Work repositories: $HOME/Documents"
else
    mkdir $HOME/Documents
    message "✅ $HOME/Documents : created for work repositories"
fi

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
# Copy the global files that work on both macOS and Linux
message "🔧 Dotfiles" "Copying .profile, .zshrc, and others to root"
cp $DOTFILES/Shell/profile.sh $HOME/.profile
cp $DOTFILES/Shell/zshrc.sh $HOME/.zshrc
cp $DOTFILES/Shell/zshenv.sh $HOME/.zshenv
cp $DOTFILES/Shell/aliases.sh $HOME/.aliases
cp $DOTFILES/Shell/functions.sh $HOME/.functions

# Common Git settings across platforms, and register those settings
cp $DOTFILES/Git/gitignore $HOME/.gitignore
cp $DOTFILES/Git/gitconfig-work $HOME/Documents/.gitconfig-work
git config --global core.excludesfile $HOME/.gitignore

# Common app settings across platforms
cp $DOTFILES/Vim/vimrc $HOME/.vimrc

# Copy VSCode settings -- commented out while using GitHub sync
# cp $DOTFILES/VSCode/settings.json "$HOME/Library/Application Support/Code/User/"


# =============================================================================
# Check if the ~/.profile.local file exists, if not then copy the template to $HOME
if [[ -f "$XHOME/.profile.local" ]]; then
    bullet "Configure local settings by editing $HOME/.profile.local"
else
    message "🏠 Local settints" "Creating: $HOME/.profile.local"
    bullet "Configure local settings by editing $HOME/.profile.local"
    cp $DOTFILES/Shell/profile.local.sh $HOME/.profile.local
fi


bullet "git config --global user.name = \"$(git config --get user.name)\""
bullet "git config --global user.email = \"$(git config --get user.email)\""

# Copy dotfiles custom scripts into the additional PATH folder
cp $DOTFILES/Bin/* $XDG_BIN_HOME


# =========================================================================
# Add the DOTFILES environment setting to the end of the .profile file
echo " " >> $HOME/.profile
echo "# Set DOTFILES to point at this install folder" >> $HOME/.profile
echo "export DOTFILES=$DOTFILES" >> $HOME/.profile


# =============================================================================
# Setup macOS-specific bits
if [[ $MACOS == 1 ]]; then
    #  Mac-specific Git configuration files (assumes ./Documents for work repos)
    cp $DOTFILES/Git/gitconfig-mac $HOME/.gitconfig
  
    # Remaining Mac-custom settings
    source $DOTFILES/Mac/setup-mac.sh
fi


# =============================================================================
# Setup Linux-specific bits
if [[ $LINUX == 1 ]]; then
    #  Linux-specific Git configuration files (assumes ./Documents for work repos)
    cp $DOTFILES/Git/gitconfig-linux $HOME/.gitconfig
    # Remaining Linux-custom settings
    source $DOTFILES/Linux/setup-linux.sh
fi


# =========================================================================
echo
message "🎉 Success" "Restart Terminal."
echo

exit 0













# ==============================================================================
# Saved script tidbits may want later
# ==============================================================================


# if [[ ${MACOS} ]]; then
#    $DOTFILES/Mac/setup-mac.sh
# fi

# if [[ ${LINUX} ]]; then
#   $DOTFILES/Linux/setup-linux.sh
# fi

# -- This is the name of the actual file that was run
# DOTFILES_SETUP_FILE=${0:a}

# -- This was how to get the containing folder via zsh
# export DOTFILES=${0:a:h}

# This piece of script would require that you launch the setup while
# already located inside the ~/dotfiles folder - this isn't needed
#
# if [ "$(basename "$PWD")" != "dotfiles" ]; then
#   echo "ABORT" "You must run the installer from within the dotfiles folder"
#   exit 0
# fi


# Ask to enter a key to continue
# read -s -k $'?Press any key to continue. Hit Control-C to abort now.\n'


# Handle parameters from the command line - e.g. "update"
# if [ "$1" = "install" ]; then
#   echo "\nDOT.SH:  Attempting initial install of the dotfiles..."


# Diagnostic - delete later
#   echo "$(basename "$PWD")"
#   echo "$PWD"
#
#   First make sure the installer is run from within the ~/dotfiles folder
#   if [ "$PWD" != "$HOME/dotfiles" ]; then
#     echo " - ABORT: You must install from within the ~./dotfiles folder"
#     exit 0
#   fi
# fi


# If there were no parameters, explain how to use the tool
# if [ $# -eq 0 ]; then
#  echo "DOT.SH: Attempting to update (no parameters). Usage syntax:"
#  echo "        - dot.sh reset"
#  echo "        - dot.sh update"
#  echo "        - dot.sh install   (must be run from within ~/dotfiles"
#fi

# If no parameters, or had entered `update` then proceed to update
# if [[ "$1" = "update" || $# -eq 0  ]]; then
#   echo "\nDOT.SH:  Updating..."
#   Verify that the install had previously succeeded
# fi


# First make sure the installer is run from within the dotfiles folder
# if [ "$(basename "$PWD")" != "dotfiles" ]; then
#   error "ABORT" "You must run the installer from within the dotfiles folder"
#   exit 0
# fi





