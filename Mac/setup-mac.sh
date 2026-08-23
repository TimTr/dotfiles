#!/bin/zsh
#
# setup-mac.sh - Mac-specific setings and config

message "🍎 ${PLATFORM} detected" "Additional setup for macOS"

# That Xcode is installed (confirm we are indeed on macOS first)
if [[ $MACOS == 1 ]]; then
    XCODE=$(xcode-select -p)  2> /dev/null
    if [[ $XCODE == "" ]]; then
        echo
        echo -e "\n !!! First install Xcode for macOS, then re-run setup.sh \n"
        echo
        exit 0
    fi
fi
bullet "xcode-select -p = ${XCODE}"

# Warn about installing Homebrew if it is not yet present
which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  error "‼️ Homebrew is missing. Run \"setup-brew.sh\"  then restart"
else
  bullet "brew --version = $(brew --version)  $(which brew)"
fi


# Verify the ZSH shell is default -- changing to expect this in Linux too
if [[ $SHELL != *zsh* ]]; then
    alert "Setting ZSH as the default shell, chsh will prompt for your password:"
    chsh -s /usr/local/zsh
  
    bullet "Quitting install. Completely logout for the change to take effect."
    exit 0
fi

message "🎉 Success" "Restart Terminal." >> /dev/null


# ==============================================================================
# Copy macOS Terminal settings (cross-platform terminals already installed)
cp $DOTFILES/Terminals/* $HOME/Library/Preferences/

  
# Copy Xcode preferences (fails silently if no Xcode installed)
# cp -R $DOTFILES/Xcode/* $HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/ 2> /dev/null
  
  
# Xcode always opens with the "Welcome to Xcode" window, not last project
defaults write com.apple.dt.Xcode ApplePersistenceIgnoreState -bool YES

# Show Xcode extensions, format: single-quote, comma + space , no ending space
defaults write com.apple.dt.Xcode IDEFileExtensionDisplayShowOnlyList '(c, cc, cpp, h, hpp, m, mm, gif, icns, jpeg, jpg, png, tiff, sh, md, html, css, js)'

# Set macOS to not write .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Set macOS to not write .DS_Store files on USB drives
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool TRUE

# Tell Xcode's bundled DocC to hide "No external resolver" DocC warnings
defaults write -g DocCDisableInternalDomainDiagnostics -bool YES

echo "This file silences the [new shell] messages on macOS\n" >> $HOME/.hushlogin

## End of file.

