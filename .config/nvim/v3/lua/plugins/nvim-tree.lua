require('nvim-tree').setup({
    view = {
        side = 'right',
        adaptive_size = true,
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
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})
