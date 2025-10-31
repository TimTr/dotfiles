#!/bin/zsh
#
# clean.sh   -- cleans caches and re-hides folders, making things pretty
#
# ==============================================================================

# Import the default functions used in these scripts
source ${HOME}/.functions
message "clean.sh" "Reset caches and preferences"
# ==============================================================================


# Hide tfolders from being visible in Finder (they still show in Terminal)
chflags hidden ${HOME}/Documents/Insta360/   &> /dev/null
chflags hidden ${HOME}/Documents/Larian\ Studios

# Remove a bunch of common defaults -- re-run setup to add them back
# Cleaning them exists to get back into a good state, just in case
# a default option is causing some sort of problem

# All Xcode settings
defaults delete com.apple.dt.Xcode

# Set macOS to not write .DS_Store files on network drives
defaults delete com.apple.desktopservices

# Set macOS to not write .DS_Store files on USB drives
defaults delete com.apple.desktopservices

# Save screenshots (location, file type, etc.)
defaults delete com.apple.screencapture

# Stops Xcode IDE from saving the workspace layout (window size, etc)
defaults delete com.apple.dt.Xcode IDEDisableStateRestoration

