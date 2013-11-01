PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
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
