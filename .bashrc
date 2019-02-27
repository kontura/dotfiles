#
# ~/.bashrc
#

stty -ixon #disable ctrl-s and ctrl-q

shopt -s autocd #cd without cd, just name

HISTSIZE= HISTFILESIZE= #infite history

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=/home/amatej/bin:$PATH

export EDITOR=vim
export NNN_USE_EDITOR=1

. .bash_aliases


export NNN_DE_FILE_MANAGER=io.elementary.files
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export NNN_TMPFILE="/tmp/nnn"

n()
{
    nnn "$@"

    if [ -f $NNN_TMPFILE ]; then
        . $NNN_TMPFILE
        rm -f $NNN_TMPFILE > /dev/null
    fi
}
