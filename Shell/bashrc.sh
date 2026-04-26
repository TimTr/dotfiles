# .bashrc - Linux - loaded first by bash
#
# TODO: move to the XDG_BIN_HOME (and similar) model for installing

source $HOME/.profile
source $HOME/.aliases
source $HOME/.functions


# ==============================================================================
# ls and eza  -- sets colors and sorting for file and directory listing
# Sort order with capital letters first in Linux
export LC_COLLATE="C"
# Handle some color rules (not sure this is tuned for Linux)
export CLICOLOR=1
export LSCOLORS=gxFxCxDxbxExBxAxaxaxex
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=37:cd=34:su=36:sg=36;40:tw=36:ow=36"
export EZA_COLORS="*.md=92:fi=0:ex=96:di=38;5;75:da= 30:mp=31:lp=33:ln=31:uu=0:gu=0:sn=0:sb=0:xx=0"


# ==============================================================================
# Prompt-related setup with current git info in the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/🌱 \1/ '
}

HOSTNAME=$(hostname -s)
NEWLINE=$'\n'
export PS1='${NEWLINE}\[\e[91m\]${USER} \[\e[90m\]${HOSTNAME}\[\e[91m\] \w\[\e[0m\]\[\e[0m\] \[\e[0m ${NEWLINE}\[\e[34m\]$(parse_git_branch) \[\e[91m\]↪ \[\e[0m\] '



# ==============================================================================
## Below this line are dynamically added variables and commands
# ==============================================================================
