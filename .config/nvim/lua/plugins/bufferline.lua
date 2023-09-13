return {
  'akinsho/bufferline.nvim',
  lazy = false,
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
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
  end
}
