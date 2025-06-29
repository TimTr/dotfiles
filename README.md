# Dotfiles for Tim Triemstra

To setup on Mac or Linux:

```shell
    git clone https://github.com/timtr/dotfiles.git
    cd dotfiles
    ./setup.sh
```

This will run `./setup.sh` from within the local `dotfiles` folder for first-run install. Quit and re-launch the terminal. On Mac, first install Xcode or the command line tools.

Once installed, run `dotfiles.sh` from the PATH to reset your config. For instance, if you want to reset the `~/local.sh` file to default config, simply delete it, then run `dotfiles.sh`. You can also run `help.sh` for additional help.

Documentation is a work in progress. [See a preview](https://timtr.github.io/dotfiles/):


## Overview

This is my personal collection of setup scripts for macOS and Linux (WIP). It includes settings for `zsh`, macOS Terminal, Xcode, Swift, and other tools and apps. This set will also install Homebrew and a recent version of Ruby.

The setup will assume your settings are configured directly within the `dotfiles` folder where you cloned this repo. It will also add `~/Bin` and `/opt/homebrew/bin` to the PATH for local scripts and Homebrew support.

Amost the most important pieces is the `dotfiles/Config/dot-gitignore` file that installs into `~/.gitignore` since that filters out build and other temporary files.


## Work-specific Git configuration

The `Config` folder includes a `dot-gitconfig-work` file that is installed to control the Git behavior for respositories in the `~/Work` folder. In this case, it is setting up to do code signing at commit time, and changing the username and email for those commits. This general approach can work for any sub-folder custom configuration, especially for custom email addresses depending on the folder they are stored in on disk. Feel free to edit to match your workflow and configuration.


## Features

**local.sh** - A file called `~/local.sh` is installed (if doesn't exist) that you can customize with settings that do not belong checked into GitHub, for instance set certain keys, or environment variables. This is also the file to add things like feature flags during development, define a Swift toolchain, or to enable secret build settings. Re-running `dotfiles.sh` will never override this file, so if you want to restart from scratch, just delete the file and the re-install dotfiles to get a fresh setup.

**dotfiles.sh** - run this at any time (it is in $PATH) to reset all settings.

**ZSH settings** - sets up the prompt, `$PATH`, and other basic settings. Note that `.zshenv` sets up `$PATH` so it works even when there is no interactive terminal session, and `.zshrc` will source this file as well.

**Dropbox** - Optionally symlink in `$HOME` points to `~/Library/CloudStorage/Dropbox` if Dropbox is installed on the computer. I often have this commented out.


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

``` shell
    .zshenv    -- global (even non-interactive), useful for PATH and tooling variables
    .zshrc     -- loaded from the interactive shell (e.g. a Terminal window)
    .zprofile  -- if login (not using this file in current setup)
```

`// end of file.`
