# .profile - imported by bash and zsh for common settings


# This script needs to set if a Linux or macOS installer
export MACOS= LINIX= WINDOWS= WSL=
PLATFORM="$(uname -s)"
if [[ "${PLATFORM}" == "Darwin" ]]; then export MACOS=1; fi;
if [[ "${PLATFORM}" == "Linux" ]]; then export LINUX=1; fi;
if [[ "${PLATFORM}" = *_NT-* ]]; then export WINDOWS=1; fi;


# ========================================================================
# Setup XDG: https://specifications.freedesktop.org/basedir/latest/
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.local/cache

# Add default system PATHs at end of the chain (custom PATH comes first)
export PATH="$PATH:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"

# Add snap/bin at the end of the PATH if this is a Linux install
if [[ $SHELL != "/bin/bash" && $LINUX == 1 ]]; then
    export PATH="$PATH:/snap/bin"
fi

# Add Homebrew settings at the start of the PATH for macOS installs
if [[ $SHELL != "/bin/bash" && $MACOS == 1 ]]; then
    export PATH="$XDG_BIN_HOME:/opt/homebrew/bin:/opt/homebrew/opt/ruby/bin:$PATH"
fi

# Load local custom settings (e.g. security keys that don't belong in Git)
source $XDG_BIN_HOME/local.sh







# Add gem to the PATH -- lots of issues running gems lately
# TODO: Fix the installer for Ruby, probably need to switch to chruby tool
# See: https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/
# export PATH=`gem environment gemdir`/bin:$PATH

# Node.js and npm setup (this first part loads NVM)
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads nvm bash_completion
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  
