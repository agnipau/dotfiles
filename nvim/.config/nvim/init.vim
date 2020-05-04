let mapleader=' '
let maplocalleader=' '

call plug#begin('~/.local/share/nvim/plugged')

" Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
    let g:highlightedyank_highlight_duration = 200

" Plug 'unblevable/quick-scope'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'jiangmiao/auto-pairs'
Plug 'andymass/vim-matchup'
Plug 'terryma/vim-multiple-cursors'
    let g:multi_cursor_start_word_key      = '<c-j>'
    let g:multi_cursor_select_all_word_key = '<c-t>'
    let g:multi_cursor_start_key           = 'g<c-j>'
    let g:multi_cursor_select_all_key      = 'g<c-t>'
    let g:multi_cursor_next_key            = '<c-j>'
    let g:multi_cursor_prev_key            = '<c-k>'
    let g:multi_cursor_skip_key            = '<c-l>'
    let g:multi_cursor_quit_key            = '<Esc>'

Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
    let g:user_emmet_leader_key = '<c-f>'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }, 'branch': 'release'}

" tpope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Syntax
Plug 'mxw/vim-jsx'
" Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'dart-lang/dart-vim-plugin'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'cespare/vim-toml'
Plug 'dag/vim-fish'
" Plug 'leafgarland/typescript-vim'

" Colorschemes
Plug 'gruvbox-community/gruvbox'
call plug#end()

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab to trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> T :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

command! -nargs=0 Prettier :CocCommand prettier.formatFile

set number
set relativenumber
set list
" set listchars=tab:┊\ ,nbsp:␣,space:·,trail:·,extends:>,precedes:<
set listchars=tab:┊\ ,nbsp:␣,trail:·,extends:>,precedes:<
set fillchars=vert:\│
set ignorecase
set smartcase
set sidescroll=40
set incsearch
set hlsearch
set backspace=indent,eol,start
set wildmenu
set complete=.,w,b,i,u,t,
set mouse=a
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set colorcolumn=80
set ff=unix
set undofile
set undodir=~/.config/nvim/undodir
set guifont=Input\ Mono\ Narrow\ Regular:h18

set t_Co=256
set background=dark
set termguicolors
colorscheme gruvbox
" Colorscheme customizations
hi HighlightedyankRegion guibg=#504945
hi NonText guifg=#504945 gui=none
hi Visual guibg=#504945 gui=none

:command! WQ wq
:command! Wq wq
:command! Wqa wqa
:command! W w
:command! Q q

nnoremap <leader><leader> /
nnoremap <silent> <leader>mo :nohlsearch<cr>
nnoremap H 0
nnoremap J 3j
nnoremap K 3k
nnoremap L $

xnoremap H 0
xnoremap J 3j
xnoremap K 3k
xnoremap L $

inoremap <c-z> <c-o>:u<cr>
inoremap <c-e> <esc><c-e>a

au BufReadPost,BufNewFile *.md,*.txt,*.tex setlocal colorcolumn&
au BufReadPost,BufNewFile *.rs setlocal colorcolumn=100
au BufReadPost,BufNewFile *.cpp setlocal tabstop=2 | setlocal shiftwidth=2

