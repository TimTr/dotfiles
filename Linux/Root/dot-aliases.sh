# source this file into .bashrc

# Linux version

if [[ -v LOADED_ALIAS ]]; then return; fi
LOADED_ALIAS=true


# ===========================================
# Aliases

# ... Touch the time and date recursively for all files in current folder
alias touchall="find . -exec touch {} \;"

# Recursively remove .DS_Store files
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# alias reload!='. ~/.zshrc'

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'


# Use the eza command by default, if installed (better ls)
if ! command -v eza &> /dev/null
then
  echo "Tool \`eza\` not found. For a better \`ls\` run:  brew install eza"
  # Use 'll' to suppress the "show all" flag when listing files
  alias ll='ls -oFG --color=auto'
  # Use `lls` to do the short form version of ls
  alias lls='ls -FG --color=auto'
  # Use 'lla' to enable "show all" for hidden files beginning with a period
  alias lla='ls -oAFG --color=auto'
  # Use 'llx' to see the most info, including extended attributes
  alias llx='ls -o@AFG --color=auto'
  # Use 'llt' to see the files sorted by modification time
  alias llt='ls -otAFG- -color=auto'
  # Make standard 'ls' look prettier, with colors and sorting
  # alias ls='ls -FG'
else
  # Aliasing 'ls' commands to use 'eza' - default is in "grid" mode
  alias ll='eza --long --sort=Name --git --git-repos -I "Icon?" --group-directories-first --no-quotes --no-permissions --no-user --grid'
  alias lll='eza --long --sort=Name --git --git-repos -I "Icon?" --group-directories-first --no-quotes --no-permissions --no-user'
  alias lls='eza --sort=Name --git --git-repos -I "Icon?" --group-directories-first --no-quotes'
  alias lla='eza -a --long --sort=Name --git -I "Icon?" -I ".DS_Store" --group-directories-first'
  alias llx='eza -a --long --sort=Name --git -I "Icon?" -I ".DS_Store" --group-directories-first -@ -Z'
  alias llt='eza --tree'
fi


# Git can sometimes create locked files in the .git folder, which then
# blocks things like compress tasks, or copying files. Run "unlock" to
# unlock all files in the current folder (and recursively)
alias showlocks="find . -flags +uchg"

alias unlock="find . -flags +uchg -exec chflags nouchg {} \;"

# ... echo $SHELL tells you the default shell, this command
#     instead tells you which shell you are presently inside
alias shell-now='ps -p $$'

# original color-coded lsl command:  alias lsl='ls -loFGT'
# sorts folders at the top:  ls -la | grep "^d" && ls -la | grep -v "^d"
# NOTE: if you sort you lose the LS coloring in the output (sad face)

