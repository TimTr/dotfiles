#!/bin/bash
#
#  'setup.sh' is used by GitHub and other VMs at startup
echo
#  This script is setup to launch using the BASH shell since it is
#  common across supported platforms. Likely works in zsh as well.
#  On macOS, `zsh` is the default. Most Linux systems default to `bash`.

# =============================================================================
# Shared common environment variables used for both macOS and Linux
source "${DOTFILES}/Shell/profile.sh"
source "${DOTFILES}/Shell/functions.sh"

# Set DOTFILES value to be the directory in which `./setup.sh` was run
export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Verify macOS shell is zsh and that Xcode is installed
if [[ $MACOS == 1 ]]; then
  XCODE=$(xcode-select -p)  2> /dev/null
  if [[ $XCODE == "" ]]; then
    echo -e "\n First install Xcode for macOS, then re-run setup.sh \n"
    exit 0
  fi
  if [[ $SHELL != "/bin/zsh" ]]; then
    chsh -s /bin/zsh
    echo -e "\n The default shell is been reset to ZSH, now re-run ./setup.sh \n"
    exit 0
  fi
fi

# For Linux `bash` is required as the default
if [[ $SHELL != "/bin/bash" && $LINUX == 1 ]]; then
  chsh -s /bin/bash
  echo -e "\n The default shell is been reset to BASH, now re-run ./setup.sh \n"
  exit 0
fi

# =============================================================================
# Running output (first the setup configuration)
message "🔔 Environment:" "Settings being used for this install of dotfiles"
bullet "OS ${PLATFORM} : MACOS=${MACOS} LINUX=${LINUX} WINDOWS=${WINDOWS}"
bullet "DOTFILES = $DOTFILES"
bullet "xcode-select -p = $XCODE"
bullet "git config --global user.name = \"$(git config --get user.name)\""
bullet "git config --global user.email = \"$(git config --get user.email)\""


# =============================================================================
# Create the folders to match the XDG configuration from .profile
# Create XDG:  https://specifications.freedesktop.org/basedir/latest/
message "📂 Directories" "Creating and configuring all key directories"

mkdir -p $XDG_BIN_HOME    2> /dev/null
mkdir -p $XDG_CONFIG_HOME 2> /dev/null
mkdir -p $XDG_DATA_HOME    2> /dev/null
mkdir -p $XDG_STATE_HOME   2> /dev/null
mkdir -p $XDG_CACHE_HOME   2> /dev/null

if [[ -d "$XDG_BIN_HOME" ]]; then
  bullet "$XDG_BIN_HOME exists. Added to the PATH for user content"
  chmod 0700 $XDG_BIN_HOME
else
  error "Failed to create $XDG_BIN_HOME. Check permissions and re-run setup.sh"
  exit 1
fi

# Create ~/Developer folder in which to put local code repositorities
if [[ -d "$HOME/Developer/" ]]; then
  bullet "$HOME/Developer exists. Use this folder for personal repositories"
else
  mkdir $HOME/Developer
  message "✅ $HOME/Developer - created folder for personal developer work"
fi

# Create a ~/Documents folder if it doesn't exist already (on macOS likely does)
if [[ -d "$HOME/Documents/" ]]; then
  bullet "$HOME/Documents exists. Use this folder for work repositories"
else
  mkdir $HOME/Documents
  message "✅ $HOME/Documents - use this folder for work repositories"
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
# Check if the ~/local.sh file exists, if not then copy the template to $HOME
if [[ -f "$XDG_CONFIG_HOME/local.sh" ]]; then
  bullet "$XDG_CONFIG_HOME/local.sh file exists. Delete and re-run to install from template"
else
  message "🏠 Local.sh" "Creating in $XDG_BIN_HOME/local.sh"
  cp $DOTFILES/local.sh $XDG_BIN_HOME/local.sh
fi


# =============================================================================
# Copy the global files that work on both macOS and Linux
message "🔧 Dotfiles @ root" "Overwriting dot-config files (.bashrc, etc) at $HOME"
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

message "📂 Scripts @ PATH" "Copying to $XDG_BIN_HOME for user scripts"
cp $DOTFILES/Bin/* $XDG_BIN_HOME


# =============================================================================
# Copy the macOS-only files
if [[ $MACOS == 1 ]]; then
  message "🍎 macOS-specific" "\'setup-mac.sh\' and installing Mac files"
  message "👩‍💻 App preferences" "Overwriting Terminal, Xcode, and other settings"

  #  Mac-specific Git configuration files (assumes ./Documents for work repos)
  cp $DOTFILES/Git/gitconfig-mac $HOME/.gitconfig

  # Copy app settings
  cp $DOTFILES/Terminal/* $HOME/Library/Preferences/
  # Copy Xcode preferences (fails silently if no Xcode installed)
  cp -R $DOTFILES/Xcode/* $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/ 2> /dev/null
  # Remaining Mac-custom settings
  source $DOTFILES/Mac/setup-mac.sh
fi


# =============================================================================
# Copy the Linux-only files
if [[ $LINUX == 1 ]]; then
  message "🐢 Linux-specific" "`setup-linux.sh` and installing Linux files"
  
  #  Linux-specific Git configuration files (assumes ./Documents for work repos)
  cp $DOTFILES/Git/gitconfig-linux $HOME/.gitconfig

  # Remaining Linux-custom settings
  source $DOTFILES/Mac/setup-linux.sh
fi

# =========================================================================
# Add the DOTFILES environment setting to the end of the .profile file
echo " " >> $HOME/.profile
echo "# Add global DOTFILES pointing Dotfiles install folder" >> $HOME/.profile
echo "export DOTFILES=$DOTFILES" >> $HOME/.profile
echo


# =========================================================================
message "🎉 Success!" "Restart Terminal and run setup-brew.sh"
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





