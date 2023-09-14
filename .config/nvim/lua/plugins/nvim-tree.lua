return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require('nvim-tree').setup {
      view = {
        float = {
          enable = true,
          open_win_config = {
            border = "none",
          }
        },
        adaptive_size = true,
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
    }
    vim.api.nvim_set_keymap('n', '<Esc>', ':NvimTreeClose<CR>', { noremap = true, silent = true })
  end,
}
