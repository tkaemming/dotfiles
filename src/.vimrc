set nocompatible

syntax on
set background=dark

set encoding=utf-8
set hidden

set colorcolumn=80
set cursorline

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

colorscheme solarized

let g:slime_target = "tmux"

autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

set wildignore+=*.py[co]

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
