#ToDo:

###General ToDo:

1. Finish up README.md
2. Add irb config set irb to default to simple.. or maybe just make an alias in bash like irbs = irb --simpleprompt
3. In settings.sh change to loop structure that utilizes either an internal or external file list.
4. Go through old directory and pull anything useful. (norepeat history)
5. Find out if there is a way to include files based on system so debian and osx etc would have separate files.
6. Add shortcut for pi to start and stop vnc sudo /etc/init.d/tightvncserver start 
7. Switch to zsh.
8. Add to config script.. if dotfiles is not located in the ~/ directory then make a simlink to its actual location from the ~/ directory
9. add .shrc and .profile config and to script
10. add watson https://github.com/nhmood/watson-ruby
11. mess with powerline
12. change the .profile in this directory
13. add zsh to config script, ~/.oh-my-zsh and ~/.zshrc
14. check current dotfiles in ~/ add necessary here
15. go through dotfiles and configure so that shells are loaded in preferred
	order.
16. add to bashrc/zshrc a command that does the following with a similar
	structure to the way i currently do the cd. cd.. cd... thing but with ls.
	ls.. ls... and have it list that many directories deep and print some sort
	of quick little graphical representation. should be pretty easy to do with a
	nested loop or two.

###vimrc ToDo:

1. Hashrocket Shortcut is not working properly.. Is there a conflict?
2. Break up vimrc into commands and mappings etc. put into separate files and then source from vimrc.
	- Can this be done by placing files in the .vim folder? How is this folder used?
3. Can I map a quick double caps to be escape and still leave single caps as ctrl?
4. Remap 'uu' to perform undo while in insert mode.
5. Use smart tabs http://vim.wikia.com/wiki/Indent_with_tabs,_align_with_spaces
6. Add a past shortcut. :set paste and :set nopaste
7. Can I change the granularity of the undo?
8. Add 1w mapping to 10w like i did for j k l and h.
9. configure plugins:
	- Command-T
	- nerdtree
	- airline
	- solarized
	- commentary
	- eunuch
	- pathogen
	- repeat
	- vim-instant-markdown
10. Make custom help page:
	- The command to access this information should be ':help me'
	- put vimrc info -- before this, pull from or install vim-unimpared
	- key usage and shortcuts for plugins
	- list my custom mappings
	- should this be a plugin?
11. look into Slim template engine. allows simple html tags.. use when developing own site in ruby. https://github.com/slim-template/vim-slim and https://github.com/slim-template/slim
12. Add https://github.com/tpope/vim-endwise ?
13. Go through https://github.com/tpope/vim-sensible and pull any desired
	- same with https://github.com/tpope/vim-scriptease
14. Install and see the results of https://github.com/tpope/vim-sleuth
15. look into installing https://github.com/tpope/vim-fugitive
	- same with https://github.com/vim-ruby/vim-ruby

