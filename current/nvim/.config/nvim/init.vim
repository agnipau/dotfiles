" Mappings {{{
let mapleader = ' '
let maplocalleader = ' '

nnoremap <leader><leader> /
" Search for selection
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

" Exit from insertion in terminal mode
tnoremap <c-g> <c-\><c-n>
" }}}

" Options {{{
set textwidth=100
set colorcolumn=100
" Use tab to insert spaces
set expandtab
" Number of spaces per indentation level
set shiftwidth=4
" Number of spaces inserted when pressing Tab in a non-indentation context
set tabstop=4
" Enable mouse for all modes
set mouse=a
" Enable terminal 24 bit colors (true colors)
set termguicolors
" Use the dark variant for themes
set background=dark
" Sane backspace behavior
set backspace=indent,eol,start
" Special characters can be manually or automatically added to your text to
" flag the start and end of folds.
set foldmethod=marker
" Fold fill character
set fillchars=fold:\ 
" Disable annoying swap files
set noswapfile
" GUI font
set guifont=JetBrains\ Mono:h12
" set guifont=JetBrains\ Mono:h15

" Matching paren highlighting is useless
let g:loaded_matchparen = 1

" Highlight Lua code inside VimL
let g:vimsyn_embed = 'l'

" Threshold for the CursorHold event for example
set updatetime=1000
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" set fillchars=vert:\│
" set sidescroll=40
" set complete=.,w,b,i,u,t,
" set grepformat=%f:%l:%c:%m,%f:%l:%m

" Case insensitive search by default, case sensitive if the query contains
" capital letters.
set ignorecase
set smartcase

" set number
" set relativenumber

" Unfold all levels
set foldlevel=99

" Incremental and highlighted search
set incsearch
set hlsearch
" Live substitution
set inccommand=nosplit

" Use the system clipboard
set clipboard=unnamedplus
" Highlight the line where the cursor is
" set cursorline

" Save undos after file closes
set undofile
" Where to save undo history
set undodir=~/.local/share/nvim/undodir
" How many undos to save
set undolevels=1000
" Number of lines to save for undo
set undoreload=10000

" Show a completion menu when using command mode
set wildmenu
" Use ripgrep as the grep program
set grepprg=rg\ --vimgrep\ --no-heading

set list
" By default only show hidden chars that are annoying
set listchars=tab:→\ ,nbsp:␣,trail:·,extends:>,precedes:<
let g:list_chars_on = 0
function! s:toggle_list_chars()
    if g:list_chars_on
        " Only show hidden chars that are annoying
        set listchars=tab:→\ ,nbsp:␣,trail:·,extends:>,precedes:<
        let g:list_chars_on = 0
    else
        " Show all hidden chars
        set listchars=tab:→\ ,nbsp:␣,space:·,trail:·,extends:>,precedes:<
        let g:list_chars_on = 1
    endif
endfunction
nnoremap <silent> <leader>h :call <sid>toggle_list_chars()<cr>

" Use the block cursor shape always
" set guicursor=n-v:block-Cursor/lCursor,c:block-iCursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-iCursor/lCursor,r-cr:hor20-iCursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guicursor=

" Status line configuration
set laststatus=2
set statusline=
set statusline+=\ %f\ 
set statusline+=%m
set statusline+=%=
set statusline+=\ %l:%c:%L
set statusline+=\ %{&filetype}
set statusline+=\ %{&ff}
set statusline+=\ %{&fileencoding}\ 
" }}}

" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-repeat'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'

Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf.vim'
    " Don't preview files
    let g:fzf_preview_window = []
    " Use the legacy layout
    let g:fzf_layout = { 'down': '~30%' }

" Plug 'mg979/vim-visual-multi', { 'branch': 'master' }

" Plug 'airblade/vim-rooter'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " echo nvim_treesitter#statusline(90)

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/completion-nvim'
    autocmd BufEnter * lua require'completion'.on_attach()
    set completeopt=menuone,noinsert,noselect
    " Avoid showing message extra message when using completion
    set shortmess+=c

Plug 'chrisbra/Colorizer'
call plug#end()
" }}}

" Lua {{{
" Tree Sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "html", "css", "javascript", "typescript", "rust", "bash", "json", "toml", "yaml", "query", "lua", "cpp", "c", "python" },

    highlight = {
        enable = true,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "v",
            scope_incremental = "grc",
            node_decremental = "V",
        },
    },

    indent = {
        enable = true,
    },
}
EOF

" LSP config
lua <<EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'T', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-t>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        vim.cmd [[augroup Format]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
        vim.cmd [[augroup END]]
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end
end

-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup {
  capabilities = capabilities,
}

local servers = { "rust_analyzer", "tsserver", "pyright", "bashls", "cssls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
" }}}

" Theme {{{
let g:gruv_mode = 'dark'
let g:gruv_variant = 'h'
colorscheme gruv
" }}}

" Autocommands {{{
au FileType yaml
    \ highlight! link TSField GruvboxBlue

" Highlight on yank
au TextYankPost * lua vim.highlight.on_yank {on_visual = false, higroup = "Visual"}

" Disable line numbers for terminal
au TermOpen * setlocal nonumber norelativenumber

au FileType html,css,javascript,typescript,rust,sh,json,toml,yaml,query,lua,cpp,c,python
    \ setlocal syntax=off |
    \ setlocal foldmethod=expr |
    \ setlocal foldexpr=nvim_treesitter#foldexpr()
" }}}

