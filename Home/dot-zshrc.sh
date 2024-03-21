# .zshrc - Loaded only in interactive shell sessions
#
# Because this file is only loaded in interactive shell (Terminal) sessions,
# It is perfect for setting up things like colors, etc. However, it isn't
# the right place to setup PATH and other variables that tools may want.
# For those global (no shell visible) cases, use the `.zshenv` file.
# -------------------------------------------------------------

source $HOME/.aliases
source $HOME/.functions
source $HOME/.zshenv

# Report tha .zshrc is loading and at what time
TIMENOW=$(date +%d-%m-%Y" "%H:%M:%S)
message ".zshrc" "Launched $SHELL' at ${TIMENOW}."

# Warn about installing Homebrew if it is not yet present
which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing Homebrew" "Run setup-brew.sh"
else
  message "Found Homebrew" "Installed brew tools supercede system tools (e.g. Ruby)"
fi

# Prompt and color settings (zsh-specific, different from bash)
autoload colors; colors;
export CLICOLOR=1
export LSCOLORS=gxFxCxDxdxExBxAxaxaxex

## References: type "man eza_colors" for a list and instructions
export EZA_COLORS="*.md=92:fi=0:ex=96:di=34:da=2:mp=31:lp=33:ln=31:uu=0:gu=0:sn=0:sb=0:xx=0"

# This one is good - note that "ex" is executable and overrides all other settings
# export EZA_COLORS="*.md=94:fi=92:ex=0:di=31:da=2:mp=31:lp=33:ln=31:uu=0:gu=0:sn=0:sb=0:xx=0"

# Another example
# export EZA_COLORS="fi=38:ex=37:di=38;5;213:da=38:"\
# "cd=38;15;225:sn=38;5;28:lp=38;05;200:"\
# "ur=38;5;245:uw=38;5;245:ux=38;5;245:ue=38;5;245:"\
# "gr=38;15;245:gw=38;15;245:gx=38;5;245:"\
# "tr=38;15;245:tw=38;15;245:tx=38;5;245"\
# "local.sh=34"




## Parse git branch to put into the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Enable substitutions within the prompt
setopt PROMPT_SUBST

# Set the actual prompt
NEWLINE=$'\n'
PROMPT='${NEWLINE}%F{white}% → %F{red}% %9c% %F{grey}% $(parse_git_branch) %F{white}% ${NEWLINE}↪ %f'


# Load local custom settings (e.g. security keys that don't belong in Git)
source $HOME/local.sh








# end of file
# ==============================================================================

# *** NOTE: Removing rbenv - switched to simple `brew install ruby`
#
# This `rbenv` setting needs to be hard-coded into .zshrc by default
# If you get a "command not found" for rbenv, run `setup-ruby`
#
# To read more about installing rbenv see: https://github.com/rbenv/rbenv
# eval "$(rbenv init - zsh)"
# which -s rbenv &> /dev/null
# if [[ $? != 0 ]] ; then
#   error "Missing rbenv" "Run setup-ruby.sh"
# else
#   eval "$(rbenv init -)"
#   export PATH="${HOME}/.rbenv/bin:$PATH"
#   message "Found rbenv" "Current version of ruby = TODO"
# fi






# ==============================================================================
# Other ideas for reference

# Tell grep to highlight matches (throwing errors)
# export GREP_OPTIONS='—color=auto'

# ==============================================================================
# Previous iterations of the prompt line
# NEWLINE=$'\n'
# PS1="${NEWLINE}%F{white} %F{cyan}%~%{%F{white}%} %F{red}▶︎%F{yellow}▶︎ %{%f%}%"
# PS1="${NEWLINE}%F{white}🐛 [%F{cyan}%~%{%F{white}%}] %{%f%}%"
# another example for zsh: export LSCOLORS=GxFxCxDxBxexexaxaxaxex

### Was using "PS1" instead of PROMPT for some reason
# PROMPT="${NEWLINE}→ %F{39}[%F{white}%~%{%F{blue}%}%F{39}] %{%f%}%"
# PROMPT="${NEWLINE}%F{111}[%F{251}%~%{%F{blue}%F{111}]%F{46}▶︎ %{%f%}%"
# PS1="${NEWLINE}%F{39}[%F{white}%~%{%F{blue}%}%F{39}]%F{cyan}▶︎ %{%f%}%"
# PS1="%F{39}Boo! [%F{white}%~%{%F{blue}%}%F{39}]%F{cyan}▶︎ %{%f%}%"
# PS1="${NEWLINE}%F{39}Boo! [%F{white}%~%{%F{blue}%}%F{39}]%F{cyan}▶︎ %{%f%}%"

# Info on ZSH colors
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# 256 color cheat sheet
# https://www.ditig.com/256-colors-cheat-sheet







