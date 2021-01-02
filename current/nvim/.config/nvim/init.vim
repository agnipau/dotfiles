" Mappings {{{

let mapleader=' '
let maplocalleader=' '

nnoremap <leader><leader> /
" Search for selection.
xnoremap <leader><leader> y/\V<c-r>=escape(@",'/\')<cr><cr>
nnoremap <silent> <leader>mo :nohlsearch<cr>

noremap H 0
noremap J 3j
noremap K 3k
noremap L $
nnoremap Y y$

nnoremap <silent> <leader>er :e $MYVIMRC<cr>
nnoremap <silent> <leader>re :source $MYVIMRC <bar> nohlsearch<cr>

nnoremap <silent> <c-l> :vertical resize +5<cr>
nnoremap <silent> <c-h> :vertical resize -5<cr>
nnoremap <silent> <c-k> :resize +5<cr>
nnoremap <silent> <c-j> :resize -5<cr>
nnoremap <silent> <c-t><c-k> :tabnext<cr>
nnoremap <silent> <c-t><c-j> :tabprevious<cr>
nnoremap <silent> <c-t><c-t> :tabnew<cr>
nnoremap <silent> <c-t><c-d> :tabclose<cr>

nnoremap <silent> <leader>pi :PlugInstall<cr>
nnoremap <silent> <leader>pu :PlugUpdate<cr>
nnoremap <silent> <leader>pc :PlugClean<cr>

nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fb :Buffers<cr>
nnoremap <silent> <leader>fr :Rg<cr>
nnoremap <silent> <leader>fl :Lines<cr>

" Exit from insertion in terminal mode.
tnoremap <c-g> <c-\><c-n>

" }}}
" Options {{{

set colorcolumn=80
" Use tab to insert spaces.
set expandtab
" Number of spaces per indentation level.
set shiftwidth=4
" Number of spaces inserted when pressing Tab in a non-indentation context.
set tabstop=4
" Enable mouse for all modes.
set mouse=a
" Enable terminal 24 bit colors (true colors).
set termguicolors
" Use the dark variant for themes.
set background=dark
" Sane backspace behavior.
set backspace=indent,eol,start
" Special characters can be manually or automatically added to your text to
" flag the start and end of folds.
set foldmethod=marker
" Fold fill character.
set fillchars=fold:\ 
" Disable annoying swap files.
set noswapfile
" GUI font.
set guifont=JetBrains\ Mono:h12
" set guifont=JetBrains\ Mono:h15

" set fillchars=vert:\│
" set sidescroll=40
" set complete=.,w,b,i,u,t,
" set grepformat=%f:%l:%c:%m,%f:%l:%m

" Case insensitive search by default, case sensitive if the query contains
" capital letters.
set ignorecase
set smartcase

" Incremental and highlighted search.
set incsearch
set hlsearch

" Use the system clipboard.
set clipboard=unnamedplus
" Highlight the line where the cursor is.
set cursorline

" Save undos after file closes.
set undofile
" Where to save undo history.
set undodir=~/.local/share/nvim/undodir
" How many undos to save.
set undolevels=1000
" Number of lines to save for undo.
set undoreload=10000

" Show a completion menu when using command mode.
set wildmenu
" Use ripgrep as the grep program.
set grepprg=rg\ --vimgrep\ --no-heading

set list
" By default only show hidden chars that are annoying.
set listchars=tab:┊\ ,nbsp:␣,trail:·,extends:>,precedes:<
let g:list_chars_on = 0
function! s:toggle_list_chars()
    if g:list_chars_on
        " Only show hidden chars that are annoying.
        set listchars=tab:┊\ ,nbsp:␣,trail:·,extends:>,precedes:<
        let g:list_chars_on = 0
    else
        " Show all hidden chars.
        set listchars=tab:┊\ ,nbsp:␣,space:·,trail:·,extends:>,precedes:<
        let g:list_chars_on = 1
    endif
endfunction
nnoremap <silent> <leader>h :call <sid>toggle_list_chars()<cr>

" Use the block cursor shape always.
" set guicursor=n-v:block-Cursor/lCursor,c:block-iCursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-iCursor/lCursor,r-cr:hor20-iCursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guicursor=

" Status line configuration.
set laststatus=2
set statusline=
set statusline+=\ %f\ 
set statusline+=%m
set statusline+=%=
set statusline+=\ %l:%c:%L
set statusline+=\ [%{&filetype}
set statusline+=\ %{&ff}
set statusline+=\ %{&fileencoding}]\ 

" }}}
" Plugins {{{

call plug#begin('~/.local/share/nvim/plugged')

" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
    let g:gruvbox_contrast_dark='hard'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'

Plug 'cespare/vim-toml'

Plug 'rust-lang/rust.vim'

Plug 'editorconfig/editorconfig-vim'

" Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
    " Use fd to search files.
    let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
    " let $FZF_DEFAULT_OPTS = '--multi --inline-info --color fg:8,hl:7,fg+:6,bg+:0,hl+:7 --color info:0,prompt:6,spinner:6,pointer:6,marker:6'
    " Don't preview files.
    let g:fzf_preview_window = []
    " Use the legacy layout.
    " let g:fzf_layout = { 'down': '~40%' }

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    let g:coc_global_extensions = []

Plug 'mg979/vim-visual-multi', { 'branch': 'master' }

" TODO(agnipau): Find a decent plugin, this is annoying.
" Plug 'jiangmiao/auto-pairs'

Plug 'airblade/vim-rooter'

Plug 'dart-lang/dart-vim-plugin'

call plug#end()

" }}}
" Theme {{{

colorscheme gruvbox

hi HighlightedyankRegion guibg=#504945
" Both '~' end of buffer chars and hidden chars.
hi NonText guifg=#665c54 gui=none
" Only '~' end of buffer chars.
hi EndOfBuffer guifg=#1d2021
hi Visual guibg=#504945 gui=none
hi CursorLine guibg=#282828 guifg=none
hi ColorColumn guibg=#282828 guifg=none
hi CursorLineNr guibg=#282828
hi SignColumn guibg=#282828
hi VertSplit guibg=none guifg=#282828
hi Cursor guifg=#fabd2f guibg=#1d2021
hi StatusLine guifg=#504945 guibg=#ebdbb2
hi StatusLineNC guifg=#282828 guibg=#ebdbb2
hi TabLineFill guifg=#a89984 guibg=#282828
hi TabLineSel guifg=#ebdbb2 guibg=#504945
hi Search guifg=#fe8019 guibg=#1d2021
hi CocErrorSign guibg=#282828 guifg=#fb4934
hi CocWarningSign guibg=#282828 guifg=#fe8019
hi CocInfoSign guibg=#282828 guifg=#b8bb26
hi CocHintSign guibg=#282828 guifg=#8ec07c
hi CocHighlightText guibg=#504945
hi FoldColumn guibg=#1d2021

" }}}
" Autocommands {{{

au BufReadPost,BufNewFile *.rs setlocal colorcolumn=100 foldmethod=manual

" }}}
" coc {{{

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
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one.
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-space> to trigger completion.
if has('nvim')
  imap <silent><expr> <c-space> coc#refresh()
else
  imap <silent><expr> <c-@> coc#refresh()
endif

" Make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics.
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use T to show documentation in preview window.
nnoremap <silent> T :call <sid>show_documentation()<cr>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph.
xnoremap <leader>a <Plug>(coc-codeaction-selected)
nnoremap <leader>a <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
" nnoremap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Map function and class text objects.
" NOTE: Requires 'textDocument.documentSymbol' support from the language
" server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <c-f> and <c-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nmap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<c-f>"
  nmap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<c-b>"
  imap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<right>"
  imap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<left>"
  vmap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<c-f>"
  vmap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<c-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <c-s> <Plug>(coc-range-select)
xmap <silent> <c-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings for CoCList.
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a :<c-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e :<c-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c :<c-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o :<c-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s :<c-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j :<c-u>CocNext<cr>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k :<c-u>CocPrev<cr>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p :<c-u>CocListResume<cr>

