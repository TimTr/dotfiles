# source this file into .zshrc and other scripts

if [[ -n "${LOADED_FUNCTIONS+x}" ]]; then return; fi;
LOADED_FUNCTIONS=true


# NOTE: some characters will not work within printf functions, e.g. "!"

# debug_note() will print info only if $DEBUB_MODE currently == 1
function debug_note() {
  # TODO: this doesn't work at all yet, just placeholder
  local condition=$1
  local message=${2:-"Assertion failed"}
  if ! eval "$condition"; then
    echo "Error: $message" >&2
    exit 1
  fi
}

# message() as a bright message, and less-bright detail message (two parameters)
function message() { printf "\r\033[00;32m $1\033[0m $2\n"; }

# bullet() is sub-items from messages, if warranting more lines of text
function bullet()  { printf "\r\033[00;36m   ==\033[0m $1 \n"; }

# error() should report major failures, often ejecting from the script
function error()   { printf "\r\033[01;31m [ERROR]\033[00;31m $1 \033[0m \n"; }

# alert() is extra bright to get attention, but not an error (two parameters)
function alert()  { printf "\r\033[00;35m $1\033[0m $2\n"; }

# ... Find all files recursively under current folder
function findall() { find . -name "$1" -print 2> /dev/null; }

# ... grep for a string in the root and recursively downward
function findstring() { grep -rinl --color "$1" .; }

# ... Create a new directory and enter it
function md() { mkdir -p "$@" && cd "$@"; }

# Delete Xcode derived data
function xcode-clean() {
    echo "Deleting all Xcode derived data...";
    rm -rdf ~/Library/Developer/Xcode/DerivedData/*;
}

# echo "this is ${txtbold}bold${txtnormal} but this isn't"
txtbold=$(tput bold)
txtnormal=$(tput sgr0)

# end of file.
