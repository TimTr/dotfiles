#!/bin/bash
#
# setup-container.sh   -- use Swift's Containerization / Container package
#
# ==============================================================================

source ~/.functions
message "setup-container.sh" "Setting up the Swift Containerization environemtn"

which -s brew &> /dev/null
if [[ $? != 0 ]] ; then

  error "Missing Containerization" "Installing for the first time..."
  ## Do stuff to do a fresh install

else

  message "Found Containerization" "Updating, upgrading, installing Jekyll and others"
  ## Do stuff to update
  
fi


# ==============================================================================
exit 0
