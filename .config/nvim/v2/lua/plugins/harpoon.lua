return {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = { -- optional packages
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("harpoon").setup({
            menu = {
                width = math.floor(vim.api.nvim_win_get_width(0) / 2),
            }
        })
    end,

}
