call plug#begin()

Plug 'Chiel92/vim-autoformat'

Plug 'w0rp/ale'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

call plug#end()

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"unicode symbols
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

"ale
let g:ale_fixers = {
  'javascript': ['eslint']
}

"let g:ale_javascript_eslint_use_global = 1

let g:ale_sign_error = '✘'
let g:ale_sign_style_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_sign_style_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_fix_on_save = 1

"sensibles
set encoding=utf-8
set ignorecase
set number
set hidden
set nocompatible
set incsearch
set backspace=indent,eol,start
set hlsearch
set showcmd

"indentation
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap
 
"visual
set laststatus=2
set showmatch
set cursorline

set t_Co=256
colorscheme gruvbox
set background=dark
let g:rehash256 = 1

"filetypes
filetype on
filetype indent on
filetype plugin on
syntax on

autocmd FileType python set expandtab
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html setl sw=2 ts=2 et sts=2

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
"packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
"silent! helptags ALL
