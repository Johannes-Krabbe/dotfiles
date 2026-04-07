local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local ignore_patterns = { 'node_modules', 'dist', '%.git/', '.vscode', '.next', '.turbo', '.tap' }

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
        layout_config = {
            horizontal = {
                width = 0.95,
                preview_width = 0.55,
            },
        },
        hidden = true,
        file_ignore_patterns = ignore_patterns,
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob', '!.git/',
        },
    },
    extensions = {
        ["ui-select"] = {
            require('telescope.themes').get_dropdown({}),
        },
    },
})

telescope.load_extension('ui-select')

local M = {}

function M.dir_live_grep()
    local find_cmd = { 'find', '.', '-maxdepth', '6', '-type', 'd' }
    for _, pattern in ipairs(ignore_patterns) do
        table.insert(find_cmd, '-not')
        table.insert(find_cmd, '-path')
        table.insert(find_cmd, '*/' .. pattern .. '/*')
    end

    builtin.find_files({
        find_command = find_cmd,
        prompt_title = 'Select Directory',
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                builtin.live_grep({ search_dirs = { selection[1] } })
            end)
            return true
        end,
    })
end

function M.find_files()
    local find_command = { 'rg', '--files', '--hidden', '--no-ignore' }
    for _, pattern in ipairs(ignore_patterns) do
        -- strip Lua pattern escapes (%) and trailing slashes for rg globs
        local clean = pattern:gsub('%%', ''):gsub('/$', '')
        table.insert(find_command, '--glob')
        table.insert(find_command, '!**/' .. clean .. '/**')
        table.insert(find_command, '--glob')
        table.insert(find_command, '!**/' .. clean)
    end
    builtin.find_files({ find_command = find_command })
end

return M
