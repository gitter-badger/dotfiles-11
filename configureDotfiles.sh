# Author: Andrew Hayes
# Name: configureDotfiles.sh
# Execution: '. ./configureDotfiles.sh'
# Purpose: This script will handle the configuration of the necessary environment for my configuration scheme to work
	# This script assumes that the dotfiles directory islocated at ~/dotfiles
	# This script does the below for: ~/.bash_profile ~/.bashrc ~/.vimrc ~/.vim ~/.gitconfig  ~/.config ~/.zprofile ~/.zshrc
	# check if exists
	#	check if exists and is a symlink
	#		if so delete
	#	else (exists but is not a symlink)
	#		rename with old in front of name
	# make link

# Take care of .bash_profile
if [ -e ~/.bash_profile ]; then
	if [ -h ~/.bash_profile ]; then
		rm ~/.bash_profile
	else
		mv ~/.bash_profile ~/.old_bash_profile
	fi
fi
ln -s ~/dotfiles/bash_profile ~/.bash_profile

# take care of .bashrc
if [ -e ~/.bashrc ]; then
	if [ -h ~/.bashrc ]; then
		rm ~/.bashrc
	else
		mv ~/.bashrc ~/.old_bashrc
	fi
fi
ln -s ~/dotfiles/bashrc ~/.bashrc

# Take care of .vimrc
if [ -e ~/.vimrc ]; then
	if [ -h ~/.vimrc ]; then
		rm ~/.vimrc
	else
		mv ~/.vimrc ~/.old_vimrc
	fi
fi
ln -s ~/dotfiles/vimrc ~/.vimrc

# Take care of .vim directory
if [ -e ~/.vim ]; then
	if [ -h ~/.vim ]; then
		rm ~/.vim
	else
		mv ~/.vim ~/.old_vim
	fi
fi
ln -s ~/dotfiles/vim ~/.vim

# Take care of .gitconfig
if [ -e ~/.gitconfig ]; then
	if [ -h ~/.gitconfig ]; then
		rm ~/.gitconfig
	else
		mv ~/.gitconfig ~/.old_gitconfig
	fi
fi
ln -s ~/dotfiles/gitconfig ~/.gitconfig

# Take care of .config
if [ -e ~/.config ]; then
	if [ -h ~/.config ]; then
		rm ~/.config
	else
		mv ~/.config ~/.old_config
	fi
fi
ln -s ~/dotfiles/config ~/.config

# Take care of .zprofile
if [ -e ~/.zprofile ]; then
	if [ -h ~/.zprofile ]; then
		rm ~/.zprofile
	else
		mv ~/.zprofile ~/.old_zprofile
	fi
fi
ln -s ~/dotfiles/zprofile ~/.zprofile

# Take care of .zshrc
if [ -e ~/.zshrc ]; then
	if [ -h ~/.zshrc ]; then
		rm ~/.zshrc
	else
		mv ~/.zshrc ~/.old_zshrc
	fi
fi
ln -s ~/dotfiles/zshrc ~/.zshrc

