local nls = require("null-ls")
local b = nls.builtins;

nls.setup({
  b.formatting.gofmt,
  b.diagnostics.golangci_lint,
  b.formatting.rustfmt,
  sources = {
    b.formatting.prettierd,
    b.diagnostics.markuplint,
    b.formatting.markuplint,
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


-- local command_resolver = require("null-ls.helpers.command_resolver")
--[[
    b.formatting.rome.with({
      condition = function(utils)
        return utils.root_has_file("rome.json")
      end,
    }),


    b.formatting.prettierd
    .with({
      condition = function(utils)
        return not utils.root_has_file("rome.json")
      end,

    }),

      ]]
