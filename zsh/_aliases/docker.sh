alias dckp='docker ps'
alias dcks='docker stop $(docker ps -aq)'
alias dckkd='docker rm $(docker stop $(docker ps -aq))'
alias dckdall='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'
