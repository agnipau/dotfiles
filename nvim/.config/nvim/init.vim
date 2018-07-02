" init.vim
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8


" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'baskerville/vim-sxhkdrc'

call plug#end()


" Enter Limelight every time Goyo is toggled
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" Some opts
syntax on
colorscheme wal
set notermguicolors
set hidden
set history=100
set number
set hlsearch
set incsearch
set ignorecase
set nobackup
set nowritebackup
set noswapfile
set nocursorline
set backspace=indent,eol,start
set clipboard=unnamedplus


" Keybindings
let mapleader=" "
map <leader><leader> /
map rr :source ~/.config/nvim/init.vim <CR>
map mo :nohlsearch <CR>
map go :Goyo <CR>
