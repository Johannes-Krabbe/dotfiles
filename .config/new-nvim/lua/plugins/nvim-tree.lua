return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local screen_w = vim.opt.columns:get()
    local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get() - 1
    require('nvim-tree').setup {
      view = {
        float = {
          enable = true,
          open_win_config = {
            relative = "editor",
            border = "none",
            style = "minimal",
            row = 0,
            col = screen_w,
            height = screen_h,
            anchor = "NE",
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
  end,
}
