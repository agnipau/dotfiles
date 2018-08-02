" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
  " I don't know why when I disable Goyo, these highlight groups change
  function! s:goyo_leave()
    highlight ModeBlock      ctermbg=01 ctermfg=00
    highlight GitBlock       ctermbg=18 ctermfg=07
    highlight CentralBlock   ctermbg=17 ctermfg=07
    Limelight!
  endfunction

  augroup goyo_custom
    autocmd!
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave call <SID>goyo_leave()
  augroup END
Plug 'junegunn/limelight.vim'
Plug 'terryma/vim-multiple-cursors'
  let g:multi_cursor_use_default_mapping = 0
  let g:multi_cursor_select_all_word_key = '<c-t>'
  let g:multi_cursor_next_key            = '<c-j>'
  let g:multi_cursor_prev_key            = '<c-k>'
  let g:multi_cursor_skip_key            = '<c-p>'
  let g:multi_cursor_quit_key            = '<esc>'
Plug 'terryma/vim-expand-region'

Plug 'reedes/vim-pencil'
  function! s:prose()
    call pencil#init()
    call textobj#quote#init()
  
    iabbrev <buffer> -- –
    iabbrev <buffer> --- —
    iabbrev <buffer> << «
    iabbrev <buffer> >> »
    iabbrev <buffer> ... …
  endfunction
  augroup writing
    autocmd!
    autocmd! FileType markdown,mkd,text call <SID>prose()
  augroup END
Plug 'reedes/vim-textobj-quote'
Plug 'kana/vim-textobj-user'
Plug 'Yggdroot/indentLine'
  let g:indentLine_color_term = 18
  let g:indentLine_char = '▏'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'rstacruz/vim-closer'
Plug 'mzlogin/vim-markdown-toc'
Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration = 200
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
  inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
Plug 'Shougo/neco-vim'
Plug 'wellle/tmux-complete.vim'
  let g:tmuxcomplete#trigger = ''
Plug 'mattn/emmet-vim'
  let g:user_emmet_leader_key = '<c-d>'
Plug 'junegunn/vim-easy-align'
  xmap ga <plug>(EasyAlign)
  nmap ga <plug>(EasyAlign)
Plug 'lambdalisue/vim-manpager'
Plug 'rhysd/open-pdf.vim'
Plug 'yuttie/comfortable-motion.vim'
  let g:comfortable_motion_no_default_key_mappings = 1
  nnoremap <silent> J :call comfortable_motion#flick(55)<cr>
  nnoremap <silent> K :call comfortable_motion#flick(-55)<cr>
  noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<cr>
  noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<cr>

Plug 'w0rp/ale'
  " Partially fix the annoying cursor lag
  let g:ale_echo_delay                       = 0
  let g:ale_linters_sh_shellcheck_exclusions = 'SC1090'
  let g:ale_lint_on_save                     = 0
  let g:ale_lint_on_text_changed             = 0
  let g:ale_lint_on_enter                    = 0
  let g:ale_sign_error                       = '> '
  let g:ale_sign_warning                     = '! '
  autocmd! BufReadPre * ALEDisable
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

call plug#end()
" }}}

" Options {{{
set encoding=utf-8
scriptencoding utf-8
syntax on
filetype on
filetype plugin indent on
set nonumber
set nocursorline
set wrap
set shiftround
set shiftwidth=2
set noshowmode
set laststatus=2
set shortmess=atI
set cmdheight=1
set t_Co=256
set foldlevelstart=0
set hlsearch
set incsearch
set ignorecase
set smartcase
set notermguicolors
set hidden
set mouse=a
set history=10000
set backupdir=~/.config/nvim/tmp,~/.vim/tmp,.
set directory=~/.config/nvim/tmp,~/.vim/tmp,.
set backspace=indent,eol,start
set clipboard=unnamedplus
set colorcolumn=0
" }}}

" Look and feel {{{
colorscheme wal
set fillchars=fold:\ 
if colors_name ==# 'wal'
  highlight EndOfBuffer           ctermbg=none ctermfg=00
  highlight FoldColumn            ctermbg=00   ctermfg=07
  highlight Folded                ctermbg=none ctermfg=08 cterm=bold
  highlight fzf1                  ctermbg=17   ctermfg=01
  highlight fzf2                  ctermbg=17   ctermfg=07
  highlight fzf3                  ctermbg=17   ctermfg=07
  highlight Pmenu                 ctermbg=none ctermfg=07
  highlight PmenuSel              ctermbg=01   ctermfg=00
  highlight PmenuSbar             ctermbg=none
  highlight PmenuThumb            ctermbg=01
  highlight ALEErrorSign          ctermbg=none ctermfg=01
  highlight ALEWarningSign        ctermbg=none ctermfg=02
  highlight Visual                ctermbg=07   ctermfg=18
  highlight HighlightedyankRegion ctermbg=none ctermfg=07
  highlight CursorLine            ctermbg=18   ctermfg=08 cterm=none
  highlight VertSplit             ctermbg=none ctermfg=18 cterm=none
  highlight Comment               ctermbg=none ctermfg=08 cterm=italic
  highlight LineNr                ctermbg=none ctermfg=18
  highlight CursorLineNr          ctermbg=none ctermfg=07
  highlight CursorLine            ctermbg=none ctermfg=none
  highlight Search                ctermbg=18   ctermfg=none
  highlight IncSearch             ctermbg=none ctermfg=01
  highlight ColorColumn           ctermbg=18   ctermfg=none
  highlight MatchParen            ctermbg=18   ctermfg=none
