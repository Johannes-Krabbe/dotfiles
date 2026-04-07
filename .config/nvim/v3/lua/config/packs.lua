vim.pack.add({
    -- LSP
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',

    -- Completion
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/saadparwaiz1/cmp_luasnip',
    'https://github.com/rafamadriz/friendly-snippets',

    -- Telescope
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-telescope/telescope-ui-select.nvim',

    -- File explorer
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/nvim-tree/nvim-web-devicons',

    -- Navigation
    'https://github.com/ThePrimeagen/harpoon',

    -- Colorscheme
    'https://github.com/vague2k/vague.nvim',

    -- UI
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/rcarriga/nvim-notify',
    'https://github.com/RRethy/vim-illuminate',

    -- Git
    'https://github.com/lewis6991/gitsigns.nvim',
    'https://github.com/f-person/git-blame.nvim',

    -- other
    'https://github.com/stevearc/conform.nvim',
    'https://github.com/neovim-treesitter/nvim-treesitter',
})

require('plugins.lsp')
require('plugins.completions')
require('plugins.telescope')
require('plugins.nvim-tree')
require('plugins.harpoon')
require('plugins.lualine')
require('plugins.notify')
require('plugins.illuminate')
require('plugins.gitsigns')
require('plugins.gitblame')
require('plugins.treesitter')
