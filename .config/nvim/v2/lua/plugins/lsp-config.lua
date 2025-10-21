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
                ensure_installed = { "lua_ls", "ts_ls", "html", "prismals", "eslint", "terraformls", "denols", "tailwindcss", "gopls", "pylsp", "biome", "templ" },
                automatic_enable = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- Conditional setup for Deno/TypeScript LSPs to avoid conflicts
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
                callback = function(args)
                    local root = vim.fs.root(args.buf, { 'deno.json', 'deno.jsonc' })
                    if root then
                        vim.lsp.enable('denols', args.buf)
                    else
                        local ts_root = vim.fs.root(args.buf, { 'package.json' })
                        if ts_root then
                            vim.lsp.enable('ts_ls', args.buf)
                        end
                    end
                end,
            })

            vim.lsp.config('denols', {
                cmd = { 'deno', 'lsp' },
                filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
                root_markers = { 'deno.json', 'deno.jsonc' },
                capabilities = capabilities
            })

            vim.lsp.config('ts_ls', {
                cmd = { 'typescript-language-server', '--stdio' },
                filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
                root_markers = { 'package.json' },
                capabilities = capabilities
            })

            vim.lsp.config('biome', {
                cmd = { 'biome', 'lsp-proxy' },
                root_markers = { 'biome.json' },
                capabilities = capabilities
            })

            vim.lsp.config('prismals', {
                cmd = { 'prisma-language-server', '--stdio' },
                filetypes = { 'prisma' },
                capabilities = capabilities,
                settings = {
                    prisma = {
                        formatting = {
                            indentWidth = 1
                        }
                    }
                }
            })

            vim.lsp.config('lua_ls', {
                cmd = { 'lua-language-server' },
                filetypes = { 'lua' },
                root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            vim.lsp.config('eslint', {
                cmd = { 'vscode-eslint-language-server', '--stdio' },
                filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
                root_markers = { 'eslintrc', '.eslintrc', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.json' },
                capabilities = capabilities
            })

            vim.lsp.config('terraformls', {
                cmd = { 'terraform-ls', 'serve' },
                filetypes = { 'terraform', 'terraform-vars' },
                capabilities = capabilities
            })

            vim.lsp.config('html', {
                cmd = { 'vscode-html-language-server', '--stdio' },
                filetypes = { 'html' },
                capabilities = capabilities
            })

            vim.lsp.config('tailwindcss', {
                cmd = { 'tailwindcss-language-server', '--stdio' },
                filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
                root_markers = { 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts' },
                capabilities = capabilities
            })

            vim.lsp.config('gopls', {
                cmd = { 'gopls' },
                filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
                root_markers = { 'go.work', 'go.mod', '.git' },
                capabilities = capabilities
            })

            vim.lsp.config('pylsp', {
                cmd = { 'pylsp' },
                filetypes = { 'python' },
                capabilities = capabilities
            })

            vim.lsp.config('templ', {
                cmd = { 'templ', 'lsp' },
                filetypes = { 'templ' },
                capabilities = capabilities
            })

            -- Enable LSP servers (denols and ts_ls are handled via autocmd above)
            vim.lsp.enable({ 'biome', 'prismals', 'lua_ls', 'eslint', 'terraformls', 'html', 'tailwindcss', 'gopls', 'pylsp', 'templ' })
        end,
    },
}
