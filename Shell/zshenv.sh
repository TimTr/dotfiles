# .zshenv - Loaded in every session (e.g. PATH)

# De-dupe PATH entries automatically. Needed because ~/.zprofile
# re-prepends Homebrew/XDG dirs after macOS's path_helper reorders
# things (see Shell/zprofile.sh for why).
typeset -U PATH path

# This script reacts based on macOS, Linux, or Windows host
export MACOS= LINIX= WINDOWS= WSL=
PLATFORM="$(uname -s)"
[[ "${PLATFORM}" == "Darwin" ]] && export MACOS=1
[[ "${PLATFORM}" == "Linux" ]] && export LINUX=1
[[ "${PLATFORM}" = *_NT-* ]] && export WINDOWS=1


# ========================================================================
# Setup XDG: https://specifications.freedesktop.org/basedir/latest/
export XDG_CONFIG_HOME=$HOME/.config
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.local/cache


# Default system directories at end of the chain (custom PATH comes first)
export PATH="/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"

# ========================================================================
# Add specific path folders for each platform
if [[ $LINUX == 1 ]]; then
  export PATH="$PATH:/snap/bin"; fi

if [[  $MACOS == 1 ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/opt/ruby/bin:$PATH"; fi


# Add personal XDG binary and scripts folder to the start of the PATH
export PATH="$XDG_BIN_HOME:$PATH"


# Save PATH so .zprofile can reset it after the other things may override
# This works around a behavior on macOS that adds some security bits to
# the default environment that I don't want in the interactive shell
export ZSHENV_PATH=$PATH


# end of file.
#
