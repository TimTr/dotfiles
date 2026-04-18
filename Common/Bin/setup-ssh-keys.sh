#!/bin/bash
#
# ssh-key-setup.sh   -- how to setup the SSH key for a remote server
#
# Import the default functions used in these scripts
source ${HOME}/.functions
message "ssh-key-setup" "Instructions to setup remote password-less SSH login"
# ==============================================================================

# Some links that may be useful:
#
# https://www.imymac.com/mac-tips/how-to-ssh-on-mac.html#part2
# https://www.purdue.edu/science/scienceit/ssh-keys-unix.html
#
# Generate a Key Pair: ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# When prompted, hit Enter to save to ~/.ssh/id_rsa.
# Add the Key to SSH Agent:
#
#    eval "$(ssh-agent -s)"
#
#     ssh-add ~/.ssh/id_rsa
#
# Copy the Public Key to the Remote Server: ssh-copy-id user@remote_host









# ==============================================================================
message "All done now!
