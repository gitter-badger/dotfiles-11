" The vast majoirty of what is found here has been sourced from all over theA
" internet. I have not bothered to source anything as the majority of those
" authors' sources were similarly broad.

" EUNUCH IS INSTALLED.. KEEP THIS IN MIND WHEN COMPILING AVAILABLE COMMANDS

" autocmd line
autocmd!

"pathogen lines
source ~/dotfiles/vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

""""""""""""""
"TODO's Here:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TODO: figure this out: Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" set winwidth.. not completely sure the full ramifications of this.. may need
" to remove TODO
set winwidth=79

"timeout on inserts.. may cause issues TODO
:set timeout timeoutlen=1000 ttimeoutlen=100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS TODO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
	" Clear all autocmds in the group
	autocmd!
	autocmd FileType text setlocal textwidth=78
	" Jump to last cursor position unless it's invalid or in an event handler
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

	"for ruby, autoindent with two spaces, always expand tabs
	autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
	autocmd FileType python set sw=4 sts=4 et

	" Leave the return key alone when in command line windows, since it's used to run commands there.
	autocmd! CmdwinEnter * :unmap <cr>
	autocmd! CmdwinLeave * :call MapCR()

augroup END

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1

"leader setting
let mapleader=","

" allow unsaved background buffers
set hidden

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
set autoindent
set si

" Clear the search buffer when hitting return
function! MapCR()
	nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
"TODO what is this supposed to do?nnoremap <leader><leader> <c-^>

" show matching brackets
set showmatch

" show line numbers
set number

" set history length
set history=10000

" set autoread when file is altered externally
set autoread

" hilight search results
set hlsearch 
highlight Search cterm=underline

" hilight current line
set cursorline

" if you try to open an already opened buffer.. move to instead of opening a
" second
set switchbuf=useopen

"always show tabs at top
set showtabline=2

set shell=bash

" Prevent Vim from clobbering the scrollback buffer. See
" " http://www.shallowsky.com/linux/noaltscreen.html
" turning off for now.. i can see how this might be useful so i am leaving it
"set t_ti= t_te=

" " keep more context when scrolling off the end of a buffer
set scrolloff=3

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" ignore case when searching
"set ignorecase
"set smartcase
set ignorecase smartcase

" off swapfile bullshit
set noswapfile

" smart window moving
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" show command
set showcmd

" This is totally awesome - remap jj to escape in insert mode.  You'll never
" type jj anyway, so it's great!
inoremap jj <Esc>
inoremap kk <Esc>

" Incremental searching
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
	let old_name = expand('%')
	let new_name = input('New file name: ', expand('%'), 'file')
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		exec ':silent !rm ' . old_name
		redraw!
	endif
endfunction
map <leader>n :call RenameFile()<cr>

