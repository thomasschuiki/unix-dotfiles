# ~/.bashrc: executed by bash(1) for non-login shells.

# include original bashrc
if [ -f ~/.bashrc.orig ]; then
    . ~/.bashrc.orig
fi

# include bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
#bold=$(tput bold)
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white
FG="\[\033[15m\]"
BG1="\[\033[48;5;237m\]"
BYEL2="\[\033[48;5;214m\]"
FBG="\[\033[38;5;235m\]"

# all the colors!
force_color_prompt=yes
alias grep='grep --color=auto'

# turn off CTRL+s
stty stop undef
stty -ixon # Disable ctrl-s and ctrl-q.

HISTSIZE= HISTFILESIZE= # Infinite history.
# default terminal
export TERMINAL=st

# load configs

#PS1="$BWHT$FBG$HC[${debian_chroot:+($debian_chroot)}\u@\h]$RS $bold$FBLE\w$RS $FRED\$git_dirty$RS\$ "
PS1="$RS\t$FBLE [ $FGRN\u @ \h $FBLE]$RS \w $RS\$ "

# include files
for file in ~/.{bash_prompt,aliases,dockerfunc}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file

[ -s "/home/tom/.scm_breeze/scm_breeze.sh" ] && source "/home/tom/.scm_breeze/scm_breeze.sh"
