
youtubeToMp3(){
  youtube-dl --extract-audio --audio-format mp3 $1
}

g(){
  grep -R $1 * --exclude=$2
}

f(){
  find . -name "*$1*"
}

alias clock="tty-clock -c -C 7 -B"
alias date='date +%F--%r'
alias cpass='pass -c'
alias sus='systemctl suspend'
alias suspend='systemctl suspend'
alias wall='hsetroot -center'
alias n='/usr/local/bin/nnn -p /home/alex/bin/nlay'

alias v='vim'
alias vi='vim'
alias pa='sudo pacman'

alias dockerstopall='docker stop $(docker ps -aq)'
alias dockerrmall='docker rm $(docker ps -aq)'
alias redmine='rvm use 1.9.3; cd /usr/share/webapps/redmine; ruby bin/rails s -b 0.0.0.0 webrick -e production -p 3001'
alias redmine_3.1.4='rvm use 1.9.3; cd ~/Downloads/redmine-3.1.4; ruby bin/rails s -b 0.0.0.0 webrick -e production -p 3001'

alias p='ping google.com'
alias disk_usage='ncdu'
alias rnm='systemctl restart NetworkManager'

alias audio='pulsemixer'
alias gif='gifview -a'
