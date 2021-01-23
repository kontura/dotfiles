
youtubeToMp3(){
    youtube-dl --extract-audio --audio-format mp3 $1
}

g(){
    ag --nobreak --noheading . | fzf
}

f(){
    fzf
}

# Easy way to extract archives
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias ccat='highlight --out-format=ansi'

alias sus='systemctl suspend'
alias suspend='systemctl suspend'

alias v='vim'
alias vi='vim'
alias pa='sudo pacman'

alias gits='git status'
alias s='git status'

alias dockerstopall='docker stop $(docker ps -aq)'
alias dockerrmall='docker rm $(docker ps -aq)'
alias podmanstopall='podman stop $(podman ps -aq)'
alias sudopodmanstopall='sudo podman stop $(sudo podman ps -aq)'
alias podmanrmall='podman rm $(podman ps -aq)'
alias sudopodmanrmall='sudo podman rm $(sudo podman ps -aq)'
alias redmine='rvm use 1.9.3; cd /usr/share/webapps/redmine; ruby bin/rails s -b 0.0.0.0 webrick -e production -p 3001'
alias redmine_3.1.4='rvm use 1.9.3; cd ~/Downloads/redmine-3.1.4; ruby bin/rails s -b 0.0.0.0 webrick -e production -p 3001'

alias p='ping 8.8.8.8'
alias disk_usage='ncdu'
alias rnm='systemctl restart NetworkManager'

alias audio='pulsemixer'
alias gif='gifview -a'
alias vim='nvim'

alias untar='tar -xvf'
