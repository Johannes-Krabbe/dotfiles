return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = "VeryLazy",
  config = function()
    require("telescope").setup {
      defaults = {
        -- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require "telescope.sorters".get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        -- border = {},
        color_devicons = true,
        file_previewer = require "telescope.previewers".vim_buffer_cat.new,
        grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
        qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
        mappings = {
          i = {
            ["<C-j>"] = require "telescope.actions".move_selection_next,
            ["<C-k>"] = require "telescope.actions".move_selection_previous,
          },
          n = {
            ["<C-j>"] = require "telescope.actions".move_selection_next,
            ["<C-k>"] = require "telescope.actions".move_selection_previous,
          }
        }
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
          initial_mode = "normal",
          grouped = true,
        },
      },
    }

    require("telescope").load_extension "file_browser"
    require('telescope').load_extension('projects')
  end,
}
