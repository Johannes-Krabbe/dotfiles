require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'ts_ls', 'html', 'prismals', 'terraformls', 'tailwindcss', 'biome' },
    automatic_enable = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('ts_ls', {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_markers = { 'package.json' },
    capabilities = capabilities,
})

vim.lsp.config('biome', {
    cmd = { 'biome', 'lsp-proxy' },
    root_markers = { 'biome.json' },
    capabilities = capabilities,
})

vim.lsp.config('tailwindcss', {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_markers = { 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts' },
    capabilities = capabilities,
})

vim.lsp.config('prismals', {
    cmd = { 'prisma-language-server', '--stdio' },
    filetypes = { 'prisma' },
    capabilities = capabilities,
    settings = {
        prisma = {
            formatting = { indentWidth = 1 },
        },
    },
})

vim.lsp.config('html', {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = { 'html' },
    capabilities = capabilities,
})

vim.lsp.config('terraformls', {
    cmd = { 'terraform-ls', 'serve' },
    filetypes = { 'terraform', 'terraform-vars' },
    capabilities = capabilities,
})

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim', 'require' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.enable({ 'ts_ls', 'biome', 'tailwindcss', 'prismals', 'html', 'terraformls', 'lua_ls' })
