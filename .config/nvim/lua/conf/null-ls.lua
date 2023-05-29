local nls = require("null-ls")
-- local command_resolver = require("null-ls.helpers.command_resolver")
local b = nls.builtins;

nls.setup({
  sources = {
    b.formatting.gofmt,
    b.diagnostics.golangci_lint,
    b.formatting.prettierd

    --[[
    b.formatting.rome.with({
      condition = function(utils)
        return utils.root_has_file("rome.json")
      end,
    }),

      ]]


    --[[
    .with({
      condition = function(utils)
        return not utils.root_has_file("rome.json")
      end,

    }),
      ]],

    b.diagnostics.eslint.with({
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
