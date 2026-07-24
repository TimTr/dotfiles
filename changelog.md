# ChangeLog

Dotfiles history and currently open to-do items


## ToDo issues

- Importing `.profile` from other setup dotfiles may be creating some circular references and undesired behavior. For instance, it may be resulting in the Zed editor spawning an extra empty editor window when running Zed from the command line.


## Change history

Add `cmux` support for terminal.  This will include Ghostty config too.
- [https://cmux.com/docs/configuration](https://cmux.com/docs/configuration) - shows how to setup config

- Add install of `zsh` into the Linux setup scripts
  - `sudo apt install zsh git fonts-font-awesome`
  - then run `chsh` and enter `/usr/bin/zsh` at the prompt
  - Or just type: `chsh -s /usr/bin/zsh` and return
  - restart the terminal window
- Switching the shell in the VPS provider my require a web UI change
