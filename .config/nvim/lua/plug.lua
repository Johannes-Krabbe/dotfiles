-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- ====================
  -- AESTHETICS
  -- ====================

  -- Bottom info line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Show open file tabs
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons' }

  -- File icons
  use 'kyazdani42/nvim-web-devicons'

  -- Some color scheme other then default
  use("arcticicestudio/nord-vim")

  -- Dracula theme
  use { 'Mofiqul/dracula.nvim' }

  -- Transpenency
  use { "xiyaowong/transparent.nvim" }

  -- ====================
  -- FILE MANAGEMENT
  -- ====================

  -- File browser/ explorer
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

  -- File browser
  use "nvim-telescope/telescope-file-browser.nvim"
  use {
    'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }
  }

  -- For searching files/ folders
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Restore sessions after closing
  use 'TC72/auto-session'

  -- Project manager
  use 'ahmedkhalf/project.nvim'

  -- ====================
  -- NAVIGATION AND UX
  -- ====================

  -- Leaderkey hints
  use "folke/which-key.nvim"

  -- Clean scroll animation
  use 'karb94/neoscroll.nvim'

  -- Hello I am neovim (greeter)
  use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

  -- Open terminal in editor
  use { "akinsho/toggleterm.nvim", tag = 'v2.*' }

  -- Highlighting of hovered word
  use 'RRethy/vim-illuminate'

  -- ====================
  -- LANGUAGE SUPPORT
  -- ====================

  -- Syntax highlighting (except nameserver things)
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Installs language server
  use 'williamboman/nvim-lsp-installer'

  -- Configs language server
  use 'neovim/nvim-lspconfig'

  -- Language server for code actions -> formatter collection
  use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Code actions
  use { "glepnir/lspsaga.nvim", requires = { { "kyazdani42/nvim-web-devicons" }, { "nvim-treesitter/nvim-treesitter" } }
  }

  -- Code actions in a window
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }

  -- Adds extra functionality over rust analyzer
  use {
    'simrat39/rust-tools.nvim',
    requires = {
      { 'neovim/nvim-lspconfig' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'mfussenegger/nvim-dap' }
    }
  }

  -- For prisma orm
  use("prisma/vim-prisma")

  -- ====================
  -- AUTOCOMPLETION AND SNIPPETS
  -- ====================

  -- Autocompletion framework
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-vsnip', 'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer' } }

  -- Snippet engine
  use 'hrsh7th/vim-vsnip'

  -- Code snippets
  use 'L3MON4D3/LuaSnip'

  -- Icons in autocompletion
  use 'onsails/lspkind.nvim'

  -- Github copilot
  use 'github/copilot.vim'

  -- ====================
  -- DEBUGGING AND ERROR HANDLING
  -- ====================

  -- Warnings for wrong syntax
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- Color for warnings
  use 'folke/lsp-colors.nvim'

  -- Debug adaper protocol
  -- use 'mfussenegger/nvim-dap'

  -- ====================
  -- GIT AND VERSION CONTROL
  -- ====================

  -- Git see changes on the side
  use 'lewis6991/gitsigns.nvim'

  -- ====================
  -- UTILITY PLUGINS
  -- ====================

  -- Gcc commenting
  use 'numToStr/Comment.nvim'

  -- In text color preview
  use 'norcalli/nvim-colorizer.lua'

  -- Loding indicator (mainly for language server)
  use {
    "j-hui/fidget.nvim",
    tag = 'legacy',
    config = function()
      require("fidget").setup()
    end
  }

  -- Md preview
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }

  -- Config for sxhkd (for linux)
  -- use 'baskerville/vim-sxhkdrc'

  -- Flutter
  -- use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Svelte
  -- use { 'evanleck/vim-svelte' }

  -- Color picker
  -- use { "ziontee113/color-picker.nvim" }

  -- C#
  -- use { 'OmniSharp/omnisharp-vim' }
end)
