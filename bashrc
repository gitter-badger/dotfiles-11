export PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PS1="[\h \T \w] "

alias dev="cd /Users/andrew/dev"
alias al="ls -hablL"
alias l="ls -hblL"
alias ld="ls -hablL | egrep '^d'"
alias lf="ls -hablL | egrep -v '^d'"
alias hlrt="ls -hlrtabL"
alias home="cd ~/"
alias abl="ls -abl"

# cd alias's
alias cd.="cd .."
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias cd....="cd ../../../.."
alias cd.....="cd ../../../../.."
alias cd......="cd ../../../../../.."

# ssh alias's
alias sshair="ssh andrew@10.0.1.2"
alias sshimac="ssh iMac@10.0.1.3"
alias sshpi="ssh pi@10.0.1.4"
alias sshbbb="ssh root@10.0.1.5"
alias sshdh="ssh andrewrussellhayes@andrewrussellhayes.com"

# command alias
alias reboot="shutdown -r now"
alias reload=". ~/.bash_profile"
alias gitconf="cat ~/dotfiles/gitconfig"

#docker stuff.. move into own file
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/andrew/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
b2d(){
	boot2docker $1;
}

#Docer alias's
alias dpsa="docker ps -a"
alias dps="docker ps"

#keep latest of duplicates
export HISTCONTROL=erasedups

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
