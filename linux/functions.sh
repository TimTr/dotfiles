# source this file into .zshrc

# Functions to make output attractive when running the script
# NOTE: some characters in the comment will break the function, e.g. "!"
message () { printf "\r  [\033[00;32m $1\033[0m ] $2\n" }
status () { printf "\r  [\033[00;34m $1\033[0m ] $2\n" }
error () { printf "\r  [\033[00;31m $1\033[0m ] $2\n" }
bullet () { printf "\r    - \033[00;32m $1\033[0m \n" }


# Function to find all files recursively under current folder
findall () {
    find ./ -name $1 -print 2> /dev/null
}

# Function to create a new directory and enter it
md() {
	mkdir -p "$@" && cd "$@"
}

# ===========================================
# Aliases

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias reload!='. ~/.zshrc'

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

# ... Make 'ls' look a lot prettier
alias ls='ls -FG'
alias lsl='ls -loFGT'
alias lsla='ls -loAFGT'

# ... echo $SHELL tells you the default shell, this command
#     instead tells you which shell you are presently inside
alias shell-now='ps -p $$'

# original color-coded lsl command:  alias lsl='ls -loFGT'
# sorts folders at the top:  ls -la | grep "^d" && ls -la | grep -v "^d"
# NOTE: if you sort you lose the LS coloring in the output (sad face)


# ... Turn off the Quarantine Bit for all files in local folder
alias qbit="xattr -d com.apple.quarantine ./*"

# ... Eject a volume (type the volume name after)
alias eject="hdiutil detach -verbose -force /Volumes/"

# ... Touch the time and date recursively for all files in current folder
alias touchall="find . -exec touch {} \;"

# ... Tell Time Machine to use higher CPU priority until reboot
alias time-machine-fast="sudo sysctl debug.lowpri_throttle_enabled=0"

