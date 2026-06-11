#!/bin/bash
#
# setup-linux.sh - the Linux version uses BASH
# NOTE:  Cannot use SUDO in the Linux version of this script

message "🐧 ${PLATFORM} detected" "dditional setup for Linux"

# First see if zsh is installed at all
if [[ ! command -v zsh ]] &>/dev/null; then
    alert "Trying to install zsh. If in a VPS, use the web panel to setup."
    apt install -y zsh git fonts-font-awesome
fi


# Verify the ZSH shell is default -- changing to expect this in Linux too
if [[ $SHELL == *zsh* ]]; then
    bullet "ZSH is already the default shell"
else
    alert "Setting ZSH as the default shell, chsh will prompt for your password:"
    chsh -s /usr/local/zsh
    bullet "Quitting install. Completely logout for the change to take effect."
    exit(0)
fi



## End of file.

