local wk = require("which-key")

wk.register({
  e = { ":NvimTreeToggle<cr>", "Explorer" },
  c = { ":bd<cr>", "Close buffer" },
  n = { ":nohl<cr>", "Clear Highlights" },
  f = {
    name = "Find",
    f = { ":Telescope find_files<cr>", "Find File" },
    w = { ":Telescope live_grep<cr>", "Find Words" },
    b = { ":Telescope buffers<cr>", "Find in Buffers" },
  },
  t = {
    name = "Trouble",
    t = { "<cmd>Trouble<cr>", "Trouble Toggle" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Trouble Workspace" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Trouble Document" },
    l = { "<cmd>Trouble loclist<cr>", "Trouble Loclist" },
    q = { "<cmd>Trouble quickfix<cr>", "Trouble Quickfix" },
    r = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
  },
  g = {
    name = "Git",
    g = { "<cmd>lua Lazygit_toggle()<cr>", "LazyGit" },
  },
}, { prefix = "<leader>" })

wk.register({
  ['[d'] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous diagnostic" },
  [']d'] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
  ['<leader>d'] = {
    name = "diagnostics",
    f = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Float" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Loclist" },
  },
  g = {
    name = "Goto",
    h = "<cmd>Lspsaga lsp_finder<cr>",
    a = "<cmd>Lspsaga code_action<cr>",
    d = "<cmd>Lspsaga peek_definition<cr>",
  },
})

wk.register({
  ['<S-l>'] = { ":BufferLineCycleNext<cr>", "Next tab" },
  ['<S-h>'] = { ":BufferLineCyclePrev<cr>", "Prev tab" },
  ['<S-k>'] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
  ['<C-k>'] = { ":wincmd k<cr>", "Jump to north pane" },
  ['<C-j>'] = { ":wincmd j<cr>", "Jump to south pane" },
  ['<C-h>'] = { ":wincmd h<cr>", "Jump to west pane" },
  ['<C-l>'] = { ":wincmd l<cr>", "Jump to east pane" },
  ['<C-g>'] = { "<cmd>lua Lazygit_toggle()<cr>", "LazyGit" }
})


wk.register({
  ['<C-g>'] = { "<cmd>lua Lazygit_toggle()<cr>", "LazyGit" }
}, { mode = "t" })
