return {
    {
        "supermaven-inc/supermaven-nvim",
        lazy = false,
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-j>",
                    clear_suggestion = "<C-]>",
                    accept_word = "<C-l>",
                },
                ignore_filetypes = {
                    yaml = true,
                    markdown = true,
                    help = true,
                    gitcommit = true,
                    gitrebase = true,
                    hgcommit = true,
                    svn = true,
                    cvs = true,
                    ["."] = true,
                },
                color = {
                    suggestion_color = "#808080",
                    cterm = 244,
                },
                log_level = "info",
                disable_inline_completion = false,
                disable_keymaps = false,
            })

            -- Add keybind to toggle Supermaven
            vim.keymap.set("n", "<leader>st", function()
                local api = require("supermaven-nvim.api")
                if api.is_running() then
                    api.stop()
                    vim.notify("Supermaven stopped", vim.log.levels.INFO)
                else
                    api.start()
                    vim.notify("Supermaven started", vim.log.levels.INFO)
                end
            end, { desc = "Toggle Supermaven" })
        end,
    },
}
