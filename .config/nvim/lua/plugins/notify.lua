return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    local notify = require("notify")

    notify.setup({
      timeout = 5000,
      stages = "static",
      render = "compact"
    })
    vim.notify = notify
  end,
}
