local attrs = {
    bold = 'bold',
    underline = 'underline',
    undercurl = 'undercurl',
    strikethrough = 'strikethrough',
    reverse = 'reverse',
    inverse = 'inverse',
    italic = 'italic',
    standout = 'standout',
    nocombine = 'nocombine',
    none = 'none',
}

local palette = {
    dark = {
        red_dimmed = '#cc241d',
        green_dimmed = '#98971a',
        yellow_dimmed = '#d79921',
        blue_dimmed = '#458588',
        purple_dimmed = '#b16286',
        aqua_dimmed = '#689d6a',
        orange_dimmed = '#d65d0e',
        red = '#fb4934',
        green = '#b8bb26',
        yellow = '#fabd2f',
        blue = '#83a598',
        purple = '#d3869b',
        aqua = '#8ec07c',
        orange = '#fe8019',
        bg0_h = '#1d2021',
        bg0 = '#282828',
        bg0_s = '#32302f',
        bg1 = '#3c3836',
        bg2 = '#504945',
        bg3 = '#665c54',
        bg4 = '#7c6f64',
        gray = '#928374',
        fg4 = '#a89984',
        fg3 = '#bdae93',
        fg2 = '#d5c4a1',
        fg1 = '#ebdbb2',
        fg0 = '#fbf1c7',
    },
    light = {
        red_dimmed = '#cc241d',
        green_dimmed = '#98971a',
        yellow_dimmed = '#d79921',
        blue_dimmed = '#458588',
        purple_dimmed = '#b16286',
        aqua_dimmed = '#689d6a',
        gray_dimmed = '#7c6f64',
        orange_dimmed = '#d65d0e',
        red = '#9d0006',
        green = '#79740e',
        yellow = '#b57614',
        blue = '#076678',
        purple = '#8f3f71',
        aqua = '#427b58',
        orange = '#af3a03',
        bg0_h = '#f9f5d7',
        bg0 = '#fbf1c7',
        bg0_s = '#f2e5bc',
        bg1 = '#ebdbb2',
        bg2 = '#d5c4a1',
        bg3 = '#bdae93',
        bg4 = '#a89984',
        gray = '#928374',
        fg4 = '#7c6f64',
        fg3 = '#665c54',
        fg2 = '#504945',
        fg1 = '#3c3836',
        fg0 = '#282828',
    },
}

local gruv_mode = vim.api.nvim_eval('gruv_mode')
if gruv_mode == 'dark' then
    palette = palette.dark
elseif gruv_mode == 'light' then
    palette = palette.light
else
    error("Invalid gruv mode")
end

local gruv_variant = vim.api.nvim_eval('gruv_variant')
if gruv_variant == 'h' then
    palette.bg = palette.bg0_h
elseif gruv_variant == 'm' then
    palette.bg = palette.bg0
elseif gruv_variant == 's' then
    palette.bg = palette.bg0_s
else
    error("Invalid gruv variant")
end

local theme = {
    syntax = {
        func = { guifg = palette.green, gui = attrs.bold },
        not_important = { guifg = palette.fg4 },
        comment = { guifg = palette.gray },
        string = { guifg = palette.blue },
        number = { guifg = palette.purple, gui = attrs.bold },
        type = { guifg = palette.aqua },
        variable = { guifg = palette.fg1 },
    },
    editor = {
        normal = { guibg =  palette.bg, guifg = palette.fg1 },
        visual = { guibg = palette.bg2, gui = attrs.none },
        search = { guibg = palette.yellow, guifg = palette.bg, gui = attrs.bold },
        popup_inactive = { guibg = palette.bg1, guifg = palette.fg4 },
        popup_active = { guibg = palette.bg2, guifg = palette.fg1, gui = attrs.bold },
        folded = { guibg = palette.bg1, guifg = palette.fg3 },
        hint = { guifg = palette.aqua },
        info = { guifg = palette.purple },
        warning = { guifg = palette.orange },
        error = { guifg = palette.red },
        statusline = { guibg = palette.bg1, guifg = palette.fg1 },
    },
}

