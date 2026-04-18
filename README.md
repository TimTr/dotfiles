# Dotfiles for Tim Triemstra

To install, clone the repo and run `./setup.sh` as follows:

```shell

  git clone https://github.com/timtr/dotfiles.git
  cd dotfiles
  ./setup.sh

  # Quit and re-launch terminal for changes to take effect
```

On macOS, Xcode must first be installed. Linux is tested on recent Ubuntu releases. 

The setup adds `$HOME/.local/bin` and `/opt/homebrew/bin` to the PATH for local scripts and Homebrew support. The `local.sh` file is installed in `~/.config` to further customize the local environment. Scripts, binaries, and some config files are installed using the [XDG directory](https://specifications.freedesktop.org/basedir/latest/) structure. 


### [Documentation](./Docs/)

Documentation is generated within [GitHub Pages](https://timtr.github.io/dotfiles/Docs/) for this repository. It is a work-in-progress, presently. Moving to a local setup of documentation using [Swift-DocC](https://www.swift.org/documentation/docc/) but not yet implemented.


## Overview

This is the personal collection of setup scripts for macOS and Linux (WIP). It includes settings for macOS using `zsh` shell, `eza` for `ls` replacement, Terminal, Xcode, Swift, Homebrew, and Ruby. The Linux install is based on `bash` and still uses mostly default tools.

Defaults such as `~/.local/bin` are used, leaving the `$XDG_DATA_HOME` and related variables empty for now. You may want to update the `~/.local/share/local.sh` file to augment local behavior that you don't want to see in a shared repository.


## Work-specific Git configuration

The macOS install includes a `dot-gitconfig-work` file that is installed to control the Git behavior for respositories stored in the `~/Documents` directory. It sets up code signing at commit time, and changes the username and email for those commits to work accounts. This general approach can work for any sub-directory custom configuration.


## Setup SSH keys to easily login to remote servers

TODO: 


## Features

**local.sh** - A file called `~/local.sh` is installed (if doesn't exist) that you can customize with settings that do not belong checked into GitHub, for instance set certain keys, or environment variables. This is also the file to add things like feature flags during development, define a Swift toolchain, or to enable secret build settings. Re-running `dotfiles.sh` will never override this file, so if you want to restart from scratch, just delete the file and the re-install dotfiles to get a fresh setup.

**ZSH dotfiles** - set up the prompt, `$PATH`, and other basic settings. The `.zshenv` file sets up `$PATH` so it works even when there is no interactive terminal session, and `.zshrc` will source this file as well.

**Dropbox** - Optional symlink in `$HOME` points to `~/Library/CloudStorage/Dropbox` if Dropbox is installed on the computer. This is often commented out.


# Reference

## Using a custom Swift toolchain

You can download new Swift toolchains from [Swift.org](https://swift.org/download/#snapshots) and set them to be used by default.  The `~/local.sh` file is perfect to place to configure these settings per-machine, rather than configure in the main Dotfiles repo.

## XDG directory and configuration structure

You can also read the [XDG base directory specification](https://specifications.freedesktop.org/basedir/latest/) for how you may want to augment the configuration. 

## Demos

Once installed, you can install Homebrew and run demos. For example, run `demo-homebrew.sh` from the `Dotfiles/Demos` to show a Terminal screen of software being downloaded, built, installed, and erased (in a repeating loop). Hit `CONTROL-Z` to quit that demo.

You can also open the `Dotfiles/Demos/demo-safari-cycle.html` file to launch Safari and begin cycling through many web pages, simulating an automated web test harness.


## Useful links

Documentation (or the start of docs) can be [found here](https://timtr.github.io/Dotfiles/docs/). Note that the `docs` directory must be in lower-case for GitHub Pages support. Capital `Docs` will fail.

Which `zsh` files contain which settings: [CodeSpaces and Dotfiles](https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout)

Docs on using `setup.sh` with [GitHub CodeSpaces and Dotfiles](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account)

EZA themes are found in `~/Library/Application Support/eza` - for more info see: https://github.com/eza-community/eza-themes/blob/main/README.md or do manual overrides using information here: https://github.com/ogham/exa/blob/master/man/exa_colors.5.mde


### ZSH order of loading

For reference, `zsh` config files are loaded in the following order:

``` shell
    .zshenv    -- global (even non-interactive), useful for PATH and tooling variables
    .zshrc     -- loaded from the interactive shell (e.g. a Terminal window)
    .zprofile  -- if login (not using this file in current setup)
```



`// end of file.`
