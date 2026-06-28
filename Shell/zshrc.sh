# .zshrc - Mac version - Loaded only in interactive shell sessions
#
# Because this file is only loaded in interactive shell (Terminal) sessions,
# It is perfect for setting up things like colors, etc. However, it isn't
# the right place to setup PATH and other variables that tools may want.
# For those global (no shell visible) cases, use the `.zshenv` file.
# ========================================================================

source $HOME/.zshenv
source $HOME/.aliases
source $HOME/.functions

# This exports the current directory to iTerm for the tab UI name
if [ $ITERM_SESSION_ID ]; then
  precmd() {
    echo -ne "\033]0;${PWD##*/}\007"
  }
fi

# Warn about installing Homebrew if it is not yet present
which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing Homebrew. Run setup-brew.sh"
else
  message "Found Homebrew" "Installed brew tools supercede system tools (e.g. Ruby)"
fi


# ==============================================================================
# ls and eza  -- sets colors and sorting for file and directory listing
autoload colors; colors;
export CLICOLOR=1
export LSCOLORS=gxFxCxDxdxExBxAxaxaxex
export EZA_COLORS="*.md=92:fi=0:ex=96:di=38;5;75:da= 30:mp=31:lp=33:ln=31:uu=0:gu=0:sn=0:sb=0:xx=0"


# ========================================================================
# Setup the prompt with git branch info included (needs this function)
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ 🌱 \1/'
}

setopt PROMPT_SUBST
HOSTNAME=$(hostname -s)
NEWLINE=$'\n'
PROMPT='${NEWLINE}%F{#ff6a00}% %9c% %f  %F{#203a47}% ${HOSTNAME} %F{#0096ff}% $(parse_git_branch) ${NEWLINE}%F{#203a47}% $USER %F{#eef8ff}% 〉%f'


# end of file
