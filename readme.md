# Dotfiles for Tim Triemstra

To setup on Mac or Linux:

```
    git clone https://github.com/timtr/dotfiles.git
    cd dotfiles
    ./setup.sh
```

This will run `./setup.sh` from within the local `dotfiles` folder for first-run install. Quit and re-launch the terminal. On Mac, first install Xcode or the command line tools. 

Once installed, run `dotfiles.sh` from the PATH to reset your config. For instance, if you want to reset the `~/local.sh` file to default config, simply delete it, then run `dotfiles.sh`. You can also run `help.sh` for additional help.

Documentation is a work in progress. [See a preview](https://timtr.github.io/Dotfiles/):
    

## Overview

This is my personal collection of setup scripts for macOS and Linux (WIP). It includes settings for `zsh`, macOS Terminal, Xcode, and other tools and apps. This set will also install Homebrew and a recent version of Ruby.

The setup will assume your settings are configured directly within the `Dotfiles` folder where you cloned this repo, adding the `/Dotfiles/Bin` folder to the PATH (for instance.) It will also add `/opt/homebrew/bin` to the PATH for Homebrew support. 


## Work-specific Git configuration

The `Config` folder includes a `dot-gitconfig-work` file that is installed to control the Git behavior for respositories in the `~/Work` folder. In this case, it is setting up to do code signing at commit time. This general approach can work for any sub-folder custom configuration, e.g. using a different name or email for your commits, depending on the folder they are stored in on disk.


## Features

**local.sh** - Installs a file called `~/local.sh` (if doesn't exist) that you can customize with settings that do not belong checked into GitHub, for instance set certain keys, or environment variables. This is also the file to add things like feature flags during development, add a Swift toolchain, or to enable secret build settings.

**dotfiles.sh** - run this at any time reset all settings, and recreate `~/local.sh` from the original template if you first delete that file.

**ZSH settings** - sets up the prompt, `PATH`, and other basic settings. Note that `.zshenv` sets up the PATH so it works even when there is no interactive terminal session, and `.zshrc` will source this file for a consistent PATH for terminal windows.

**Dropbox** - symlink in `$HOME` points to `~/Library/CloudStorage/Dropbox` if Dropbox is installed on the computer.


## Using a custom Swift toolchain

You can download new Swift toolchains from [Swift.org](https://swift.org/download/#snapshots) and set them to be used by default.  The `~/local.sh` file is perfect to place to configure these settings per-machine, rather than configure in the main Dotfiles repo. 


## Demos

Once installed, you can install Homebrew and run demos. For example, run `demo-homebrew.sh` from the `Dotfiles/Demos` to show a Terminal screen of software being downloaded, built, installed, and erased (in a repeating loop). Hit `CONTROL-Z` to quit that demo.

You can also open the `Dotfiles/Demos/demo-safari-cycle.html` file to launch Safari and begin cycling through many web pages, simulating an automated web test harness. 


## Useful reference links

Documentation (or the start of docs) can be [found here](https://timtr.github.io/Dotfiles/docs/). Note that the `docs` folder must be in lower-case for GitHub Pages support. Capital `Docs` will fail.

Which `zsh` files contain which settings: [CodeSpaces and Dotfiles](https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout)

Docs on using `setup.sh` with [GitHub CodeSpaces and Dotfiles](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account)


### ZSH order of loading

For reference, `zsh` config files are loaded in the following order:

```
    .zshenv    -- global (even non-interactive), useful for PATH and tooling variables
    .zshrc     -- loaded from the interactive shell (e.g. a Terminal window)
    .zprofile  -- if login (not using this file in current setup)
```



`// end of file.`
