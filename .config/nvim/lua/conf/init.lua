require('gitsigns').setup {}
require('Comment').setup {}
require('neoscroll').setup {}
require('colorizer').setup()
require('lspsaga').setup()
require("transparent").setup {}

require('bufferline').setup {
  options = {
    buffer_close_icon = ""
  },
  highlights = {
    fill = {
      bg = 'NONE',
      fg = 'white',
    },
    background = {
      bg = 'NONE',
      fg = 'NONE',
    },
    close_button = {
      bg = 'NONE',
      fg = 'NONE',
    },
    separator = {
      bg = 'NONE',
    },
    separator_visible = {
      bg = 'NONE',
    },
    separator_selected = {
      bg = 'NONE',
    },
    buffer_selected = {
      bg = 'NONE',
      fg = 'NONE',
    },
    close_button_visible = {
      bg = 'NONE',
      fg = 'NONE',
    },
    close_button_selected = {
      bg = 'NONE',
      fg = 'NONE',
    },
    buffer_visible = {
      bg = 'NONE',
      fg = 'NONE',
    },
    duplicate = {
      bg = 'NONE',
    },
    duplicate_selected = {
      bg = 'NONE',
    },
    duplicate_visible = {
      bg = 'NONE',
    },
    modified = {
      bg = 'NONE',
    },
    modified_selected = {
      bg = 'NONE',
    },
  },
}

require('fidget').setup {
  text = {
    spinner = "dots",
  },
}

require("trouble").setup {
  use_diagnostic_signs = true
}

require('lualine').setup {
  options = {
    component_separators = { left = ' ', right = '' },
    section_separators = { left = '', right = '' },
    always_divide_middle = true,
    globalstatus = true,
    theme = 'dracula-nvim',
  },
  sections = {
    lualine_c = { { 'filename', path = 1 } },
  },
}

require('project_nvim').setup {
  detection_methods = { "pattern" },
  patterns = { ".git", ">Developer", "=nvim" },
}

require "conf.nvim-tree"
require "conf.null-ls"
require "conf.toggleterm"
require "conf.alpha"
require "conf.cmp"
require "conf.telescope"
require "conf.auto-session"
require "conf.dracular"
