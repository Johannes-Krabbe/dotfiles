return {
  "jose-elias-alvarez/null-ls.nvim",
  requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  lazy = false,
  config = function()
    local nls = require("null-ls")
    local b = nls.builtins;

    nls.setup({
      sources = {
        b.formatting.gofmt,
        b.diagnostics.golangci_lint,
        b.formatting.rustfmt,
        b.formatting.lua_format,
        b.formatting.prettierd,
        b.formatting.prismaFmt,
        b.diagnostics.eslint_d.with({
          -- Set condition for eslint to run only if .eslintrc file exists in the root directory
          condition = function(utils)
            return utils.root_has_file({
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json"
            })
          end,
        }),
      },
    })
  end
}
