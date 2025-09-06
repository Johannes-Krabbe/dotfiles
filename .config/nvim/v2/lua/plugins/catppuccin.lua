return {
    "catppuccin/nvim",
    enabled = false,
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme catppuccin-mocha]])
    end,
}
