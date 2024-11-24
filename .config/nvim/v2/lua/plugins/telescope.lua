return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = require "telescope.actions".move_selection_next,
                            ["<C-k>"] = require "telescope.actions".move_selection_previous,
                        },
                        n = {
                            ["<C-j>"] = require "telescope.actions".move_selection_next,
                            ["<C-k>"] = require "telescope.actions".move_selection_previous,
                        }
                    },
                    layout_config = {
                        horizontal = {
                            width = 0.95,
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = { width = 0.95 }
                    },
                    file_ignore_patterns = { "node_modules", "dist" },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            require("telescope").load_extension("ui-select")
        end,
    },
}
