let mapleader=' '
let maplocalleader=' '

call plug#begin('~/.local/share/nvim/plugged')
  " Plug 'jiangmiao/auto-pairs'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
      " let g:multi_cursor_start_word_key = '<c-j>'
      " let g:multi_cursor_select_all_word_key = '<c-t>'
      " let g:multi_cursor_start_key = 'g<c-j>'
      " let g:multi_cursor_select_all_key = 'g<c-t>'
      " let g:multi_cursor_next_key = '<c-j>'
      " let g:multi_cursor_prev_key = '<c-k>'
      " let g:multi_cursor_skip_key = '<c-l>'
      " let g:multi_cursor_quit_key = '<Esc>'
  Plug 'airblade/vim-rooter'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
  Plug 'junegunn/fzf.vim'
      let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
      " let $FZF_DEFAULT_OPTS = '--multi --inline-info --color fg:8,hl:7,fg+:6,bg+:0,hl+:7 --color info:0,prompt:6,spinner:6,pointer:6,marker:6'
      let g:fzf_preview_window = []
      let g:fzf_layout = { 'down': '~40%' }
  Plug 'mattn/emmet-vim'
      let g:user_emmet_leader_key = '<c-f>'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "     let g:coc_global_extensions = [
  "         \ 'coc-pairs',
  "         \ 'coc-rust-analyzer',
  "         \ ]
  Plug 'neomake/neomake'

  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'

  " Plug 'MaxMEllon/vim-jsx-pretty'
  " Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'leafgarland/typescript-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'dag/vim-fish'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'cespare/vim-toml'
  Plug 'rust-lang/rust.vim'
  Plug 'dart-lang/dart-vim-plugin'

  " Plug 'morhetz/gruvbox'
  Plug 'gruvbox-community/gruvbox'
  Plug 'adrian5/oceanic-next-vim'
call plug#end()

set ignorecase
set smartcase
set incsearch
set hlsearch
set backspace=indent,eol,start
" set number
" set relativenumber
set list
set fillchars=vert:\│
set sidescroll=40
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
set foldcolumn=1
set cursorline
set ff=unix
set undofile
set undodir=~/.config/nvim/undodir
set guifont=JetBrains\ Mono:h12
" set guifont=JetBrains\ Mono:h15
set guicursor=n-v:block-Cursor/lCursor,c:block-iCursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-iCursor/lCursor,r-cr:hor20-iCursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guicursor=

set listchars=tab:┊\ ,nbsp:␣,trail:·,extends:>,precedes:<
let g:list_chars_on = 0
function! ToggleListChars()
    if g:list_chars_on
        set listchars=tab:┊\ ,nbsp:␣,trail:·,extends:>,precedes:<
        let g:list_chars_on = 0
    else
        set listchars=tab:┊\ ,nbsp:␣,space:·,trail:·,extends:>,precedes:<
        let g:list_chars_on = 1
    endif
endfunction
nnoremap <silent> <leader>h :call ToggleListChars()<cr>

set t_Co=256
let g:gruvbox_contrast_dark='hard'
set background=dark
set termguicolors
colorscheme gruvbox
" hi HighlightedyankRegion guibg=#504945
" hi NonText guifg=#665c54 gui=none
" hi Visual guibg=#504945 gui=none
" hi CursorLine guibg=#282828 guifg=none
" hi ColorColumn guibg=#282828 guifg=none
" hi CursorLineNr guibg=#282828
" hi SignColumn guibg=#282828
" hi VertSplit guibg=none guifg=#282828
" hi Cursor guifg=#fabd2f guibg=#1d2021
" hi StatusLine guifg=#504945 guibg=#ebdbb2
" hi StatusLineNC guifg=#282828 guibg=#ebdbb2
" hi TabLineFill guifg=#a89984 guibg=#282828
" hi TabLineSel guifg=#ebdbb2 guibg=#504945
" hi Search guifg=#fe8019 guibg=#1d2021
" hi CocErrorSign guibg=#282828 guifg=#fb4934
" hi CocWarningSign guibg=#282828 guifg=#fe8019
" hi CocInfoSign guibg=#282828 guifg=#b8bb26
" hi CocHintSign guibg=#282828 guifg=#8ec07c
" hi FoldColumn guibg=#1d2021
" let g:fzf_colors = {
"     \ 'fg': ['fg', ''],
"     \ 'bg': ['fg', 'GruvboxBg0'],
"     \ 'hl': ['fg', 'GruvboxYellow'],
"     \ 'fg+': ['fg', 'GruvboxFg1'],
"     \ 'bg+': ['fg', 'GruvboxBg1'],
"     \ 'hl+': ['fg', 'GruvboxYellow'],
"     \ 'info': ['fg', 'GruvboxBlue'],
"     \ 'prompt': ['fg', 'GruvboxFg4'],
"     \ 'pointer': ['fg', 'GruvboxBlue'],
"     \ 'marker': ['fg', 'GruvboxOrange'],
"     \ 'spinner': ['fg', 'GruvboxYellow'],
"     \ 'header': ['fg', 'GruvboxBg3']
"     \ }