local debug = { guibg = 'red', guifg = 'black', gui = attrs.nocombine }

function highlight(group, opts)
    if opts == nil then
        error("Required param opts is nil")
    end
    if group == nil then
        error("Required param group is nil")
    end

    local params = ""
    for k, v in pairs(opts) do
        if v == nil then
            error("Key has value nil: " .. k)
        end

        if k == "guifg" then
            params = params .. " guifg=" .. v
        elseif k == "guibg" then
            params = params .. " guibg=" .. v
        elseif k == "gui" then
            params = params .. " gui=" .. v
        else
            error("Unsupported key: " .. k)
        end
    end

    if params == "" then
        error("Received invalid opts")
    elseif opts.gui == nil then
        params = params .. " gui=" .. attrs.nocombine
    end

    vim.api.nvim_command("highlight! " .. group .. params)
end

-- Vim syntax hi groups {{{
highlight("Normal", theme.editor.normal)
highlight("Visual", theme.editor.visual)

-- vim.api.nvim_command(string.format([[
-- function s:SetupVisualForFloating()
--     if nvim_win_get_config(0).relative != ''
--         highlight! Visual guibg=%s gui=none
--     endif
-- endfunction
-- function s:ResetVisualForFloating()
--     if nvim_win_get_config(0).relative != ''
--         highlight! Visual guibg=%s gui=none
--     endif
-- endfunction
--
-- au WinEnter * call <SID>SetupVisualForFloating()
-- au WinLeave * call <SID>ResetVisualForFloating()
-- ]], colors.base5, colors.base4_lighter))

highlight("Define", debug)
highlight("vimFuncSID", debug)

highlight("ErrorMsg", { guifg = theme.editor.error.guifg, guibg = theme.editor.normal.guibg, gui = attrs.bold })
highlight("WarningMsg", { guifg = theme.editor.warning.guifg, guibg = theme.editor.normal.guibg, gui = attrs.bold })

highlight("Exception", theme.syntax.func)
highlight("Function", theme.syntax.func)
highlight("Macro", theme.syntax.func)
-- Macro functions
highlight("PreCondit", theme.syntax.func)

highlight("PreProc", theme.syntax.variable)
highlight("Identifier", theme.syntax.variable)
-- Namespaces
highlight("Include", theme.syntax.variable)

highlight("Underlined", { guifg = theme.syntax.string.guifg, gui = attrs.underline })
highlight("Directory", { guifg = theme.syntax.string.guifg, gui = attrs.bold })
highlight("String", theme.syntax.string)
highlight("Character", theme.syntax.string)

highlight("Comment", theme.syntax.comment)

highlight("vimNotation", { guifg = theme.syntax.type.guifg, gui = attrs.bold })
highlight("vimMapModKey", { guifg = theme.syntax.type.guifg, gui = attrs.bold })
highlight("SpecialKey", { guifg = theme.syntax.type.guifg, gui = attrs.bold })
highlight("Type", theme.syntax.type)

-- plug.vim after update labels
highlight("Label", theme.syntax.not_important)
highlight("Keyword", theme.syntax.not_important)
highlight("Statement", theme.syntax.not_important)
highlight("StorageClass", theme.syntax.not_important)
highlight("Structure", theme.syntax.not_important)
highlight("Typedef", theme.syntax.not_important)
highlight("Operator", theme.syntax.not_important)
highlight("vimBracket", theme.syntax.not_important)
highlight("vimSetSep", theme.syntax.not_important)
highlight("vimParenSep", theme.syntax.not_important)
highlight("vimSep", theme.syntax.not_important)
highlight("vimContinue", theme.syntax.not_important)
highlight("Special", theme.syntax.not_important)
highlight("Conditional", theme.syntax.not_important)
highlight("Repeat", theme.syntax.not_important)

highlight("Constant", theme.syntax.number)
highlight("Boolean", theme.syntax.number)
highlight("Number", theme.syntax.number)
highlight("Float", theme.syntax.number)
-- }}}

