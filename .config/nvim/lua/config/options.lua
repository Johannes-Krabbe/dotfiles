vim.api.nvim_set_keymap('n', ' ', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '

local o = vim.o
local wo = vim.wo
-- local cmd = vim.cmd
-- local g = vim.g


-- prevent shifting when loading lsp gutter icons
o.signcolumn = 'yes'

o.termguicolors = true

-- set tab width
local TAB_WIDTH = 2
o.tabstop = TAB_WIDTH
o.shiftwidth = TAB_WIDTH
o.expandtab = true

-- sync clipboards
o.clipboard = "unnamedplus"
wo.number = true
o.mouse = 'a'

-- whichkey timeout
o.timeoutlen = 300

-- enable persistent undos
o.undofile = true
o.undolevels = 1000
o.autoread = true
o.backup = false
o.writebackup = false
o.scrolloff = 8
o.ignorecase = true
o.smartcase = true

o.completeopt = 'menuone,preview,noinsert'
o.hidden = true

-- cursor line
o.cul = true

-- set gutter icons
local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " "
}

for name, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config {
  virtual_text = {
    prefix = " ",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
}

-- session
o.sessionoptions = "blank,buffers,curdir,folds,tabpages,winsize,winpos"

-- sackik omegalul omega pepe
o.swapfile = false
o.undofile = true
