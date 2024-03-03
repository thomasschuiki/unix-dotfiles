local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    }
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' },   -- Optional
      { 'hrsh7th/cmp-path' },     -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
      { 'saadparwaiz1/cmp_luasnip' },

      -- Custom Stuff
      { "jose-elias-alvarez/nvim-lsp-ts-utils" },
    }
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
  -- },
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = "*",
  --   dependencies = 'kyazdani42/nvim-web-devicons'
  -- },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup({
        numhl = true,
        word_diff = true,
      })
    end
  },

  {
    'echasnovski/mini.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'dgagn/diagflow.nvim',
    config = function()
      require('diagflow').setup()
    end
  },
  "rebelot/kanagawa.nvim",
}
local opts = {}
require("lazy").setup(plugins, opts)
