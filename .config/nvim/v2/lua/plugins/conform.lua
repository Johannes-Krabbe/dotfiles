return {
    'stevearc/conform.nvim',
    lazy = false,
    opts = {
        formatters_by_ft = {
            javascript = { 'prettier', stop_after_first = true },
            typescript = { 'prettier', stop_after_first = true },
        },
    },
}
