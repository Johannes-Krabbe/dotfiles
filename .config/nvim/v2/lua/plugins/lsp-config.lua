return {
    {
        "williamboman/mason.nvim",
        version = "1.*",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version = "1.*",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "html", "prismals", "eslint", "terraformls", "denols", "tailwindcss", "gopls", "pylsp", "biome" },
                automatic_enable = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.denols.setup({
                root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
                capabilities = capabilities
            })

            lspconfig.ts_ls.setup({
                root_dir = lspconfig.util.root_pattern("package.json"),
                single_file_support = false,
                capabilities = capabilities
            })

            lspconfig.biome.setup({
                root_dir = lspconfig.util.root_pattern("biome.json"),
                capabilities = capabilities
            })

            lspconfig.prismals.setup({
                capabilities = capabilities,
                settings = {
                    prisma = {
                        formatting = {
                            indentWidth = 1
                        }
                    }
                }
            })

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            lspconfig.eslint.setup({
                root_dir = lspconfig.util.root_pattern("eslintrc", ".eslintrc", ".eslintrc.js", ".eslintrc.cjs",
                    ".eslintrc.json"),
                capabilities = capabilities
            })

            lspconfig.terraformls.setup({
                capabilities = capabilities
            })

            lspconfig.html.setup({
                capabilities = capabilities
            })

            lspconfig.tailwindcss.setup({
                capabilities = capabilities
            })

            lspconfig.gopls.setup({
                capabilities = capabilities
            })

            lspconfig.pylsp.setup({
                capabilities = capabilities
            })
        end,
    },
}
