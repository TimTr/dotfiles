# .bashrc - Linux - Both interactive and "headless" shell sessions
#
# Adding the $HOME/bin and dotfiles/Linux folders to PATH. Homebrew not setup yet
export PATH="$HOME/Bin:$DOTFILES_ROOT/Linux"

# Add default system PATHs at end of the chain
export PATH="$PATH:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/snap/bin"


## TODO: This was not yet customized to work for BASH

source $HOME/.aliases
source $HOME/.functions

# Report tha .bashrc is loading and at what time
TIMENOW=$(date +%d-%m-%Y" "%H:%M:%S)
message ".bashrc" "Launched $SHELL' at ${TIMENOW}."


## TODO: Fix the coloring for bash (was different for zsh)
# Colors -- usable everywhere now that they are in the .zshrc
autoload colors; colors;

export CLICOLOR=1
export LSCOLORS=gxFxCxDxbxExBxAxaxaxex
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=37:cd=34:su=36:sg=36;40:tw=36:ow=36"

# Set the actual prompt
PS1="[\[\033[32m\]\w]\[\033[0m\]<strong>\n</strong>\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"


## end of file.
