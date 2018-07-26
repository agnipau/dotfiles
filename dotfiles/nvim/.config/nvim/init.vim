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


function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" Statusline
let g:currentmode={
  \ 'n'  : 'NORMAL ',
  \ 'no' : 'N·OPERATOR PENDING ',
  \ 'v'  : 'VISUAL ',
  \ 'V'  : 'V·LINE ',
  \ '' : 'V·BLOCK ',
  \ 's'  : 'SELECT ',
  \ 'S'  : 'S·LINE ',
  \ '' : 'S·BLOCK ',
  \ 'i'  : 'INSERT ',
  \ 'R'  : 'REPLACE ',
  \ 'Rv' : 'V·REPLACE ',
  \ 'c'  : 'COMMAND ',
  \ 'cv' : 'VIM EX ',
  \ 'ce' : 'EX ',
  \ 'r'  : 'PROMPT ',
  \ 'rm' : 'MORE ',
  \ 'r?' : 'CONFIRM ',
  \ '!'  : 'SHELL ',
  \ 't'  : 'TERMINAL '}

hi PrimaryBlock ctermfg=00 ctermbg=01_lighter_20
hi SecondaryBlock ctermfg=07 ctermbg=11
hi Blanks ctermfg=08 ctermbg=00

highlight EndOfBuffer ctermfg=black ctermbg=black

set statusline=
set statusline+=%#PrimaryBlock#
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%#SecondaryBlock#
set statusline+=%{StatuslineGit()}
set statusline+=%#Blanks#
set statusline+=\ %t\ 
set statusline+=%(%m%)
set statusline+=%=
set statusline+=%#SecondaryBlock#
set statusline+=\ Ln
set statusline+=\ %l
set statusline+=,Col
set statusline+=\ %c\ 
set statusline+=%#PrimaryBlock#
set statusline+=\ %Y\ 

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
