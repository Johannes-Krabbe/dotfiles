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
                lualine_a = { 'branch' },
                lualine_b = {
                    -- Filename with unsaved indicator combined
                    {
                        function()
                            local filename = vim.fn.expand('%:~:.')
                            if filename == '' then
                                filename = '[No Name]'
                            end

                            if vim.bo.modified then
                                return filename .. ' ●'
                            end
                            return filename
                        end,
                    }
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {
                    -- List of all unsaved buffers
                    {
                        function()
                            local unsaved = {}
                            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                                if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, 'modified') then
                                    local name = vim.api.nvim_buf_get_name(buf)
                                    if name ~= '' then
                                        -- Get just the filename, not the full path
                                        name = vim.fn.fnamemodify(name, ':t')
                                        table.insert(unsaved, name)
                                    else
                                        -- Handle unnamed buffers
                                        table.insert(unsaved, '[No Name]')
                                    end
                                end
                            end

                            if #unsaved > 0 then
                                return '⚠ ' .. table.concat(unsaved, ', ')
                            end
                            return ''
                        end,
                        color = { fg = '#fab387' }, -- catppuccin peach color
                    },
                },
                lualine_z = { 'mode' },
            },
        }
    end
}
