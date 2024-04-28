local telescope_builtin = require("telescope.builtin")

-- Telescope
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>fw", telescope_builtin.live_grep, {})
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

-- Close buffer(s)
vim.keymap.set("n", "<leader>c", ":bd<CR>")
vim.keymap.set("n", "<leader>bb", "CloseFileBuffers<CR>")

-- Format
vim.keymap.set("n", "<leader>j", vim.lsp.buf.format, {})

-- Diagnostics
vim.keymap.set("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<cr>")

-- bufferline
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