-- Misc {{{
highlight("ColorColumn", { guibg = theme.editor.statusline.guibg, guifg = attrs.none })
-- Current line background
highlight("CursorLine", { guibg = theme.editor.statusline.guibg, guifg = attrs.none })
-- Current line number
highlight("CursorLineNr", { guibg = theme.editor.statusline.guibg, guifg = theme.editor.normal.guifg, gui = attrs.bold })
-- Non current line numbers
highlight("LineNr", theme.syntax.not_important)

-- Current incremental search result
highlight("IncSearch", theme.editor.search)
-- Search result
highlight("Search", theme.editor.search)

-- Active window status line
highlight("StatusLine", theme.editor.statusline)
-- Non active window status line
highlight("StatusLineNC", { guibg = theme.editor.normal.guibg, guifg = theme.syntax.not_important.guifg })
highlight("VertSplit", { guibg = theme.editor.statusline.guibg, guifg = theme.editor.statusline.guibg })
highlight("SignColumn", { guibg = theme.editor.normal.guibg })

highlight("Folded", theme.editor.folded)
highlight("EndOfBuffer", { guifg = theme.editor.normal.guibg })
highlight("NonText", theme.editor.folded)

highlight("TabLine", { guifg = theme.syntax.not_important.guifg, guibg = theme.editor.normal.guibg })
highlight("TabLineFill", { guifg = theme.editor.normal.guibg, guibg = theme.editor.normal.guibg })
highlight("TabLineSel", { guifg = theme.editor.normal.guifg, guibg = theme.editor.statusline.guibg, gui = attrs.bold })
-- Window counter per tab
highlight("Title", { guifg = theme.editor.normal.guifg, guibg = theme.editor.statusline.guibg, gui = attrs.bold })

highlight("fzf1", { guifg = theme.editor.statusline.guibg, guibg = theme.editor.statusline.guibg })
highlight("fzf2", { guifg = theme.editor.statusline.guibg, guibg = theme.editor.statusline.guibg })
highlight("fzf3", { guifg = theme.editor.statusline.guibg, guibg = theme.editor.statusline.guibg })

highlight("Pmenu", theme.editor.popup_inactive)
highlight("PmenuSel", theme.editor.popup_active)
highlight("PmenuSbar", { guibg = theme.editor.popup_inactive.guibg })
highlight("PmenuThumb", { guibg = theme.editor.popup_active.guibg })
-- }}}

