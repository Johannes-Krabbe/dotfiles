-- disable spacebar in normal mode
vim.api.nvim_set_keymap('n', ' ', '<Nop>', { noremap = true, silent = true })

-- set spacebar as leader key
vim.g.mapleader = ' '

-- use spaces instead of tabs
vim.o.expandtab = true

-- tab width
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- sync clipboards with system clipboard
vim.o.clipboard = "unnamedplus"

-- show line numbers
vim.wo.number = true

-- persistent undos
vim.o.undofile = true
vim.o.undolevels = 1000

vim.o.autoread = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- scrolling
vim.o.scrolloff = 8
vim.o.wrap = false

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- prevent shifting when loading lsp gutter icons
vim.o.signcolumn = 'yes'

-- disable mouse
vim.o.mouse = ""

-- hide ~ on empty lines
vim.wo.fillchars = 'eob: '

-- Set specific tab width for Prisma files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "prisma",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
