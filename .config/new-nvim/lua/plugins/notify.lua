return {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
        local notify = require("notify")

        notify.setup({
            timeout = 5000,
            stages = "static",
            render = "wrapped-compact",
            max_width = 50,
        })
        vim.notify = notify
    end,
}
