# dotfiles

This repository houses all of my system configuration files and scripts.


The script configureDotFiles.sh performs the necessary configuration for these
configuration files to take effect on a new system or an old one whose
configuration scheme has become somehow corrupted.

settings.sh (liberated from various other users) is used to setup sensible defaults and has not yet been tested on the latest OSX release.

##### The following plugines are included as submodules using pathogen:
- [Command-T](https://github.com/wincent/Command-T)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [vim-airline](https://github.com/bling/vim-airline)
- [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-eunuch](https://github.com/tpope/vim-eunuch)
- [vim-instant-markdown](https://github.com/suan/vim-instant-markdown)
- [vim-pathogen](https://github.com/tpope/vim-pathogen)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- (a few more have been added)


NOTE: Some of these extensions require a bit of configuration. If your just looking to use the shortcuts without taking advantage of the plugins, your best bet is to just remove the pathogen lines at the top of my .vimrc file.
