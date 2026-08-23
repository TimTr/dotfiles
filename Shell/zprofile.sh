# .zprofile - Loaded once, for login shells only, AFTER /etc/zprofile runs
#
# On macOS, /etc/zprofile runs after ~/.zshenv and calls `path_helper`,
# which rebuilds $PATH from /etc/paths + /etc/paths.d/* and puts those
# system directories back in front of anything ~/.zshenv already set.
# That silently undoes the Homebrew-first, XDG-first ordering from
# .zshenv for every login shell (Terminal, iTerm, etc.).
#
# This file is guaranteed to load after path_helper, so re-assert the
# same ordering here. `typeset -U path` (set in .zshenv) makes PATH
# de-dupe automatically, so re-prepending these is safe.


# Restore the PATH that was saved from .zshenv
export PATH=$ZSHENV_PATH



# end of file.