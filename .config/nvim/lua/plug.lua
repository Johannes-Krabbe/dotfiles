-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- file browser
  use "nvim-telescope/telescope-file-browser.nvim"
  use {
    'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }
  }

  -- syntax highlighting (except nameserver things)
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- installs language server
  use 'williamboman/nvim-lsp-installer'

  -- configs language server
  use 'neovim/nvim-lspconfig'

  -- for searching files/ folders
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- leaderkey hints
  use "folke/which-key.nvim"

  -- bottom info line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- show open file tabs
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'nvim-tree/nvim-web-devicons' }

  -- warnings for wrong syntax
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  }

  -- git see changes on the side
  use 'lewis6991/gitsigns.nvim'

  -- gcc commenting
  use 'numToStr/Comment.nvim'

  -- restore sessions after closing
  use 'TC72/auto-session'

  -- clean scroll animation
  use 'karb94/neoscroll.nvim'

  -- hello I am neovim (greeter)
  use { 'goolord/alpha-nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

  -- autocompletion
  use { 'hrsh7th/nvim-cmp', requires = { 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lsp' } }

  -- github copilot
  use 'github/copilot.vim'

  -- code snippets
  use 'L3MON4D3/LuaSnip'

  -- icons in autocompletion
  use 'onsails/lspkind.nvim'

  -- loding indicator (mainly for language server)
  use 'j-hui/fidget.nvim'

  -- open terminal in editor
  use { "akinsho/toggleterm.nvim", tag = 'v2.*' }

  -- for prisma orm
  use("prisma/vim-prisma")


  -- in text color preview
  use 'norcalli/nvim-colorizer.lua'

  -- config for sxhkd (for linux)
  -- use 'baskerville/vim-sxhkdrc'

  -- language server for code actions -> formatter collection
  use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- file browser/ explorer
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

  -- file icons
  use 'nvim-tree/nvim-web-devicons'

  -- project manager
  use 'ahmedkhalf/project.nvim'

  -- md preview
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }

  -- C#
  -- use { 'OmniSharp/omnisharp-vim' }

  -- code actions in a window
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }

  -- color for warnings
  use 'folke/lsp-colors.nvim'

  -- highlighting of hovered word
  use 'RRethy/vim-illuminate'

  -- debug adaper protocol
  -- use 'mfussenegger/nvim-dap'

  -- flutter
  -- use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- svelte
  -- use { 'evanleck/vim-svelte' }

  -- color picker
  -- use { "ziontee113/color-picker.nvim" }

  -- dracula theme
  use { 'Mofiqul/dracula.nvim' }

  -- code actions
  use { "glepnir/lspsaga.nvim", requires = { { "nvim-tree/nvim-web-devicons" }, { "nvim-treesitter/nvim-treesitter" } }
  }
end)