-- Tree sitter {{{
highlight("TSAnnotation", debug)
highlight("TSAttribute", debug)
highlight("TSParameterReference", debug)
highlight("TSText", debug)
highlight("TSSymbol", debug)
highlight("TSWarning", debug)
highlight("TSDanger", debug)
highlight("TSStrike", debug)
highlight("TSNote", debug)

highlight("TSNone", { guibg = attrs.none, guifg = attrs.none, gui = attrs.none })
highlight("TSUnderline", { guibg = attrs.none, guifg = attrs.none, gui = attrs.underline })

highlight("TSComment", theme.syntax.comment)

highlight("TSCharacter", theme.syntax.string)
highlight("TSString", theme.syntax.string)
highlight("TSStringRegex", theme.syntax.string)
highlight("TSURI", { guifg = theme.syntax.string.guifg, gui = attrs.underline })

-- C #define
highlight("TSConstMacro", theme.syntax.not_important)
highlight("TSInclude", theme.syntax.not_important)
highlight("TSKeywordOperator", theme.syntax.not_important)
highlight("TSKeywordFunction", theme.syntax.not_important)
highlight("TSKeyword", theme.syntax.not_important)
highlight("TSOperator", theme.syntax.not_important)
highlight("TSPunctBracket", theme.syntax.not_important)
highlight("TSPunctDelimiter", theme.syntax.not_important)
highlight("TSPunctSpecial", theme.syntax.not_important)
highlight("TSTagDelimiter", theme.syntax.not_important)
highlight("TSConditional", theme.syntax.not_important)
highlight("TSRepeat", theme.syntax.not_important)

highlight("TSError", { guifg = theme.editor.error.guifg, guibg = theme.editor.error.guibg, gui = attrs.bold })

highlight("TSBoolean", theme.syntax.number)
highlight("TSNumber", theme.syntax.number)
highlight("TSFloat", theme.syntax.number)
-- nil in Lua
highlight("TSConstBuiltin", theme.syntax.number)
-- Rust lifetime annotations
highlight("TSLabel", theme.syntax.number)
highlight("TSStringEscape", theme.syntax.number)

-- Struct fields in Rust
highlight("TSField", theme.syntax.variable)
-- Fields in some other languages
highlight("TSProperty", theme.syntax.variable)
-- Function parameters
highlight("TSParameter", theme.syntax.variable)
-- Variables
highlight("TSVariable", theme.syntax.variable)
-- self in Rust
highlight("TSVariableBuiltin", theme.syntax.variable)
highlight("TSNamespace", theme.syntax.variable)

-- <em></em>
highlight("TSEmphasis", { guifg = theme.editor.normal.guifg, gui = attrs.italic })
-- <strong></strong>
highlight("TSStrong", { guifg = theme.editor.normal.guifg, gui = attrs.bold })
-- <code></code>
highlight("TSLiteral", { guifg = theme.editor.normal.guifg })
-- <title></title>
highlight("TSTitle", { guifg = theme.editor.normal.guifg, gui = attrs.bold .. "," .. attrs.underline })

highlight("TSException", theme.syntax.func)
highlight("TSFuncBuiltin", theme.syntax.func)
highlight("TSFunction", theme.syntax.func)
highlight("TSFuncMacro", theme.syntax.func)
highlight("TSMethod", theme.syntax.func)

-- HTML tag
highlight("TSTag", { guifg = theme.syntax.type.guifg, gui = attrs.bold })
highlight("TSType", theme.syntax.type)
highlight("TSTypeBuiltin", theme.syntax.type)
-- new Promise for example in JS
highlight("TSConstructor", theme.syntax.type)
-- Enum variants in Rust
highlight("TSConstant", theme.syntax.type)
-- }}}

-- Builtin LSP {{{
highlight("LspDiagnosticsDefaultError", debug)
highlight("LspDiagnosticsDefaultHint", debug)
highlight("LspDiagnosticsDefaultInformation", debug)
highlight("LspDiagnosticsDefaultWarning", debug)

highlight("LspDiagnosticsFloatingError", debug)
highlight("LspDiagnosticsFloatingHint", debug)
highlight("LspDiagnosticsFloatingInformation", debug)
highlight("LspDiagnosticsFloatingWarning", debug)

highlight("LspDiagnosticsSignError", theme.editor.error)
highlight("LspDiagnosticsSignHint", theme.editor.hint)
highlight("LspDiagnosticsSignInformation", theme.editor.info)
highlight("LspDiagnosticsSignWarning", theme.editor.warning)

highlight("LspDiagnosticsUnderlineError", { guibg = attrs.none, guifg = attrs.none, gui = attrs.none })
highlight("LspDiagnosticsUnderlineHint", { guibg = attrs.none, guifg = attrs.none, gui = attrs.none })
highlight("LspDiagnosticsUnderlineInformation", { guibg = attrs.none, guifg = attrs.none, gui = attrs.none })
highlight("LspDiagnosticsUnderlineWarning", { guibg = attrs.none, guifg = attrs.none, gui = attrs.none })

highlight("LspDiagnosticsVirtualTextError", theme.editor.error)
highlight("LspDiagnosticsVirtualTextHint", theme.editor.hint)
highlight("LspDiagnosticsVirtualTextInformation", theme.editor.info)
highlight("LspDiagnosticsVirtualTextWarning", theme.editor.warning)

-- This if for reading
highlight("LspReferenceRead", theme.editor.search)
-- These two are for assignments, pointer dereferencing etc.
highlight("LspReferenceText", theme.editor.search)
highlight("LspReferenceWrite", theme.editor.search)
-- }}}
