colorscheme twilight256

set nocompatible

syntax on

set encoding=utf-8
set hidden

set colorcolumn=80
highlight LineNr ctermfg=235 ctermbg=234
highlight ColorColumn ctermbg=234 guibg=#222222
highlight TabLine ctermbg=233

set cursorline
highlight CursorLine cterm=NONE ctermbg=236 guibg=#292929

set laststatus=2
set showmode
set showcmd
set ruler
set relativenumber
set modeline
set showmatch
set wildmenu

set nowrap
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set shiftround

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set list
set listchars=tab:▸\ ,trail:·

filetype plugin indent on

call pathogen#infect()

let g:slime_target = "tmux"

autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

set wildignore+=*.py[co]

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
