local function commands(commands)
    vim.validate {
        commands = { commands, vim.tbl_islist, "an array of commands" }
    }
    for _, v in ipairs(commands) do
        vim.api.nvim_command(v)
    end
end


commands {
    "colorscheme gruvbox",
    -- Colorscheme customizations
    "hi HighlightedyankRegion guibg=#504945",
    "hi NonText guifg=#504945 gui=none",
    "hi Visual guibg=#504945 gui=none",

    "command! WQ wq",
    "command! Wq wq",
    "command! Wqa wqa",
    "command! W w",
    "command! Q q",
}

