return {
  "j-hui/fidget.nvim",
  lazy = false,
  tag = 'legacy',
  config = function()
    require("fidget").setup()
  end
}
