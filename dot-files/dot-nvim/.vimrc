syntax on

" MAPPINGS -----------------------------

map <Down> <NOP>
map <Up> <NOP>
map <Left> <NOP>
map <Right> <NOP>
map <F2> :colorscheme spaceduck<CR>
map <F3> :colorscheme moonfly<CR>

inoremap jj <esc>
nnoremap <leader>\ ``
nnoremap <space> :
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><

" SETTINGS ----------------------------

let g:airline_theme = 'spaceduck'
let g:user_emmet_install_global = 0
set number
set noerrorbells
set tabstop=4
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set wildmenu
set confirm
set title
set scrolloff=10
set showcmd
set hlsearch
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pyc,*.deb,*.flv,*.img,*.xlsx

set list
set listchars=tab:>\ ,trail:●,extends:…,precedes:…,space:·

let g:user42 = 'ddiniz'
let g:mail42 = 'ddiniz@student.42sp.org.br'
" }}}

" PLUGINS-------------------------------

call plug#begin('~/.vim/plugged')

Plug 'cseelus/vim-colors-lucid'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug '42Paris/42header'
Plug 'sheerun/vim-polyglot'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'bluz71/vim-moonfly-colors'

call plug#end()

" VIMSCRIPT-----------------------------
" HTML settings
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" Undo changes even if I save the file
if version >= 703
	set undodir=~/.vim/backup
	set undofile
	set undoreload=10000
endif

autocmd Filetype html,css EmmetInstall

autocmd FileType c,cpp,md setlocal comments-=:// comments+=f://

" Comments and Uncomments--------------
map gc :call Toggle()<CR>

function! Comment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
		silent s/^/\#/
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go' || ft == 'md'
		silent s:^:\/\/ :g
	elseif ft == 'tex'
		silent s:^:%:g
	elseif ft == 'vim'
		silent s:^:\":g
	endif
endfunction

function! Uncomment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
		silent s/^\#//
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go' || ft == 'md'
		silent s:^\/\/ ::g
	elseif ft == 'tex'
		silent s:^%::g
	elseif ft == 'vim'
		silent s:^\"::g
	endif
endfunction

function! Toggle()
	try
		call Uncomment()
	catch
		call Comment()
	endtry
endfunction
