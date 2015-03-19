#!/bin/bash

############################################################

alias ls='ls -G'
alias ll='ls -lG'
alias lla='ls -laG'
alias la='ls -aG'

alias sl='ls'
alias cd..='cd ..'

export GREP_COLOR='1;37;41'
alias grep='grep -E --color=auto'

alias cpi='cp -iv'
alias mvi='mv -iv'
alias rmi='rm -iv'
alias rm='rm -i'
alias ln='ln -i'

alias ping='ping -c 5'

alias h='history | grep'

alias sha1='echo -n "${1}" | openssl sha1 | sed "s/^.* //"'

alias gs='git status -s -b'
alias gst='git status'

############################################################

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

source ~/shell/git-prompt.sh
source ~/shell/git-completion.bash
#GIT_PS1_SHOWDIRTYSTATE=true


if [ $(id -u) -eq 0 ]; then
  PS1='\[\e[0;35m\]\u@\h:\w\[\e[00m\] \$ '
else
  PS1='\[\e[0;32m\]\u@\h:\w\[\e[00m\]\[\e[0;36m\]$(__git_ps1)\[\e[00m\] \n\$ '
fi


############################################################

if [ "x$(uname)" == "xDarwin"]; then
  # setting for Mac OS X
  export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
  alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
  alias mvimdiff='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvimdiff "$@"'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # setting for Linux
elif [ "x$(expr substr $(uname -s) 1 6)" == "xCYGWIN" ]; then
  # setting for Cygwin
fi

############################################################
