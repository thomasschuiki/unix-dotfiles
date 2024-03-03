if status is-interactive
    # Commands to run in interactive sessions can go here
end

###############################################
# Setup XDG Configs
###############################################
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_CACHE_HOME $HOME/.cache

###############################################
# Setup PATH
###############################################
## add local/bin to path
set -x PATH $PATH $HOME/.local/bin

###############################################
# Set defaults
###############################################
set -Ux EDITOR nvim
set -Ux TERMINAL kitty
set -Ux BROWSER firefox

###############################################
# Setup application paths/variables
###############################################
## setup go path
set -x GOPATH $XDG_DATA_HOME/go
set -x GOBIN $XDG_DATA_HOME/go/bin
set -x GOROOT

set -x PATH $PATH $GOPATH $GOBIN
## android
set -x ANDROID_HOME $XDG_DATA_HOME/android
## gpg
set -x GPG_TTY $(tty)
set -x GNUPGHOME $XDG_DATA_HOME/gnupg
## bash history
set -x HISTFILE $XDG_STATE_HOME/bash/history
## rustup
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
## cargo
set -x CARGO_HOME $XDG_DATA_HOME/cargo
## weechat home
set -x WEECHAT_HOME $XDG_CONFIG_HOME/weechat
## gtk 2
set -x GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
## less
set -x LESSHISTFILE $XDG_CACHE_HOME/less/history
## minikube
set -x MINIKUBE_HOME $XDG_DATA_HOME/minikube
## java
set -x _JAVA_OPTIONS -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java
## python
set -x PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonrc
## inputrc
set -x INPUTRC $XDG_CONFIG_HOME/readline/inputrc
## sqlite
set -x SQLITE_HISTORY $XDG_CACHE_HOME/sqlite_history
## xinit
set -x XINITRC $XDG_CONFIG_HOME/X11/xinitrc
# zoxide
zoxide init fish | source

# remove fish greeting
set -U fish_greeting

# Pure Prompt
# https://github.com/pure-fish/pure
_pure_set_default pure_show_system_time true
_pure_set_default pure_color_system_time pure_color_mute --reverse
_pure_set_default pure_show_prefix_root_prompt true
_pure_set_default pure_fresh_session true

###############################################
# Abbrevations
###############################################
# set default params
abbr -a ll 'ls -la'
abbr -a lah 'ls -alh'
abbr -a grep 'grep --colour=auto'

# app shortcuts
#abbr -a vim 'nvim'

# prevent stupid stuff
## do not delete / or prompt if deleting more than 3 files at a time #
abbr -a rm 'rm -I --preserve-root'
## Preventing changing perms on / #
abbr -a chown 'chown --preserve-root'
abbr -a chmod 'chmod --preserve-root'
abbr -a chgrp 'chgrp --preserve-root'

# Yay Shortcuts
## update all packages
abbr -a yayu 'yay -Syu'
## install new packages
abbr -a yayi 'yay -Syu'
## remove packages and all their dependencies
abbr -a yayrm 'yay -Rns'
abbr -a yayq 'yay -Qi'
## search for packages
abbr -a yays 'yay -Ss'
abbr -a yayo 'yay -Qo'
abbr -a yayl 'yay -Ql'
# shorthand for copying data to clipboard - mostly from files via <
abbr -a cclip 'xclip -se c'
