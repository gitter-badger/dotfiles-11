"""""""""""""""""""""""""""""""
"setup Lines
"""""""""""""""""""""""""""""""

" autocmd line
autocmd!

"pathogen lines
source ~/dotfiles/vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" necessary powerline code
let g:airline_powerline_fonts = 1

filetype plugin on

"""""""""""""""""""""""""""""""
" Visual Settings
"""""""""""""""""""""""""""""""

" syntax highlighting
set t_Co=256
syntax enable
set background=dark "or light
colorscheme solarized

" Column at which text will be auto-rolled to next line
" set textwidth=80
" For all text files set 'textwidth' to 80 characters.
 autocmd FileType text setlocal textwidth=80

" Turn on auto complete command line using tab, only complete longest shared
" part of possible results
set wildmenu
set wildmode=list:longest,full

" this is the desired minimum, not absolute, of any new window in vim.
set winwidth=80

" underline any text beyond 80 characters
augroup vimrc_autocmds
	autocmd BufEnter * highlight OverLength cterm=underline 
    autocmd BufEnter * match OverLength /\%80v.*/
augroup END

" tab and indention settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set si

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"alwasy with the ruler
set ruler

"always with the status line
set laststatus=2

" command height taller
set cmdheight=2

" beeps for your eyes
set vb

" show matching brackets
set showmatch

" show line numbers
set number

" hilight search results
set hlsearch 
highlight Search cterm=underline

" hilight current line
set cursorline

"always show tabs at top
set showtabline=2

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" show commands as they are entered
set showcmd

"""""""""""""""""""""""""""""""
" Editing Commands
"""""""""""""""""""""""""""""""

" Display extra whitespace, uncomment when doing heavy cleanup
" set list listchars=tab:»·,trail:·

" Incremental searching
set incsearch

" open files in current working directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Clear the search buffer when hitting return
function! MapCR()
	nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" switch to alternate / last file in buffer
nnoremap <leader><leader> <c-^>

"""""""""""""""""""""""""""""""
" Custom Key Mappings
"""""""""""""""""""""""""""""""

" leader setting
let mapleader=","

" resize window shift+(H|J|K|L)
nmap K :resize +1<CR>
nmap J :resize -1<CR>
nmap H :vertical resize -1<CR>
nmap L :vertical resize +1<CR>

" when i press 1 and a direction make it 10
vmap 1j 10j 
vmap 1k 10k
vmap 1h 10h
vmap 1l 10l

nmap 1j 10j 
nmap 1k 10k
nmap 1h 10h
nmap 1l 10l

" smart window moving
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" jj and kk exit insert mode
inoremap jj <Esc>
inoremap kk <Esc>

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

" cntrl+C joins lines now
map <C-c> :join<Cr>

"""""""""""""""""""""""""""""""
" Other Settings
"""""""""""""""""""""""""""""""

" ignore case when searching unless case is used in the search
set ignorecase smartcase

" off swapfile bullshit
set noswapfile

" Use Vim settings, rather then Vi settings
set nocompatible 

" dont make temp backup 
set nobackup

" allow unsaved background buffers
set hidden

" not sure the colon is necessary here but the examples i have found use it
"timeout on inserts.. may cause issues TODO
:set timeout timeoutlen=1000 ttimeoutlen=100

augroup vimrcEx

	" Jump to last cursor position unless it's invalid or in an event handler
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

	"for ruby, autoindent with two spaces, always expand tabs
	autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

	" Leave the return key alone when in command line windows, since it's used to run commands there.
	autocmd! CmdwinEnter * :unmap <cr>
	autocmd! CmdwinLeave * :call MapCR()

augroup END

" set history length
set history=10000

" set autoread when file is altered externally
set autoread

" if you try to open an already opened buffer.. move to instead of opening a
" second
set switchbuf=useopen

" shell
set shell=bash

" rename current file
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

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
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