endif
" }}}

" Statusline {{{
" Returns a string based on the current mode
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

" Create highlight groups used in the bar
highlight ModeBlock    ctermbg=01 ctermfg=00
highlight GitBlock     ctermbg=19 ctermfg=07
highlight CentralBlock ctermbg=none ctermfg=07

" Set the statusline
set statusline=%#ModeBlock#                " use ModeBlock highlight group
set statusline+=\ %{g:currentmode[mode()]} " mode block
set statusline+=%#GitBlock#                " use GitBlock highlight group
set statusline+=%{StatuslineGit()}         " git branch block
set statusline+=%#CentralBlock#            " use CentralBlock highlight group
set statusline+=\ %t\                      " display filename (tail)
set statusline+=%m                         " display modified flag
set statusline+=%=                         " switch to right side
set statusline+=%#GitBlock#                " use GitBlock highlight group
set statusline+=\ Ln                       " prefix for line number
set statusline+=\ %l                       " display line number
set statusline+=,\ Col                     " prefix for column number
set statusline+=\ %c\                      " display column number
set statusline+=%#ModeBlock#               " use ModeBlock highlight group
set statusline+=\ %Y\                      " display the file type

" Return the branch name if editing a file in a git repo
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
" }}}

" Mappings {{{
" Define leader keys
let mapleader=' '
let maplocalleader=' '

" Normal mode mappings {{{
nnoremap <leader><leader> /
nnoremap <leader>mo :nohlsearch<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>rr :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>el
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>el
nnoremap H 0
nnoremap L $
nnoremap <leader>C 0x
nnoremap <leader>w  :match ExtraWhitespace /\s\+$/<cr>
nnoremap <leader>W  :match<cr>
nnoremap / /\v
nnoremap <leader>go :Goyo<cr>
nnoremap <leader>li :Limelight!<cr>
nnoremap <leader>cc :call <SID>ColorColumnToggle()<cr>
nnoremap <c-h> :tabprevious<cr>
nnoremap <c-l> :tabnext<cr>
nnoremap <c-n> :cnext<cr>zz
nnoremap <c-m> :cprevious<cr>zz
nnoremap <leader>f :call <SID>FoldColumnToggle()<cr>
nnoremap <leader>q :call <SID>QuickfixToggle()<cr>
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
nnoremap <leader>aa :ALEEnable<cr>
nnoremap <leader>af :ALEDisable<cr>
nmap <silent> <c-q> <plug>(ale_previous_wrap)
nmap <silent> <c-e> <plug>(ale_next_wrap)
nnoremap <leader>pc :PlugClean!<cr>
nnoremap <leader>pu :PlugUpdate<cr>
nnoremap <leader>pi :PlugInstall<cr>
nnoremap ; :
nnoremap è .
nnoremap <leader>n :set number! cursorline!<cr>
" }}}

" Visual mode mappings {{{
xnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
xnoremap <leader>' <esc>`<i"<esc>`>la"<esc>
xnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>
xmap v <plug>(expand_region_expand)
xmap <c-v> <plug>(expand_region_shrink)
xnoremap ; :
" }}}

" Insert mode mappings {{{
inoremap <c-u> <esc>viw~wa
onoremap in( :<c-u>normal! f)vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f}vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
" }}}
" }}}

" Auto commands {{{
" No Wrap {{{
" Set nowrap to some files
augroup filetype_wrap
  autocmd!
  autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END
" }}}

" Comments {{{
" Comments for file type
augroup filetype_comments
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType javascript iabbrev  <buffer> iff if ()
  autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
  autocmd FileType python     iabbrev  <buffer> iff if:
  autocmd FileType sh         nnoremap <buffer> <localleader>c I#<esc>
  autocmd FileType sh         iabbrev  <buffer> iff if [[  ]]; then
augroup END
" }}}

" MD {{{
" Change title of headings for markdown files
augroup filetype_md
  autocmd!
  autocmd FileType markdown onoremap <buffer> ih= :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType markdown onoremap <buffer> ih- :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType markdown onoremap <buffer> ah= :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
  autocmd FileType markdown onoremap <buffer> ah- :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

" VIM {{{
" Use marker method of folding for any Vimscript file
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" }}}

" Functions {{{
" Toggle the foldcolumn option
function! s:FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=1
  endif
endfunction

" Toggle the colorcolumn option
function! s:ColorColumnToggle()
  if &colorcolumn
    setlocal colorcolumn=0
  else
    setlocal colorcolumn=80
  endif
endfunction

" Toggle the quickfix window
let g:quickfix_is_open = 0

function! s:QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . 'wincmd w'
  else
    let g:quickfix_return_to_window = winnr()
    copen 8
    let g:quickfix_is_open = 1
  endif
endfunction

" Grep operator
function! s:GrepOperator(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[y`]
  else
    return
  endif

  silent execute 'grep! -R ' . shellescape(@@) . ' .'
  copen 8

  let @@ = saved_unnamed_register
endfunction
" }}}
