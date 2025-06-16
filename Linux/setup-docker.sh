#!/bin/zsh
#
# setup-brew.sh   -- macOS version
#
# ==============================================================================

source ~/.functions

message "setup-docker.sh" "Installing Docker daemon"

which -s docker &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing Docker" "Installing for the first time..."

  # INSTALL DOCKER - NOT YET IMPLEMENTED
else
  message "Found Docker" "Starting the deamon..."

  ## Starts the Docker daemon on Ubuntu (should already be running)
  sudo systemctl start docker
fi


exit 0
