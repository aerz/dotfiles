#!/usr/bin/env zsh

##! docker
alias dps='docker ps'
alias dstop='docker stop $(docker ps -aq)'
alias dkill='docker rm $(docker stop $(docker ps -aq))'
alias ddelete='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'
