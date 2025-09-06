-- disable spacebar in normal mode
vim.api.nvim_set_keymap('n', ' ', '<Nop>', { noremap = true, silent = true })

-- set spacebar as leader key
vim.g.mapleader = ' '

-- use spaces instead of tabs
vim.o.expandtab = true

-- Set default tab width
local DEFAULT_TAB_WIDTH = 4
vim.o.tabstop = DEFAULT_TAB_WIDTH
vim.o.shiftwidth = DEFAULT_TAB_WIDTH

-- Set specific tab width for Prisma files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "prisma",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})


-- Function to set shiftwidth and tabstop
local set_shift_tab = function(filetype, shiftwidth, tabstop)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function()
      vim.o.shiftwidth = shiftwidth
      vim.o.tabstop = tabstop
    end,
  })
end
set_shift_tab('dart', 2, 2)

-- sync clipboards
vim.o.clipboard = "unnamedplus"

-- show line numbers
vim.wo.number = true

vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>')

-- enable persistent undos
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.autoread = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.scrolloff = 8
vim.o.ignorecase = true
vim.o.smartcase = true

-- disable swap files
vim.o.swapfile = false

-- prevent shifting when loading lsp gutter icons
vim.o.signcolumn = 'yes'


-- nowrap
vim.o.wrap = false

-- disable mouse
vim.o.mouse = ""

vim.wo.fillchars='eob: '
