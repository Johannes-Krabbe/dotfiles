return {
    "akinsho/bufferline.nvim",
    lazy = false,
    enabled = false,
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
