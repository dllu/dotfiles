set history=10000
filetype plugin on
filetype indent on
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
" gj, gk
map j gj
map k gk
set clipboard+=unnamedplus
set autoread

" plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mindriot101/vim-yapf'
call plug#end()

" lightline
let g:lightline = {
      \ 'colorscheme': 'powerlineish',
      \ }

" c++
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1

" rust
let g:rustfmt_autosave = 1

colorscheme dllu
" set background=dark
au FileType cpp ClangFormatAutoEnable
"au BufWritePre *.py Yapf
au BufRead,BufNewFile *.log set nowrap

syntax sync minlines=800
