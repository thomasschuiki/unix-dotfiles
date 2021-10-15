local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
  if packer == nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Language Support --
    use 'neovim/nvim-lspconfig'
    use {
        'kabouzeid/nvim-lspinstall',
        requires = { 'neovim/nvim-lspconfig' }
    }
    use {
        'hrsh7th/nvim-compe',
        requires = { 'neovim/nvim-lspconfig' },
        config = function () 
          require'thomasschuiki.plugins.compe'.init()
        end
    }
    use {
        'hrsh7th/vim-vsnip',
        requires = { 'hrsh7th/nvim-compe' }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = { 'neovim/nvim-lspconfig' },
        run = ":TSUpdate",
        config = function () 
          require'thomasschuiki.plugins.treesitter'.init()
        end
    }

    -- Telescope --
--    use 'nvim-lua/plenary.nvim'
--    use 'nvim-lua/popup.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim'
        },
        config = function () 
          require'thomasschuiki.plugins.telescope'.init()
        end

    }
    -- Autoformatting
    use { 'sbdchd/neoformat' }

-- Utilities
    use {
    'hoob3rt/lualine.nvim',
    config = function ()
      require'thomasschuiki.plugins.lualine'.init()
    end
  }
    -- Themes --
    use { 'gruvbox-community/gruvbox',
        config = function () 
          require'thomasschuiki.plugins.gruvbox'.init()
        end
}
end

local function init()
  packer_verify()
  packer_startup()
end

return {
  init = init
}
