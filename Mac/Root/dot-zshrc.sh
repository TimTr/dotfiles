# .zshrc - Mac version - Loaded only in interactive shell sessions
#
# Because this file is only loaded in interactive shell (Terminal) sessions,
# It is perfect for setting up things like colors, etc. However, it isn't
# the right place to setup PATH and other variables that tools may want.
# For those global (no shell visible) cases, use the `.zshenv` file.
# -----------------------------------------------------------------------------

source $HOME/.aliases
source $HOME/.functions
source $HOME/.zshenv

# -----------------------------------------------------------------------------
# TIMENOW=$(date +%d-%m-%Y" "%H:%M:%S)
# message ".zshrc" "Launched $SHELL' at ${TIMENOW}."
# -----------------------------------------------------------------------------


# Warn about installing Homebrew if it is not yet present
which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing Homebrew. Run setup-brew.sh"
else
  message "Found Homebrew" "Installed brew tools supercede system tools (e.g. Ruby)"
fi


export EZA_COLORS="*.md=92:fi=0:ex=96:di=38;5;75:da= 30:mp=31:lp=33:ln=31:uu=0:gu=0:sn=0:sb=0:xx=0"


# -----------------------------------------------------------------------------
# Setup the prompt
## Parse git branch to put into the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ 🌱 \1/'
}

autoload colors; colors;
export CLICOLOR=1
export LSCOLORS=gxFxCxDxdxExBxAxaxaxex

setopt PROMPT_SUBST
HOSTNAME=$(hostname -s)
NEWLINE=$'\n'
PROMPT='${NEWLINE}%F{white}% %F{red}% $USER %F{grey}% ${HOSTNAME}%F{white}%  %F{red}% %9c% %F{white}% %F{white}% ${NEWLINE}%F{blue}%$(parse_git_branch) ↪ %f'


# Load local custom settings (e.g. security keys that don't belong in Git)
source $XDG_CONFIG_HOME/local.sh








# end of file
# ==============================================================================

# Previous version of the prompt, with date
# PROMPT='${NEWLINE}%F{white}% > %F{red}% $USER %F{grey}% ${HOSTNAME}%F{white}%  %F{red}% %9c% %F{white}%  %F{blue}% $(parse_git_branch) %F{white}% ${NEWLINE}[%F{238} %D %T%F{white}% ] ↪ %f'
#
# Another previous version
#     NEWLINE=$'\n'
#     PROMPT='${NEWLINE}%F{white}% → %F{red}% %9c% %F{grey}% $(parse_git_branch) %F{white}% ${NEWLINE}↪ %f'

## EZA color setup reference: https://the.exa.website/docs/colour-themes
## type "man eza_colors" for a list and instructions
## 256 color codes:  https://en.wikipedia.org/wiki/ANSI_escape_code
## Notice how "di=38;5;nnn" - replace the "nnn" with a color code from ANSI 256
## EZA themes are found in `~/Library/Application Support/eza` - for more info see: https://github.com/eza-community/eza-themes/blob/main/README.md or do manual overrides using information here: https://github.com/ogham/exa/blob/master/man/exa_colors.5.mde

## Prior good colors
# export EZA_COLORS="*.md=92:fi=0:ex=96:di=34:da=2:mp=31:lp=33:ln=31:uu=0:gu=0:sn=0:sb=0:xx=0"

## Testing colors
# export EZA_COLORS="*.md=92:fi=0:ex=96:di=38;5;75:da=1;30:mp=31:lp=33:ln=31:uu=0:gu=0:sn=0:sb=0:xx=0"


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







