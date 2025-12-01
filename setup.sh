#!/bin/bash
#
#  'setup.sh' is used by GitHub and other VMs at startup


# Set Dotfiles home to be the folder in which `setup.sh` was run (requires ZSH)
# export DOTFILES_ROOT=${0:a:h}
export DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# This script runs either Linux or macOS installer (do not "source" the scripts)
if [[ $OSTYPE == darwin* ]]; then

  echo
  echo " Setting up macOS:  $DOTFILES_ROOT/Mac/dotfiles.sh"
  $DOTFILES_ROOT/Mac/dotfiles.sh

else

  echo
  echo " Setting up Linux:  $DOTFILES_ROOT/Linux/dotfiles.sh"
  $DOTFILES_ROOT/Linux/dotfiles.sh

fi

exit 0






# ==============================================================================
#### Saved script tidbits may want later


# -- This is the name of the actual file that was run (don't need it)
# DOTFILES_SETUP_FILE=${0:a}

# -- This was how to get the containing folder via zsh
# export DOTFILES_ROOT=${0:a:h}




# This piece of script would require that you launch the setup while
# already located inside the ~/dotfiles folder - this isn't needed
#
# if [ "$(basename "$PWD")" != "dotfiles" ]; then
#   echo "ABORT" "You must run the installer from within the dotfiles folder"
#   exit 0
# fi


#
# Ask to enter a key to continue
# read -s -k $'?Press any key to continue. Hit Control-C to abort now.\n'
#
#
# Handle parameters from the command line - e.g. "update"
# if [ "$1" = "install" ]; then
#   echo "\nDOT.SH:  Attempting initial install of the dotfiles..."
#
#
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





