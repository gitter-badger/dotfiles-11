" The vast majoirty of what is found here has been sourced from all over theA
" internet. I have not bothered to source anything as the majority of those
" authors' sources were similarly broad.

"pathogen lines
source vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"alwasy with the ruler
set ruler

"always with the status line
set laststatus=2

" command height taller
set cmdheight=2

" beeps for your eyes
set vb

filetype plugin on

" syntax highlighting
set t_Co=256
syntax enable
set background=dark "or light
colorscheme solarized

" tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" show matching brackets
set showmatch

" show line numbers
set number

" set history length
set history=1000

" set autoread when file is altered externally
set autoread

" hilight search results
set hlsearch

" ignore case when searching
set ignorecase
set smartcase

" off swapfile bullshit
set noswapfile

" be good about indention
set ai
set si

" smart window moving
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l 


" Remap VIM 0 to first non-blank character 
map 0 ^ 

" show command 
set showcmd
	
"TODO: figure this out: Cool tab completion stuff
"set wildmenu
"set wildmode=list:longest,full

" This is totally awesome - remap jj to escape in insert mode.  You'll never
" type jj anyway, so it's great!
inoremap jj <Esc>
inoremap kk <Esc>

" Incremental searching is sexy
set incsearch

" Next Tab
nnoremap <silent> <C-n> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-p> :tabprevious<CR>

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

" save on 2 esc's
map <Esc><Esc> :w<CR>

" make ctrl z not send the kill command
map <C-z> u

" resize window shift+(H|J|K|L)
nmap K :resize +1<CR>
nmap J :resize -1<CR>
nmap H :vertical resize -1<CR>
nmap L :vertical resize +1<CR>

" cntrl+C joins lines now
map <C-c> :join<Cr>

