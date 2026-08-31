#!/usr/bin/env zsh

# Asks the user which of the currect settings should be backed
# up into the `DOTFILES` folder for this machine

set -euo pipefail

usage() {
    echo "Usage: $(basename "$0") [all] [zed] [vscode] [iterm] [terminal] [xcode]"
    echo "Options can be combined. 'all' activates every section."
    exit 1
}

# --- State Flags ---
RUN_ALL=false
RUN_ZED=false
RUN_VSCODE=false
RUN_ITERM=false
RUN_TERMINAL=false
RUN_XCODE=false

# If no arguments passed, display usage (or set a default behavior)
if [ $# -eq 0 ]; then
    echo "No options provided."
    usage
fi

# --- Argument Parsing ---
for arg in "$@"; do
    case "${arg:l}" in  # Convert to lowercase for case-insensitive matching
        all) RUN_ALL=true ;;
        zed) RUN_ZED=true ;;
        vscode) RUN_VSCODE=true ;;
        iterm) RUN_ITERM=true ;;
        terminal) RUN_TERMINAL=true ;;
        xcode) RUN_XCODE=true ;;
        -h|--help) usage ;;
        *)
            echo "Error: Unknown option '$arg'" >&2
            usage ;;
    esac
done


# 1. Zed Section
if [ "$RUN_ALL" = true ] || [ "$RUN_ZED" = true ]; then
    echo "==> Backing up Zed..."
    # --------------------------------------------------------------------------
    # Put Zed-specific setup here:
    # e.g., symlink settings.json, keymap.json, install extensions/themes
    # cp ./configs/zed/settings.json ~/.config/zed/settings.json
    # --------------------------------------------------------------------------
fi

# 2. VS Code Section
if [ "$RUN_ALL" = true ] || [ "$RUN_VSCODE" = true ]; then
    echo "==> Backing up  VSCode..."
    # --------------------------------------------------------------------------
    # Put VS Code-specific setup here:
    # e.g., code --install-extension <extension_id>
    # cp ./configs/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
    # --------------------------------------------------------------------------
fi

# 3. iTerm Section
if [ "$RUN_ALL" = true ] || [ "$RUN_ITERM" = true ]; then
    echo "==> Backing up iTerm..."
    # --------------------------------------------------------------------------
    # Put iTerm-specific setup here:
    # e.g., export/import com.googlecode.iterm2.plist
    # --------------------------------------------------------------------------
fi

# 4. Terminal Section
if [ "$RUN_ALL" = true ] || [ "$RUN_TERMINAL" = true ]; then
    echo "==> Backing up Terminal..."
    # --------------------------------------------------------------------------
    # Put Terminal.app-specific setup here:
    # e.g., export/import com.apple.Terminal.plist
    # --------------------------------------------------------------------------
fi

# 5. Xcode Section
if [ "$RUN_ALL" = true ] || [ "$RUN_XCODE" = true ]; then
    echo "==> Backing up Xcode..."
    # --------------------------------------------------------------------------
    # Put Xcode-specific setup here:
    # e.g., copy DerivedData settings, code snippets, themes
    # --------------------------------------------------------------------------
fi



## end of file
