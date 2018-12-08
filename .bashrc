#
# ~/.bashrc
#

stty -ixon #disable ctrl-s and ctrl-q

shopt -s autocd #cd without cd, just name

HISTSIZE= HISTFILESIZE= #infite history

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=/home/alex/bin:$PATH

. .bash_aliases


alias ls='ls --color=auto'
export NNN_DE_FILE_MANAGER=io.elementary.files
PS1='[\u@\h \W]\$ '
