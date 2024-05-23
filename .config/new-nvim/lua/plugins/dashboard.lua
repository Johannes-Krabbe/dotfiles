return {
    'glepnir/dashboard-nvim',
    lazy = false,
    config = function()
        local header = {
            [[ ]],
            [[ ]],
            [[ ]],
            [[ ]],
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            [[ ]],
            [[ ]],
            [[ ]],
        }
        require('dashboard').setup({
            theme = 'doom',
            config = {
                header = header, --your header
                center = {
                    {
                        icon = '󱠒  ',
                        icon_hl = 'Title',
                        desc = 'Restore Session',
                        action = "SessionRestore"
                    },

                    {
                        icon = '  ',
                        icon_hl = 'Title',
                        desc = 'Find File',
                        action = "Telescope find_files"
                    },
                    {
                        icon = '  ',
                        icon_hl = 'Title',
                        desc = 'Find Word',
                        action = "Telescope live_grep"
                    },
                },
                footer = {} --your footer
            }
        })
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
