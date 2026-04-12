local telescope_builtin = require('telescope.builtin')
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local telescope_plugin_config = require('plugins.telescope')

-- Telescope
vim.keymap.set('n', '<leader>fw', telescope_builtin.live_grep)
vim.keymap.set('n', '<leader>fm', telescope_builtin.lsp_references)
vim.keymap.set('n', '<leader>fs', telescope_plugin_config.dir_live_grep)
vim.keymap.set('n', '<leader>ff', telescope_plugin_config.find_files)
vim.keymap.set('n', '<leader><leader>', telescope_builtin.buffers)

-- Window navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- File explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Esc>', ':NvimTreeClose<CR>', { noremap = true, silent = true })

-- LSP
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename)

-- Clear search highlight
vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>')

-- Delete line without yanking
vim.keymap.set('n', 'dD', '"_dd', { noremap = true })

-- Close buffer(s)
vim.keymap.set('n', '<leader>c', ':bd<CR>')
vim.keymap.set('n', '<leader>be', function()
    for _, bufnr in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
        local buftype = vim.fn.getbufvar(bufnr.bufnr, '&buftype')
        if buftype ~= 'terminal' and buftype ~= 'nofile' and buftype ~= 'quickfix' and buftype ~= 'help' and vim.fn.bufname(bufnr.bufnr) ~= '' then
            vim.api.nvim_buf_delete(bufnr.bufnr, { force = true })
        end
    end
end)

-- Diagnostics
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.goto_next({ float = false }) end)
vim.keymap.set('n', '<leader>dp', function() vim.diagnostic.goto_prev({ float = false }) end)

-- Git blame
vim.keymap.set('n', '<leader>gb', ':GitBlameToggle<CR>')

-- Harpoon
vim.keymap.set('n', '<leader>hh', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>ha', function()
    mark.add_file()
    print('Harpooned file')
end)
for i = 1, 9 do
    vim.keymap.set('n', '<leader>h' .. i, function()
        ui.nav_file(i)
        print('Hooked to ' .. i)
    end)
end


-- conform
local conform = require 'conform'
vim.keymap.set('n', '<leader>j', function()
    conform.format { async = true, lsp_fallback = true, timeout_ms = 500 }
end, { desc = 'Format the current buffer' })
