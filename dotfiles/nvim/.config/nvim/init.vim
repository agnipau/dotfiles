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
Plug 'terryma/vim-multiple-cursors'

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
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Keybindings
let mapleader=" "
map <leader><leader> /
map <leader>rr :source ~/.config/nvim/init.vim <CR>
map <leader>mo :nohlsearch <CR>
map <leader>go :Goyo <CR>
map <leader>li :Limelight! <CR>
map <leader>cc :set colorcolumn=80 <CR>
map <leader>co :set colorcolumn=0 <CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <silent> <A-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
