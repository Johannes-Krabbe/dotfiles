-- format on save, excluding .yml files
local format_group = vim.api.nvim_create_augroup('Format', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        -- exclude .yml files from formatting
        local filename = vim.fn.expand('%:p')
        if vim.fn.match(filename, '\\.yaml$') > -1 then
            return
        end

        if vim.fn.match(filename, '\\.md$') > -1 then
            return
        end


        vim.cmd("mkview")
        vim.lsp.buf.format {
            filter = function(client)
                return
                    client.name ~= "tsserver"
            end
        }
        vim.cmd("silent! loadview")
    end,
    group = format_group,
})

-- highlight yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
})

local dashboard_group = vim.api.nvim_create_augroup("CleanDashboard", {})

vim.api.nvim_create_autocmd("User", {
    group = dashboard_group,
    pattern = "AlphaReady",
    callback = function()
        vim.opt.showtabline = 0
        vim.opt.showmode = false
        vim.opt.laststatus = 0
        vim.opt.showcmd = false
        vim.opt.ruler = false
    end,
})

vim.api.nvim_create_autocmd("BufUnload", {
    group = dashboard_group,
    pattern = "<buffer>",
    callback = function()
        vim.opt.showtabline = 2
        vim.opt.showmode = true
        vim.opt.laststatus = 3
        vim.opt.showcmd = true
        vim.opt.ruler = true
    end,
})

local modifiedBufs = function(bufs)
    local t = 0
    for k, v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
            t = t + 1
        end
    end
    return t
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and
            vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
            modifiedBufs(vim.fn.getbufinfo({ bufmodified = 1 })) == 0 then
            vim.cmd "quit"
        end
    end
})
