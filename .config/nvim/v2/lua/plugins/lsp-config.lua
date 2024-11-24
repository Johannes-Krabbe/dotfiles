return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = { "lua_ls", "ts_ls", "html", "prismals", "eslint", "terraformls", "denols", "tailwindcss" }
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            --[[
            lspconfig.ts_ls.setup {
                capabilities = capabilities
            }
            ]]
            lspconfig.denols.setup {
                root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
                capabilities = capabilities
            }

            lspconfig.ts_ls.setup {
                root_dir = lspconfig.util.root_pattern("package.json"),
                single_file_support = false,
                capabilities = capabilities
            }

            lspconfig.prismals.setup({
                capabilities = capabilities,
                settings = {
                    prisma = {
                        formatting = {
                            indentWidth = 2 -- Set this to your desired tab width
                        }
                    }
                }
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.eslint.setup({
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
        end,
    },

}
