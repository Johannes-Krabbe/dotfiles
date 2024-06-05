-- for zmk config to work with treesitter
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.keymap",
    callback = function()
        vim.cmd("set ft=dts")
    end
})
