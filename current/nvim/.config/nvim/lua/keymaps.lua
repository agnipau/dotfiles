local function keymaps(keymaps)
    vim.validate {keymaps = {keymaps, vim.tbl_islist, "an array of keymaps"}}
    for _, v in ipairs(keymaps) do
        vim.api.nvim_set_keymap(v[1], v[2], v[3], v[4])
    end
end

Direction = {Top = 1, Right = 2, Bottom = 3, Left = 4}

local Position = {TopLeft = 1, TopRight = 2, BottomLeft = 3, BottomRight = 4}

function resizeWin(direction)
    local win = vim.api.nvim_get_current_win()
    local nvim_pos = vim.api.nvim_win_get_position(win)
    local y = nvim_pos[1]
    local totaly = y + vim.api.nvim_win_get_height(win)
    local x = nvim_pos[2]

    local pos
    -- Top Left window
    if x == 0 and y == 0 then
        pos = Position.TopLeft
        -- Top Right window
    elseif y == 0 then
        pos = Position.TopRight
        -- Non-top Left or Right window
    else
        local is_non_top_left = x == 0;

        local is_last = true
        local all_wins = vim.api.nvim_list_wins()
        for _, w in ipairs(all_wins) do
            local wy = vim.api.nvim_win_get_position(w)[1]
            local totalwy = wy + vim.api.nvim_win_get_height(w)
            if totalwy > totaly then is_last = false end
        end

        pos = ({
            [true] = ({
                [true] = Position.BottomLeft,
                [false] = Position.BottomRight
            })[is_non_top_left],
            [false] = ({[true] = Position.TopLeft, [false] = Position.TopRight})[is_non_top_left]
        })[is_last]
    end

    local command = ({
        [Position.TopLeft] = ({
            [Direction.Top] = "resize -5",
            [Direction.Right] = "vertical resize +5",
            [Direction.Bottom] = "resize +5",
            [Direction.Left] = "vertical resize -5"
        })[direction],
        [Position.TopRight] = ({
            [Direction.Top] = "resize -5",
            [Direction.Right] = "vertical resize -5",
            [Direction.Bottom] = "resize +5",
            [Direction.Left] = "vertical resize +5"
        })[direction],
        [Position.BottomLeft] = ({
            [Direction.Top] = "resize +5",
            [Direction.Right] = "vertical resize +5",
            [Direction.Bottom] = "resize -5",
            [Direction.Left] = "vertical resize -5"
        })[direction],
        [Position.BottomRight] = ({
            [Direction.Top] = "resize +5",
            [Direction.Right] = "vertical resize -5",
            [Direction.Bottom] = "resize -5",
            [Direction.Left] = "vertical resize +5"
        })[direction]
    })[pos]
    assert(command ~= nil, "Invalid position")
    vim.api.nvim_command(command)
end

keymaps {
    {"n", "<leader><leader>", "/", {noremap = true}},
    {"n", "<leader>mo", ":nohlsearch<cr>", {noremap = true, silent = true}},
    {"n", "H", "0", {noremap = true}}, {"n", "J", "3j", {noremap = true}},
    {"n", "K", "3k", {noremap = true}}, {"n", "L", "$", {noremap = true}},
    {"n", "Y", "y$", {noremap = true}},
    {"n", "<c-z>", "u<cr>", {noremap = true}},
    {"n", "<leader>ff", ":Files<cr>", {noremap = true, silent = true}},
    {"n", "<leader>fb", ":Buffers<cr>", {noremap = true, silent = true}},
    {"n", "<leader>re", ":source $MYVIMRC<cr>", {noremap = true, silent = true}},
    {"n", "<leader>pi", ":PlugInstall<cr>", {noremap = true, silent = true}},
    {"n", "<leader>pc", ":PlugClean<cr>", {noremap = true, silent = true}},

    {"n", "<c-h>", "<c-w><c-h>", {noremap = true, silent = true}},
    {"n", "<c-j>", "<c-w><c-j>", {noremap = true, silent = true}},
    {"n", "<c-k>", "<c-w><c-k>", {noremap = true, silent = true}},
    {"n", "<c-l>", "<c-w><c-l>", {noremap = true, silent = true}}, {
        "n", "<a-h>", ":lua resizeWin(Direction.Left)<cr>",
        {noremap = true, silent = true}
    }, {
        "n", "<a-j>", ":lua resizeWin(Direction.Bottom)<cr>",
        {noremap = true, silent = true}
    }, {
        "n", "<a-k>", ":lua resizeWin(Direction.Top)<cr>",
        {noremap = true, silent = true}
    }, {
        "n", "<a-l>", ":lua resizeWin(Direction.Right)<cr>",
        {noremap = true, silent = true}
    }, {"x", "H", "0", {noremap = true}}, {"x", "J", "3j", {noremap = true}},
    {"x", "K", "3k", {noremap = true}}, {"x", "L", "$", {noremap = true}},

    {"i", "<c-z>", "<c-o>:u<cr>", {noremap = true}},
    {"i", "<c-e>", "<esc><c-e>a", {noremap = true}},

    {"t", "<c-g>", "<C-\\><C-n>", {noremap = true}}
}

