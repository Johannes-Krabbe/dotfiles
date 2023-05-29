local function close_buffers()
  local windows = vim.api.nvim_list_wins()
  for _, value in ipairs(windows) do
    local has_var, _ = pcall(vim.api.nvim_win_get_var, value, 'alpha')
    local has_var2, _ = pcall(vim.api.nvim_win_get_var, value, 'fidget')
    local has_var3, _ = pcall(vim.api.nvim_win_get_var, value, '__FLUTTER_DEV_LOG__')

    local config = vim.api.nvim_win_get_config(value)

    if has_var or has_var2 or has_var3 or config.relative ~= "" then
      vim.api.nvim_win_close(value, true)
    end
  end
end

require('auto-session').setup {
    log_level = 'error',
    auto_session_suppress_dirs = { '~/', '~/projects' },
    pre_save_cmds = { close_buffers, ':FidgetClose' },
    auto_save_enabled = true,
    auto_restore_enabled = true,
}
