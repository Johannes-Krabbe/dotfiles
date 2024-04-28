return {
  'akinsho/toggleterm.nvim',
  lazy = false,
  version = "*",
  config = function()
    require("toggleterm").setup {
      size = 20,
      open_mapping = [[<c-t>]],
      direction = 'float',
      winbar = {
        enabled = true,
      },
    }
  end,
}