-- -- Returns the char before the cursor.
-- function lastChar(buffer)
--     local cursor = vim.api.nvim_win_get_cursor(buffer)
--     local line = cursor[1]
--     local col = cursor[2]
--     local current_line = vim.api.nvim_buf_get_lines(buffer, line - 1, line, true)[1]
--     return string.sub(current_line, col, col)
-- end

-- -- Returns true if `s` is blank, false otherwise.
-- function isBlank(s)
--     vim.validate {
--         s = { s, "s" }
--     }
--     return not (s ~= nil and s:match("%S") ~= nil)
-- end

-- Use tab to trigger completion with characters ahead and navigate.
vim.api.nvim_command([[
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\\s'
    endfunction
]])

vim.api.nvim_command([[
    inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
]])

-- Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
-- position. Coc only does snippet and additional edit on confirm.
if vim.fn.has("patch8.1.1068") then
    -- Use `complete_info` if your (Neo)Vim version supports it.
    keymaps {
        {
            "i", "<cr>",
            "complete_info()[\"selected\"] != \"-1\" ? \"\\<c-y>\" : \"\\<c-g>u\\<cr>\"",
            {noremap = true, silent = true, expr = true}
        }
    }
else
    keymaps {
        {
            "i", "<cr>", "pumvisible() ? \"\\<c-y>\" : \"\\<c-g>u\\<cr>\"",
            {noremap = false, silent = true, expr = true}
        }
    }
end

function showDocumentation()
    local ft = vim.api.nvim_buf_get_option(nil, "filetype")
    if ({["vim"] = true, ["help"] = true})[ft] == true then
        -- TODO: Improve this.
        vim.api.nvim_command("execute 'h '.expand('<cword>')")
    else
        vim.fn.call("CocAction", {"doHover"})
    end
end

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_command(
    "autocmd CursorHold * silent call CocActionAsync('highlight')")

function luaFormat()
    print("SONO MASIERO")
    io.open("/home/agnipau/masiero", "w")
end

vim.api.nvim_command([[
    function! g:LuaFormatWrapper()
        lua luaFormat()
    endfunction
]])

vim.api.nvim_command("autocmd FileType lua autocmd BufWritePre <buffer> call LuaFormatWrapper()")

-- Coc keymaps
keymaps {
    {
        "i", "<s-tab>", "pumvisible() ? \"\\<c-p>\" : \"\\c-h\"",
        {noremap = true, expr = true}
    }, -- Use <c-space> to trigger completion.
    {
        "i", "<c-space>", "coc#refresh()",
        {noremap = true, silent = true, expr = true}
    }, -- Use `[g` and `]g` to navigate diagnostics.
    {"n", "[g", "<Plug>(coc-diagnostic-prev)", {noremap = false, silent = true}},
    {"n", "]g", "<Plug>(coc-diagnostic-next)", {noremap = false, silent = true}},

    -- GoTo code navigation.
    {"n", "gd", "<Plug>(coc-definition)", {noremap = false, silent = true}},
    {"n", "gy", "<Plug>(coc-type-definition)", {noremap = false, silent = true}},
    {"n", "gi", "<Plug>(coc-implementation)", {noremap = false, silent = true}},
    {"n", "gr", "<Plug>(coc-references)", {noremap = false, silent = true}},

    -- Use T to show documentation in preview window.
    {"n", "T", ":lua showDocumentation()<cr>", {noremap = true, silent = true}},

    -- Symbol renaming.
    {"n", "<leader>rn", "<Plug>(coc-rename)", {noremap = false}},

    -- Formatting selected code.
    {"x", "<leader>f", "<Plug>(coc-format-selected)", {noremap = false}},
    {"n", "<leader>f", "<Plug>(coc-format-selected)", {noremap = false}},

    {"x", "<leader>f", "<Plug>(coc-format-selected)", {noremap = false}},
    {"n", "<leader>f", "<Plug>(coc-format-selected)", {noremap = false}}

    -- {
    --     "i",
    --     "<tab>",
    --     "pumvisible() ? \"\\<c-n>\" : <SID>check_back_space() ? \"\\<TAB>\" : coc#refresh()",
    --     {
    --         noremap = true,
    --         silent = true,
    --         expr = true,
    --     }
    -- }
}

