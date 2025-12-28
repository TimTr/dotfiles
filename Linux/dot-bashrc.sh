# .bashrc - Linux - Both interactive and "headless" shell sessions
#
# Adding the /usr/local/bin/$USER to the PATH. Homebrew not setup yet
export PATH="usr/local/bin/$USER"

# Add default system PATHs at end of the chain
export PATH="$PATH:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/snap/bin"

## TODO: This was not yet customized to work for BASH

source $HOME/.aliases
source $HOME/.functions

# Report tha .bashrc is loading and at what time
TIMENOW=$(date +%d-%m-%Y" "%H:%M:%S)
message ".bashrc" "Launched $SHELL' at ${TIMENOW}."


# Fixes sort order with capital letters first in Linux
export LC_COLLATE="C"

# Handle some color rules (not sure this is tuned for Linux)
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
HOSTNAME=$(hostname -s)
NEWLINE=$'\n'
PS1='${NEWLINE}[${USER} | ${HOSTNAME} | \w] $(parse_git_branch) ${NEWLINE}[\d \t] \033[1;33m\] ↪ \[\033[0m\]'

# Previous (working) prompt
# PS1="\n[\[\033[32m\]\w]\[\033[0m\] \[\033[1;36m\]\u\[\033[1;33m\] > \[\033[0m\]"


# ==============================================================================
## Below this line are dynamically added variables and commands
# ==============================================================================
