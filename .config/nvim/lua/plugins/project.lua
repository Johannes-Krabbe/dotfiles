return {
  'ahmedkhalf/project.nvim',
  event = "VeryLazy",
  config = function()
    require('project_nvim').setup {
      detection_methods = { "pattern" },
      patterns = { ".git", ">Developer", "=nvim" },
    }
  end,
}