set laststatus=2
set statusline=
set statusline+=\ %f\ 
set statusline+=%m
set statusline+=%=
set statusline+=\ %l:%c:%L
set statusline+=\ [%{&filetype}
set statusline+=\ %{&ff}
set statusline+=\ %{&fileencoding}]\ 

nnoremap <leader><leader> /
nnoremap <silent> <leader>mo :nohlsearch<cr>
nnoremap <silent> H 0
nnoremap <silent> J 3j
nnoremap <silent> K 3k
nnoremap <silent> L $
nnoremap <silent> Y y$
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fb :Buffers<cr>
nnoremap <silent> <leader>fr :Rg<cr>
nnoremap <silent> <leader>fl :Lines<cr>
nnoremap <silent> <leader>er :e $MYVIMRC<cr>
nnoremap <silent> <leader>re :source $MYVIMRC<cr>
nnoremap <silent> <leader>pi :PlugInstall<cr>
nnoremap <silent> <leader>pu :PlugUpdate<cr>
nnoremap <silent> <leader>pc :PlugClean<cr>
nnoremap <silent> <c-l> :vertical resize +5<cr>
nnoremap <silent> <c-h> :vertical resize -5<cr>
nnoremap <silent> <c-k> :resize +5<cr>
nnoremap <silent> <c-j> :resize -5<cr>
nnoremap <silent> <c-t><c-k> :tabnext<cr>
nnoremap <silent> <c-t><c-j> :tabprevious<cr>
nnoremap <silent> <c-t><c-t> :tabnew<cr>
nnoremap <silent> <c-t><c-d> :tabclose<cr>

xnoremap <silent> H 0
xnoremap <silent> J 3j
xnoremap <silent> K 3k
xnoremap <silent> L $
xnoremap <leader><leader> y/\V<C-R>=escape(@",'/\')<CR><CR>

inoremap <c-e> <esc><c-e>a
inoremap <c-y> <esc><c-y>a

command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

tnoremap <c-g> <C-\><C-n>

" " TextEdit might fail if hidden is not set.
" set hidden

" " Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" " Give more space for displaying messages.
" set cmdheight=2

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300

" " Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" set signcolumn=yes

" " Use tab to trigger completion with characters ahead and navigate.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" nnoremap <silent> T :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f <Plug>(coc-format-selected)
" nmap <leader>f <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a <Plug>(coc-codeaction-selected)
" nmap <leader>a <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current line.
" nmap <leader>ac <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf <Plug>(coc-fix-current)

" " Introduce function text object
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" " " Use <TAB> for selections ranges.
" " " NOTE: Requires 'textDocument/selectionRange' support from the language server.
" " " coc-tsserver, coc-python are the examples of servers that support it.
" " nmap <silent> <TAB> <Plug>(coc-range-select)
" " xmap <silent> <TAB> <Plug>(coc-range-select)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" command! -nargs=0 Prettier :CocCommand prettier.formatFile

au BufReadPost,BufNewFile *.md,*.txt,*.tex setlocal colorcolumn&
au BufReadPost,BufNewFile *.rs setlocal colorcolumn=100
au BufReadPost,BufNewFile *.cpp setlocal tabstop=2 | setlocal shiftwidth=2

