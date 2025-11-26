# .zshrc - Loaded only in interactive shell sessions - Linux version
#
# Because this file is only loaded in interactive shell (Terminal) sessions,
# It is perfect for setting up things like colors, etc. However, it isn't
# the right place to setup PATH and other variables that tools may want.
# For those global (no shell visible) cases, use the `.zshenv` file.
# -------------------------------------------------------------

## TODO: This was not yet customized to work for BASH

source $HOME/.aliases
source $HOME/.functions
source $HOME/.zshenv

# Report tha .zshrc is loading and at what time
TIMENOW=$(date +%d-%m-%Y" "%H:%M:%S)
message ".zshrc" "Launched $SHELL' at ${TIMENOW}."


# ==============================================================================
# Python3 - Augument the default PATH for Python3 use
export PY_PYTHON=3

# Colors -- usable everywhere now that they are in the .zshrc
autoload colors; colors;

# Syntax coloring for ZSH is a bit different than bash
export CLICOLOR=1
export LSCOLORS=gxFxCxDxbxExBxAxaxaxex
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=37:cd=34:su=36:sg=36;40:tw=36:ow=36"


## Parse git branch to put into the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Enable substitutions within the prompt
setopt PROMPT_SUBST

# Set the actual prompt
NEWLINE=$'\n'
PROMPT='${NEWLINE}%F{white}% → %F{red}% %9c% %F{grey}% $(parse_git_branch) %F{white}% ${NEWLINE}↪ %f'


## end of file.
