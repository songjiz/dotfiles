local ok, packer = pcall(require, 'config.packer')

if not ok then
  return
end

packer.startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require 'config.telescope'
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      require 'config.nvim-tree'
    end
  }
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require 'config.cmp'
    end,
  }
  use {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp'
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require 'config.gitsigns'
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require 'config.comment'
    end
  }
  use { 
    'nvim-lualine/lualine.nvim',
    config = function()
      require 'config.lualine'
    end
  }
  use 'machakann/vim-sandwich'
  use { 'folke/tokyonight.nvim' }
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
