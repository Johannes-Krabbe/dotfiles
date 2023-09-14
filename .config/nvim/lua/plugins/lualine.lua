return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        component_separators = { left = ' ', right = '' },
        section_separators = { left = '', right = '' },
        always_divide_middle = true,
        globalstatus = true,
        theme = 'catppuccin-mocha',
      },
      sections = {
        lualine_c = { { 'filename', path = 1 } },
      },
    }
  end
}
