#!/usr/bin/env zsh
#
# Modify this file at your root folder to customize the local machine
#
# This is the place to put references to SSH keys, GitHub tokens,
# and other personal information that doesn't belong in the ~/dotfiles
# settings due to security concerns. When this file is at ~/local.sh
# it is NOT part of a Git-owned project, and is therefore local-only.

source $HOME/.aliases
source $HOME/.functions

# Only load this file once per session
if [[ -v LOADED_LOCAL ]]; then return; fi
export LOADED_LOCAL=true
message "Loading ~/local.sh" "Sets local Swift toolchain, tokens, keys, and passwords"

# To enable latest Swift.org toolchain in /Library/Developer/Toolchains/"
#  export TOOLCHAINS=swift ("swift" = use Swift.org tools, empty = use Xcode)
export TOOLCHAINS=

# Enable Snippets: type \"swift package learn\" within a package
# export SWIFTPM_ENABLE_SNIPPETS=1

# This must be edited ONLY in the local machine. Do not commit to a repo!
export HOMEBREW_GITHUB_API_TOKEN=


# end of file.

