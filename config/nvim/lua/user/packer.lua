local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    cmd("packadd packer.nvim")
  end
end

local function packer_startup()
  if packer == nil then
    packer = require("packer")
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
      { 'saadparwaiz1/cmp_luasnip' },

      -- Custom Stuff
      { "jose-elias-alvarez/nvim-lsp-ts-utils" },
    }
  }
  -- Treesitter --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Telescope --
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    }
  })

  -- Utilities --
  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- BarBar (buffer bar)
  -- use({
  --   "romgrk/barbar.nvim",
  --   requires = { 'kyazdani42/nvim-web-devicons' }
  -- })
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  -- GitSigns
  use({
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  })
  -- Trim Whitespace
  use({ 'echasnovski/mini.nvim', branch = 'stable' })
  require("user.plugins.mini").init()
  -- Themes --
  use({ "sainnhe/sonokai" })
  use({ "luisiacc/gruvbox-baby" })
  use({ "folke/tokyonight.nvim" })
  use({ "rebelot/kanagawa.nvim" })
  -- diagflow
  -- ttps://github.com/dgagn/diagflow.nvim
  use({
    'dgagn/diagflow.nvim',
    config = function()
      require('diagflow').setup()
    end
  })
end

packer_verify()
packer_startup()
