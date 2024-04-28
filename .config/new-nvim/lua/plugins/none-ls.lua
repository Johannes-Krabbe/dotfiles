return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.prisma_format,
                null_ls.builtins.diagnostics.eslint_d.with({
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
    end,
}
