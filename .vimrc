syntax on
set nocompatible                   " don't try to be vi compatible
set number                         " show line numbers
set relativenumber                 " show absolute number in selected line
set ignorecase smartcase           " ignore case, except if contains uppercase
set incsearch                      " incremental search
set hlsearch                       " highlight search
set noerrorbells visualbell t_vb=  " don't ring the fucking bell
set termencoding=utf-8             " utf-8 terminal
set encoding=utf-8                 " utf-8 encoding
set showmatch                      " matching parentheses
set matchpairs+=<:>                " add < > to matching via %
set nocursorline                   " underline current cursor position with line
set hidden                         " hide modified buffers and don't warn
set nowrapscan                     " don't wrap the search
set nostartofline                  " don't move to first non-space char in line
set endofline                      " make sure last line ends with \n
set backspace=indent,eol,start     " expected backspace behavior
set ttyfast                        " of course we're in a fast tty
set ruler                          " enable the bottom line
set textwidth=0                    " no auto wrapping
set wrapmargin=0                   " really no auto wrapping
set scrolloff=7                    " lines to keep visible when scrolling
set title                          " set x11 window title
set confirm                        " ask for saving confirmation if forgotten

" autocomplete
set wildignorecase
set wildmode=longest:full,full
set wildignore+=*~
set wildignore+=*.swp

let mapleader = ","

" move a line of text using ALT+[jk]
" fix for vim (works for gvim)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" control-backspace and control-delete for backward and forward word removal
imap <C-BS> <C-w>
noremap! <C-BS> <C-w>

" ignore Ctrl when tabbing in insert mode
inoremap <C-Tab> <Tab>

" use w!! to save files with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" refresh vimrc (this file) after saving
autocmd BufWritePost ~/.vimrc source %

" autosave delay, cursorhold trigger, default: 4000ms
setl updatetime=750

