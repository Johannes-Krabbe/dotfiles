return {
    "akinsho/bufferline.nvim",
    lazy = true,
    enabled = true,
    opts = {
        options = {
            separator_style = "slant",
            diagnostics = "nvim_lsp",
            hover = {
                enabled = true,
                delay = 0,
                reveal = { "close" },
            },
        },
    },
}
