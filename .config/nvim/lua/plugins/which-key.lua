return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.register({
      c = { ":bd<cr>", "Close buffer" },
      e = { ":NvimTreeToggle<cr>", "Explorer" },
      n = { ":nohl<cr>", "Clear Highlights" },
      l = { "", "LSP" },
      b = {
        name = "Buffer",
        b = { ":CloseFileBuffersExceptCurrent<cr>", "close all files exept current" },
        e = { ":CloseFileBuffers<cr>", "close all files" },
      },
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
      d = {
        name = "diagnostics",
        f = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Float" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Loclist" },
        dp = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous diagnostic" },
        dn = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
      }
    }, { prefix = "<leader>" })

    wk.register({
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
    })
  end,
}
