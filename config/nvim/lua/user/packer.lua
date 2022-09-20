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

	-- Language Support --
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/nvim-lsp-installer",
		requires = { "neovim/nvim-lspconfig" },
	})
	use({
		"jose-elias-alvarez/nvim-lsp-ts-utils",
		requires = { "neovim/nvim-lspconfig" },
	})

	-- autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = { "neovim/nvim-lspconfig" },
	})
	use({
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		requires = { "hrsh7th/nvim-cmp" },
	})
	use({
		"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
		requires = { "hrsh7th/nvim-cmp" },
	})
	use({
		"L3MON4D3/LuaSnip", -- Snippets plugin
		requires = { "hrsh7th/nvim-cmp" },
	})

	-- Treesitter --
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = { "neovim/nvim-lspconfig" },
		run = ":TSUpdate",
	})

	-- Telescope --
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
		},
		config = function()
			require("user.plugins.telescope").init()
		end,
	})

  -- Utilities --
  -- Lualine
	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("user.plugins.lualine").init()
		end,
	})
  -- BarBar (buffer bar)
	use({
    "romgrk/barbar.nvim",
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  })
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
  use({ 'echasnovski/mini.nvim', branch = 'stable'})
	require("user.plugins.mini").init()
	-- Themes --
	use({"sainnhe/sonokai"})
	use({"luisiacc/gruvbox-baby"})
	use({"folke/tokyonight.nvim"})

  -- Rust
  -- use({"simrat39/rust-tools.nvim"})
end

packer_verify()
packer_startup()

