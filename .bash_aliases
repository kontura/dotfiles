
youtubeToMp3(){
  youtube-dl --extract-audio --audio-format mp3 $1
}

g(){
  grep -R $1 * --exclude=$2
}

b(){
  rm -rf build
  mkdir build
  cd build
  cmake ..
  make -j5
  make -j5 tests
  make -j5 test
  cd ..
}

f(){
  find . -name "*$1*"
}

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'

alias clock="tty-clock -c -C 7 -B"
alias date='date +%F--%r'
alias cpass='pass -c'
alias sus='systemctl suspend'
alias suspend='systemctl suspend'
alias wall='hsetroot -center'

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
alias vim='gvim -v'
