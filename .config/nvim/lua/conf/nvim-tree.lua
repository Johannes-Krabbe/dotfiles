require('nvim-tree').setup {
    view = {
        float = {
            enable = true,
            open_win_config = {
                border = "single",
                col = 2,
                row = 2,
            }
        },
        adaptive_size = true,
        mappings = {
            list = {
                { key = "<ESC>", action = "close" },
            },
        },
    },
    filters = {
        dotfiles = false,
    },
    git = {
        enable = true,
        ignore = false,
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
}
