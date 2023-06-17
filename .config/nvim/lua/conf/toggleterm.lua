require("toggleterm").setup {
  size = 20,
  open_mapping = [[<c-t>]],
  direction = 'float',
  winbar = {
    enabled = true,
  },
}

local Terminal = require('toggleterm.terminal').Terminal
