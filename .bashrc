# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

PS1='\w \$ '

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

SVN_EDITOR=vim
GIT_EDITOR=vim
EDITOR=vim
VISUAL=vim

# git aliases
alias gits='git status'
alias gitp='git add -p'
alias gitd='git diff'
alias gitc='git diff --cached'

# git typos
alias gtis='gits'
alias gtsi='gits'
alias gsti='gits'
alias gsit='gits'
alias gist='gits'

alias gtip='gitp'
alias gtpi='gitp'
alias gpti='gitp'
alias gpit='gitp'
alias gipt='gitp'

alias gtid='gitd'
alias gtdi='gitd'
alias gdti='gitd'
alias gdit='gitd'
alias gidt='gitd'

alias gtic='gitc'
alias gtci='gitc'
alias gcti='gitc'
alias gcit='gitc'
alias gict='gitc'

alias mocha='mocha --compilers coffee:coffee-script'

mkcd()
{
MYDIR="$1"
mkdir "$MYDIR" && cd "$MYDIR"
}

clone()
{
USER="$1"
REPO="$2"
[ -z "$2" ] && REPO="$USER" && USER="couchand"
git clone git@github.com:$USER/$REPO.git
}
