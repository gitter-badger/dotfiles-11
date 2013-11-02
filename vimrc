"""""""""""""""""""""""""""""""
"setup Lines
"""""""""""""""""""""""""""""""

filetype plugin on " detect filetypes
let g:airline_powerline_fonts = 1 " necessary powerline code
" pathogen lines
source ~/dotfiles/vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect() 
" autocmd line
autocmd! 

"""""""""""""""""""""""""""""""
" Visual Settings
"""""""""""""""""""""""""""""""

set t_Co=256 | syntax enable | set background=dark | colorscheme solarized " syntax highlighting
set textwidth=80 " Column at which text will be auto-rolled to next line
set winwidth=80 " this is the desired minimum, not absolute, of any new window in vim.
set splitbelow " Open new split panes to right and bottom, which feels more natural
set splitright " Open new split panes to right and bottom, which feels more natural
set ruler "alwasy with the ruler
set laststatus=2 "always with the status line
set cmdheight=2 " command height taller
set vb " beeps for your eyes
set showmatch " show matching brackets
set number " show line numbers
set hlsearch | highlight Search cterm=underline " hilight search results while typing, underline after enter.
set cursorline " hilight current line
set showtabline=2 "always show tabs at top
set scrolloff=3 " keep more context when scrolling off the end of a buffer
set showcmd " show commands as they are entered
set wildmenu | set wildmode=list:longest,full  " autocomplete settings

" tab and indention settings
set tabstop=4 | set shiftwidth=4 | set softtabstop=4
set smarttab | set autoindent | set si

" underline any text beyond 80 characters
augroup vimrc_autocmds
	autocmd BufEnter * highlight OverLength cterm=underline 
    autocmd BufEnter * match OverLength /\%81v.*/
augroup END

"""""""""""""""""""""""""""""""
" Editing Commands
"""""""""""""""""""""""""""""""

" When running a program, automatically save it
set autowrite

" Display extra whitespace, uncomment when doing heavy cleanup
" set list listchars=tab:»·,trail:·

" Clear the search buffer when hitting return
function! MapCR()
	nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

set incsearch " Incremental searching
set backspace=indent,eol,start " allow backspacing over everything in insert mode
nnoremap <leader><leader> <c-^> " switch to alternate / last file in buffer

"""""""""""""""""""""""""""""""
" Custom Key Mappings
"""""""""""""""""""""""""""""""

let mapleader="," " leader setting

" resize window shift+(H|J|K|L)
nmap K :resize +1<CR>
nmap J :resize -1<CR>
nmap H :vertical resize -1<CR>
nmap L :vertical resize +1<CR>

" This function turns 1h,j,k&l into 10h,j,k&l in both normal and visual mode.
"	It is not totally clear why this works the way that it does. It appears that
"	the 0 in the mapping is appended to the 1 as it certainly still works as
"	expected. This function is necessary because the simple 1-10 mapping yeilds
"	some undesirable side effects.

function TenMovement(type)
    if v:count == 1
        return '0'.a:type
    else
        return a:type
    endif
endfunction
nnoremap <expr> j TenMovement('j') | nnoremap <expr> k TenMovement('k')
nnoremap <expr> l TenMovement('l') | nnoremap <expr> h TenMovement('h')
vnoremap <expr> j TenMovement('j') | vnoremap <expr> k TenMovement('k')
vnoremap <expr> l TenMovement('l') | vnoremap <expr> h TenMovement('h')

map <C-j> <C-W>j | map <C-k> <C-W>k | map <C-h> <C-W>h | map <C-l> <C-W>l " smart window moving
imap <c-l> <space>=><space> " Insert a hash rocket with <c-l>
inoremap jj <Esc> | inoremap kk <Esc> " jj and kk exit insert mode
nnoremap <silent> <C-n> :tabnext<CR> " Next Tab
nnoremap <silent> <C-p> :tabprevious<CR> " Previous Tab
nnoremap <silent> <C-t> :tabnew<CR> " New Tab
map <Esc><Esc> :w<CR> " save on 2 esc's
"Auto-commit on save if in git directory
autocmd BufWritePost * execute ':silent ! if git rev-parse --git-dir > /dev/null 2>&1 ; then git add % ; git commit -m "Auto-commit: saved %"; fi > /dev/null 2>&1'
map <C-z> u " make ctrl z not send the kill command
map <C-c> :join<Cr> " cntrl+C joins lines now
:nnoremap Q <Nop> " not go into ex mode when i press q

nmap ff :! echo "test"

"""""""""""""""""""""""""""""""
" Other Settings
"""""""""""""""""""""""""""""""

set ignorecase smartcase " ignore case when searching unless case is used in the search
set noswapfile " off swapfile bullshit
set nocompatible " Use Vim settings, rather then Vi settings
set nobackup " dont make temp backup 
set hidden " allow unsaved background buffers
set history=10000 " set history length
set autoread " set autoread when file is altered externally
set switchbuf=useopen " if you try to open an already opened buffer.. move to instead of opening a second
set shell=bash " shell
:set timeout timeoutlen=1000 ttimeoutlen=100 "timeout on inserts

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

