local function options(options)
    vim.validate {
        options = { options, vim.tbl_islist, "an array of options" }
    }
    for _, v in ipairs(options) do
        if v[3] == nil then
            v[3] = true
        end
        vim[v[1]][v[2]] = v[3]
        assert(vim[v[1]][v[2]])
    end
end

local function raw_options(options)
    vim.validate {
        options = { options, vim.tbl_islist, "an array of raw options" }
    }
    for _, v in ipairs(options) do
        if v[2] == nil then
            v[2] = true
        end

        if v[2] == true then
            vim.api.nvim_command("set " .. v[1])
        else
            vim.api.nvim_command("set " .. v[1] .. "=" .. v[2])
        end
    end
end

options {
    { "o", "ignorecase" },
    { "o", "smartcase" },
    { "o", "incsearch" },
    { "o", "hlsearch" },
    { "o", "backspace", "indent,eol,start" },
    { "o", "listchars", "tab:┊ ,nbsp:␣,trail:·,extends:>,precedes:<" },
    { "o", "fillchars", "vert:│" },
    { "o", "sidescroll", 40 },
    { "o", "wildmenu" },
    { "o", "complete", ".,w,b,i,u,t," },
    { "o", "mouse", "a" },
    { "o", "grepprg", "rg --vimgrep --no-heading" },
    { "o", "grepformat", "%f:%l:%c:%m,%f:%l:%m" },
    { "o", "tabstop", 4 },
    { "o", "shiftwidth", 4 },
    { "o", "expandtab" },
    { "o", "clipboard", "unnamedplus" },
    { "o", "ff", "unix" },
    { "o", "undofile" },
    { "o", "undodir", "~/.config/nvim/undodir" },
    { "o", "guifont", "JetBrainsMono:h19" },
    { "o", "t_Co", "256" },
    { "o", "background", "dark" },
    { "o", "termguicolors" },

    { "wo", "number" },
    { "wo", "relativenumber" },
    { "wo", "list" },
    { "wo", "colorcolumn", "80" },
    { "wo", "cursorline" },

    { "g", "mapleader", " " },
    { "g", "maplocalleader", " " },

    { "env", "IN_NEOVIM", "true" },

    {
        "g",
        "coc_global_extensions",
        {
            "coc-snippets",
            "coc-pairs",
            "coc-tsserver",
            "coc-prettier",
            "coc-json",
            "coc-sql",
            "coc-css",
            "coc-python",
            "coc-html",
            "coc-svg",
            "coc-rust-analyzer",
            "coc-yaml",
        },
    },

    { "g", "multi_cursor_start_word_key", "<c-j>" },
    { "g", "multi_cursor_select_all_word_key", "<c-t>" },
    { "g", "multi_cursor_start_key", "g<c-j>" },
    { "g", "multi_cursor_select_all_key", "g<c-t>" },
    { "g", "multi_cursor_next_key", "<c-j>" },
    { "g", "multi_cursor_prev_key", "<c-k>" },
    { "g", "multi_cursor_skip_key", "<c-l>" },
    { "g", "multi_cursor_quit_key", "<esc>" },
}

-- Coc settings
options {
    -- TextEdit might fail if hidden is not set
    { "o", "hidden" },

    -- Give more space for displaying messages
    { "o", "cmdheight", 2 },

    -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    -- delays and poor user experience
    { "o", "updatetime", 300 },

    -- Don't pass messages to |ins-completion-menu|
    { "o", "shortmess", "c" },

    -- Always show the signcolumn, otherwise it would shift the text each time
    -- diagnostics appear/become resolved
    { "wo", "signcolumn", "yes" },
}
raw_options {
    -- Some servers have issues with backup files, see #649
    { "nobackup" },
    { "nowritebackup" },
}

