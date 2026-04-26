# Modify this file at your root folder to customize the local machine
#
# !! Should only container environment variables, functions, and aliases
#
# This is the place to put references to SSH keys, GitHub tokens,
# and other personal information that doesn't belong in the ~/dotfiles
# settings due to security concerns. When this file is at ~/local.sh
# it is NOT part of a Git-owned project, and is therefore local-only.

# Alias commands to login to servers
# ALERT: Edit these locally and do not commit these to GitHub!
alias ssh-example="ssh username@example.server.com"

# To enable latest Swift.org toolchain in /Library/Developer/Toolchains/"
#  export TOOLCHAINS=swift ("swift" = use Swift.org tools, empty = use Xcode)
export TOOLCHAINS=

# This must be edited ONLY in the local machine. Do not commit to a repo!
export HOMEBREW_GITHUB_API_TOKEN=


# ========================================================================
# Anything below this line will only be loaded when spawning a new session




# end of file.

