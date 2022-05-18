-- Install packer automatically
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

local ok, packer = pcall(require, 'packer')
if not ok then return end

packer.init {
  display = {
    open_fn = function()
        return require('packer.util').float({ border = 'single' })
    end,
    prompt_border = 'single',
  },
  profile = {
    enable = true,
  },
  compile_on_sync = true,
}

packer.startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'config.lspconfig'
    end
  }
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
  use { 'onsails/lspkind.nvim' }
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require 'config.cmp'
    end,
  }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-omni', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
  use { 'L3MON4D3/LuaSnip', after = 'nvim-cmp' }
  use { "tpope/vim-fugitive", event = "User InGitRepo" }
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
    'windwp/nvim-autopairs',
    config = function()
      require 'config.autopairs'
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    config = function()
      require 'config.lualine'
    end
  }

  use 'f-person/git-blame.nvim'
  use 'machakann/vim-sandwich'
  use 'wellle/targets.vim'

  use 'folke/tokyonight.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'Mofiqul/vscode.nvim'

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

