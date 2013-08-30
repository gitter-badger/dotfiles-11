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
alias sshimac="ssh iMac@iMac.local"
alias sshafzelia="ssh andrewrussellhayes@afzelia.dreamhost.com"

# command alias
alias reload=". ~/.bash_profile"
alias gitconf="cat ~/dotfiles/gitconfig"
