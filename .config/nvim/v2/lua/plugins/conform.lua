return {
    'stevearc/conform.nvim',
    lazy = false,
    opts = {
        formatters_by_ft = {
            javascript = { "prettierd", 'prettier', stop_after_first = true },
            typescript = { "prettierd", 'prettier', stop_after_first = true },
        },
    },
}
