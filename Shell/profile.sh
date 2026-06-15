# .profile - imported by bash and zsh for common settings

# This script reacts based on macOS, Linux, or Windows host
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

# Default system directories at end of the chain (custom PATH comes first)
export PATH="$XDG_BIN_HOME:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"

# ========================================================================
if [[ $LINUX == 1 ]]; then

    # Add Linux folders, like Snap, Pacmac, or others at the end
    echo "This is the .profile file running on Linux"
    export PATH="$PATH:/snap/bin"
fi

# ========================================================================
if [[  $MACOS == 1 ]]; then

    # Add Homebrew at the start to override built-in tools (e.g. bash, Ruby)
    export PATH="/opt/homebrew/bin:/opt/homebrew/opt/ruby/bin:$PATH"
fi

# Load local custom settings (e.g. security keys that don't belong in Git)
source $HOME/.profile.local

