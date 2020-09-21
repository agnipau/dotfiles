local function include(fname)
    for _, v in ipairs(fname) do
        dofile(os.getenv("HOME") .. "/.config/nvim/lua/" .. v .. ".lua")
    end
end

include {
    "plug",
    "keymaps",
    "options",
    "commands",
}

