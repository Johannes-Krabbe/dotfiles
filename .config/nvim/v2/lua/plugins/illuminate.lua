return {
    "RRethy/vim-illuminate",
    lazy = false,
    config = function()
        require("illuminate").configure({
            filetype_overrides = { "lua", "ts", "js", "rs" },
        })
    end,
}
