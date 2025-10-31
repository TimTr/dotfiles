# .zshenv - Loaded in every session, even if not interactive. Great for PATH.

# Adding the $HOME/bin and dotfiles/Mac folders to PATH, as well as Homebrew
export PATH="$HOME/Bin:$DOTFILES_ROOT/Mac:/opt/homebrew/bin"

# Setting for Apple silicon version of Ruby. Pre-pend it and Gems to the PATH
export PATH=$PATH:/opt/homebrew/opt/ruby/bin
export PATH=$PATH:`gem environment gemdir`/bin

# Add default system PATHs at end of the chain
export PATH="$PATH:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"

# Python3 - Augument the default PATH for Python3 use
export PY_PYTHON=3

# Node.js and npm setup (this first part loads NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads nvm bash_completion
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  


# ==============================================================================
## Below this line are dynamically added variables and commands
# ==============================================================================
