export PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PS1="[\h \T \w] "

# listing
alias al="ls -hablL"
alias l="ls -hblL"
alias ld="ls -hablL | egrep '^d'"
alias lf="ls -hablL | egrep -v '^d'"
alias hlrt="ls -hlrtabL"
alias abl="ls -abl"

# navigation
alias home="cd ~/"
alias dev="cd ~/dev"
alias dkr="cd ~/dev/docker"
alias dotfiles="cd ~/dev/dotfiles"

# cd alias's
alias cd.="cd .."
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias cd....="cd ../../../.."
alias cd.....="cd ../../../../.."
alias cd......="cd ../../../../../.."

# ssh alias's
#alias sshair="ssh andrew@10.0.1.2"
#alias sshimac="ssh iMac@10.0.1.3"
#alias sshpi="ssh pi@10.0.1.4"
#alias sshbbb="ssh root@10.0.1.5"
#alias sshdh="ssh andrewrussellhayes@andrewrussellhayes.com"

# command alias
alias reboot="shutdown -r now"
alias reload=". ~/.bash_profile"
alias gitconf="cat ~/dotfiles/gitconfig"

#docker stuff.. move into own file
#Docker alias's
alias dpsa="docker ps -a"
alias dps="docker ps"
alias dimages="docker images"
#docker envs
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/andrew/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
echo ".bashrc boot2docker command results: (Should see 3 lines:)"
(boot2docker shellinit)
b2d(){ 
	boot2docker $1 
}
drm(){ 
	docker rm $1 
}
drmi(){ 
	docker rmi $1 
}

b2drebuild(){
	boot2docker poweroff
	boot2docker delete
	boot2docker init
	boot2docker up
}

# if 1 arg the arg is version number
# if 2 arg then arg1 prefix before current directory basename eg arg1/basename 
	# and arg2 is version number
dbuild(){
	docker build -t `basename $(pwd)` ./.

	if [ -n "$1" ] && [ -n "$2" ]; then
		docker build -t $1/`basename $(pwd)`:$2 ./.
	elif [ -n "$1" ]; then
		docker build -t `basename $(pwd)`:$1 ./.
	fi
}

#keep latest of duplicates
export HISTCONTROL=erasedups

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
