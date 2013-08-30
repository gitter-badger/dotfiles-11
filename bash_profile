
if [ -f ~/dotfiles/bashrc ]; then
	source ~/dotfiles/bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
