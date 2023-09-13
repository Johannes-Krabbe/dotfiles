local nls = require("null-ls")
local b = nls.builtins;

nls.setup({
  b.formatting.gofmt,
  b.diagnostics.golangci_lint,
  b.formatting.rustfmt,
  sources = {
    b.formatting.prettierd,
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
