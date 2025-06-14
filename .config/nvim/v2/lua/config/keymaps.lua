local telescope_builtin = require("telescope.builtin")

-- Telescope
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>fw", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>", telescope_builtin.buffers, {})

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- open / file explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Esc>', ':NvimTreeClose<CR>', { noremap = true, silent = true })


-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, {})

-- Format
local conform = require 'conform'
vim.keymap.set('n', '<leader>j', function()
    conform.format { async = true, lsp_fallback = true, timeout_ms = 500 }
end, { desc = 'Format the current buffer' })

-- Close buffer(s)
vim.keymap.set("n", "<leader>c", ":bd<CR>")
vim.keymap.set("n", "<leader>be", ":CloseFileBuffers<CR>")

-- Diagnostics
vim.keymap.set("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<cr>")

-- bufferline
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")

vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>")
