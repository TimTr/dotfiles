# .zshenv - Mac version - Loaded in every session, great for PATH.

# Special PATHs. Add  "$HOME/.local/bin" if using Claude Code
export PATH="$HOME/Bin:$HOME/.local/bin"

# Setting for Apple silicon version of Ruby. Pre-pend it and Gems to the PATH
export PATH=/opt/homebrew/bin:/opt/homebrew/opt/ruby/bin:$PATH

# Add gem to the PATH -- lots of issues running gems lately
# TODO: Fix the installer for Ruby, probably need to switch to chruby tool
# See: https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/
# export PATH=`gem environment gemdir`/bin:$PATH


# Add default system PATHs at end of the chain (my custom stuff comes first)
export PATH="$PATH:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"

# Python3 - Augument the default PATH for Python3 use
export PY_PYTHON=3

# Node.js and npm setup (this first part loads NVM)
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads nvm bash_completion
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  


# ==============================================================================
## Below this line are dynamically added variables and commands
# ==============================================================================
