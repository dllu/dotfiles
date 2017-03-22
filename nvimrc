set history=10000
filetype plugin on
filetype indent on
set autoread
let $LANG='en'
set langmenu=en
" enable mouse
if has('mouse')
    set mouse=a
endif
" enable syntax highlighting
syntax enable
" encoding and formats
set encoding=utf8
set ffs=unix,dos,mac
" tabs and stuff
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ruler
set backspace=indent,eol,start
set relativenumber
set autoread
" gj, gk
map j gj
map k gk
set clipboard+=unnamedplus
set autoread

" plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

" airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='molokai'

" c++
let g:cpp_class_scope_highlight=1

colorscheme molokai
set background=dark
