local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = ' ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>la', vim.lsp.buf.code_action, 'Code Action')
  nmap('<leader>ld', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
  nmap('<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
  nmap('<leader>li', ':LspInstall<cr>', 'Install Lsp Server')
  nmap('<leader>lm', ':LspInstallInfo<cr>', 'Manage Lsp Servers')

  nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
  nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
  nmap('gdt', vim.lsp.buf.type_definition, 'Type Definition')

  nmap('gi', vim.lsp.buf.implementation, 'Goto Implementation')
  nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.format or vim.lsp.buf.formatting,
    { desc = 'Format current buffer with LSP' })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 'tailwindcss',
local servers = { 'pyright', 'tsserver', 'gopls', 'lua_ls' }

require('nvim-lsp-installer').setup {
  ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require('lspconfig').omnisharp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  use_mono = true
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
    },
  },
}

require("rust-tools").setup {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}
