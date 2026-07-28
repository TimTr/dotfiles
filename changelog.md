# ChangeLog

Dotfiles history and currently open to-do items


## ToDo issues

- Continue fixing the PATH overrides from the OS


## Change history

Added `.zprofile` to the list - and moved PATH config to it
- Fixes that `path_helper` via `/etc/zprofile` was blasting over `PATH` settings

Add `cmux` support for terminal.  This will include Ghostty config too.
- [https://cmux.com/docs/configuration](https://cmux.com/docs/configuration) shows how to setup config

Add install of `zsh` into the Linux setup scripts
  - `sudo apt install zsh git fonts-font-awesome`
  - then run `chsh` and enter `/usr/bin/zsh` at the prompt
  - Or just type: `chsh -s /usr/bin/zsh` and return
  - restart the terminal window

Switching the shell in the VPS provider my require a web UI change
