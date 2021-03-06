#!/bin/zsh
#
# update-xcode.sh

# Source ~/.functions so we have functions like "status" and "message"
source ${HOME}/.functions
status "update-xcode.sh" "Configuring Xcode settings, mostly color themes"


#### Copy all the Xcode colors and themes -- requires re-launch
#       NOTE: Do not copy the Xcode .plist as that breaks account settings (GitHub etc.)
mkdir -p ${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes 2> /dev/null

cp ${DOTFILES_ROOT}/macos-xcode/*.xccolortheme \
   ${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes/


# Append the Xcode aliases.sh file to ~/.aliases (adds the Simulator CL tool)
cat $(dirname $0)/aliases.sh >> ${HOME}/.aliases

# ==============================================================================
exit 0
