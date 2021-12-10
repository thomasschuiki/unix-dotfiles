if status is-interactive
    # Commands to run in interactive sessions can go here
end

###############################################
# Setup XDG Configs
###############################################
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache

###############################################
# Setup PATH
###############################################
## setup go path
set -x GOPATH $HOME/go
set -x GOBIN $HOME/go/bin
set -x GOROOT

set -x PATH $PATH $GOPATH $GOBIN
## add local/bin to path
set -x PATH $PATH $HOME/.local/bin

###############################################
# Set defaults
###############################################
set -Ux EDITOR nvim
set -Ux TERMINAL alacritty
set -Ux BROWSER firefox

###############################################
# Setup application paths/variables
###############################################
# weechat
set -x WEECHAT_HOME $XDG_CONFIG_HOME/weechat
# gpg
set -x GPG_TTY (tty)
# zoxide
zoxide init fish | source

# remove fish greeting
set -U fish_greeting

# Pure Prompt
# https://github.com/pure-fish/pure
_pure_set_default pure_show_system_time true
_pure_set_default pure_color_system_time pure_color_mute --reverse
_pure_set_default pure_show_prefix_root_prompt true

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
