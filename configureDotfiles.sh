# This script will rename your current .bash_profile and .vimrc and copy the version in ~/dotfiles/ that has the appropriate redirect

# Take care of .bash_profile
if [ -e ~/.bash_profile ]; then
	mv ~/.bash_profile ~/.old_bash_profile
fi
cp ~/dotfiles/source.bash_profile ~/.bash_profile

# Take care of .vimrc
if [ -e ~/.vimrc ]; then
	mv ~/.vimrc ~/.old_vimrc
fi
cp ~/dotfiles/source.vimrc ~/.vimrc

# Take care of .vim directory
if [ -L ~/.vim ]; then
	rm -r ~/.vim
fi
if [ -d ~/.vim ]; then
	mv ~/.vim ~/.old_vimDir
fi	
ln -s ~/dotfiles/vim ~/.vim

# add creation of .gitconfig symlink
