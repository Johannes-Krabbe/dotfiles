return {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
        require("auto-session").setup {
            log_level = "error",
            auto_session_suppress_dirs = { "~/Developer", "~/.config" },
auto_restore_enabled = false
        }
    end
}
