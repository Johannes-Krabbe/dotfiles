-- Equivalent of your old `ensure_installed`
local ensure_installed = { "devicetree", "typescript", "javascript", "prisma", "tsx" }
local installed = require("nvim-treesitter.config").get_installed()
local to_install = vim.iter(ensure_installed)
    :filter(function(p) return not vim.tbl_contains(installed, p) end)
    :totable()
if #to_install > 0 then
    require("nvim-treesitter").install(to_install)
end

-- Start treesitter for any future buffer
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Catch buffers already loaded before this config ran
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) then
    vim.api.nvim_buf_call(buf, function()
      pcall(vim.treesitter.start)
    end)
  end
end
