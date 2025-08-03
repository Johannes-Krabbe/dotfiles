return {
    "zbirenbaum/copilot.lua",
    lazy = false,
    enabled = false,
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
                accept = "<C-j>",
                accept_word = false,
                accept_line = false,
                next = "<C-k>",
            },
        },
        filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            scss = true,
            ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
    }
}
