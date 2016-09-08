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
