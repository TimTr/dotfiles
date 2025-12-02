#!/bin/bash
#
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


# Use 'll' to suppress the "show all" flag when listing files
alias ll='ls -oFG --color'
# Use `lls` to do the short form version of `ls1
alias lls='ls -FG --color'
# Use 'lla' to enable "show all" for hidden files beginning with a period
alias lla='ls -oAFG --color'
# Use 'llx' to see the most info, including extended attributes
alias llx='ls -oAFG --color'
# Use 'llt' to see the files sorted by modification time
alias llt='ls -oAFG --color'


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

