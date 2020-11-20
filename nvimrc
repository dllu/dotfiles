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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()

" airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='hybrid'
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" c++
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1

" rust
let g:rustfmt_autosave = 1

colorscheme hybrid_material
"set background=dark
au FileType cpp ClangFormatAutoEnable
au BufWritePre *.py 0,$!yapf
au BufRead,BufNewFile *.log set nowrap
