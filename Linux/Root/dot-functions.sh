# source this file into .bashrc
#
# Linux version

if [[ -v LOADED_FUNCTIONS ]]; then return; fi
LOADED_FUNCTIONS=true


# NOTE: some characters will not work within printf functions, e.g. "!"
# error() should report major failures, often ejecting from the script
function error()   { printf "\r\033[01;31m [ERROR]\033[00;31m $1 \033[0m \n" }

# alert() is extra bright to get attention, but not an error (two parameters)
alert ()  { printf "\r\033[00;35m $1\033[0m $2\n" }

# message() as a bright message, and less-bright detail message (two parameters)
message () { printf "\r\033[00;32m $1\033[0m $2\n" }

# bullet() is sub-items from messages, if warranting more lines of text
bullet ()  { printf "\r\033[00;36m   ==\033[0m $1 \n" }

# echo "this is ${txtbold}bold${txtnormal} but this isn't"
txtbold=$(tput bold)
txtnormal=$(tput sgr0)


# ... Find all files recursively under current folder
findall () {
    find . -name "$1" -print 2> /dev/null
}

# ... Create a new directory and enter it
md() {
    mkdir -p "$@" && cd "$@"
}



