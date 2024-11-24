-- required for renaming

local lspconfig = require'lspconfig'

-- Set global defaults for all servers
lspconfig.util.default_config = vim.tbl_extend(
  'force',
  lspconfig.util.default_config,
  {
    
  }
)
