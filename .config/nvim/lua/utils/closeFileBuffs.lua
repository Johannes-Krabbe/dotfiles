function Close_file_buffers()
  for _, bufnr in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
    local bufname = vim.fn.bufname(bufnr.bufnr)
    local buftype = vim.fn.getbufvar(bufnr.bufnr, '&buftype')
    if buftype ~= 'terminal' and buftype ~= 'nofile' and buftype ~= 'quickfix' and buftype ~= 'help' and bufname ~= '' then
      vim.api.nvim_buf_delete(bufnr.bufnr, { force = true })
    end
  end
end

vim.cmd("command! CloseFileBuffers lua Close_file_buffers()")

function Close_file_buffers_except_current()
  local current_bufnr = vim.api.nvim_get_current_buf()
  for _, bufnr in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
    local bufname = vim.fn.bufname(bufnr.bufnr)
    local buftype = vim.fn.getbufvar(bufnr.bufnr, '&buftype')
    if bufnr.bufnr ~= current_bufnr and buftype ~= 'terminal' and buftype ~= 'nofile' and buftype ~= 'quickfix' and buftype ~= 'help' and bufname ~= '' then
      vim.api.nvim_buf_delete(bufnr.bufnr, { force = true })
    end
  end
end

vim.cmd("command! CloseFileBuffersExceptCurrent lua Close_file_buffers_except_current()")
