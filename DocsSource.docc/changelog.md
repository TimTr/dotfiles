# Change log and future to-do items


## ToDo



## Changes

The list shows the latest changes at the top. Sorry, no dates being tracked.

- Setup the XDG directories, and include .local/bin in the PATH. For reference: https://specifications.freedesktop.org/basedir/latest/
- Ugh, differences in Linux and Mac setups rolled back the `/usr/local/bin/$USER` solution. Back to creating a `$USER/Bin` folder and adding it to the PATH.
- Move PATH files to `/usr/local/bin/$USER` and don't put dotfiles themselves directly into the PATH anymore. This allows files to be created on-the-fly into the PATH, and not put into a folder that may be under source control.
- Git tool to use `~/Documents` instead of the `~/Work` for custom code signing
- Verify that re-running `dotfiles.sh` from anywhere resets the setup
- Put Dotfiles as the source for PATH - no extra copy in `~/Developer`
- Move everything from the `./Mac/` subfolder to the root - Linux remains
- Add `~/Code` and `~/TimTr` to the root user folder aliased to Dropbox or iCloud
- Rename `./Bin` back to Developer
- Added new VSCode theme settings to `./Mac/Settings`
- Use `setup-brew.sh` to update/upgrade if already installed (not two files)
- Add the active git branch of the current folder to the prompt
- Install into `$HOME/Bin` instead of ~/Developer
- Move all script files into main `Mac` folder to go into the $PATH
- Put root `~/Developer` in the PATH (remove `./Bin` sub-folder)
- Rename the dot files to `dot-name.sh` to be more clear (Almost done)
- Copy all scripts and settings into `~/Developer`
- Add all `update-ruby.sh` functionality into `setup-ruby.sh` script
- Move the actual dotfiles (e.g. `zshenv`) into subfolder `Root`





