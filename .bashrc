# .bashrc - terminal settings
# Andrew Couch

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

YELLOW="\[\033[0;33m\]"
RED="\[\033[0;31m\]"
BOLDRED="\[\033[1;31m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
TEAL="\[\033[0;36m\]"
RESET="\[\033[0m\]"

function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  if [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${TEAL}"
  elif [[ ${git_status} =~ "Changes not staged" ]]; then
    state="${RED}"
  elif [[ ${git_status} =~ "Your branch and " ]]; then
    state="${BOLDRED}"
  elif [[ ${git_status} =~ "Your branch is " ]]; then
    state="${YELLOW}"
  else
    state="${BLUE}"
  fi

  if [[ ${git_status} =~ "ntracked files" ]]; then
    extra="${GREEN}+"
  else
    extra=""
  fi

  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " ${BLUE}(${state}${branch}${extra}${BLUE})"
  fi
}

function prompt_func {
  PS1="${TEAL}\t ${YELLOW}\w$(parse_git_branch)${RESET} \$ "

  # If this is an xterm set the title
  case "$TERM" in
  xterm*|rxvt*)
      PS1="\[\e]0;\w$(__git_ps1)\a\]$PS1"
      ;;
  *)
      ;;
  esac
}

PROMPT_COMMAND=prompt_func

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


# TODO: for color settings look to https://github.com/sontek/dotfiles/blob/master/_bashrc


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
alias cloc='cloc --read-lang-def=/home/andrew/projects/cloc-force/force-def.txt'

alias tree='tree -L 3 -I *-meta.xml'

export DEBFULLNAME="Andrew Couch"
export DEBEMAIL="andy@couchand.com"

mkcd()
{
MYDIR="$1"
mkdir "$MYDIR" && cd "$MYDIR"
}

clone()
{
USER="$1"
REPO="$2"
DEST="$3"
[ -z "$REPO" ] && REPO="$USER" && USER="couchand"
[ -z "$DEST" ] && DEST="$REPO"
git clone git@github.com:$USER/$REPO.git $DEST
cd $DEST
}

clonegist()
{
GIST="$1"
DEST="$1"
[ -z "$DEST" ] && DEST="$GIST"
git clone git@github.com:$GIST.git $DEST
cd $DEST
}
