#
# ~/.bashrc
#

stty -ixon #disable ctrl-s and ctrl-q

shopt -s autocd #cd without cd, just name

HISTSIZE= HISTFILESIZE= #infite history

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=/home/alex/bin:$PATH

export EDITOR=nvim
export NNN_USE_EDITOR=1

. .bash_aliases

export NNN_DE_FILE_MANAGER=io.elementary.files

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')\[\033[00m\] $ "

export NNN_TMPFILE="/tmp/nnn"

n()
{
    nnn "$@"

    if [ -f $NNN_TMPFILE ]; then
        . $NNN_TMPFILE
        rm -f $NNN_TMPFILE > /dev/null
    fi
}

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
