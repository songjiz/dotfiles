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
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-tree.lua",
  "neovim/nvim-lspconfig",
  "onsails/lspkind.nvim",
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-omni",
  "hrsh7th/cmp-nvim-lua",
  "L3MON4D3/LuaSnip",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "windwp/nvim-autopairs",
  "numToStr/Comment.nvim",
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy" },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  "folke/tokyonight.nvim",
  "Mofiqul/vscode.nvim",
  { "projekt0n/github-nvim-theme", tag = "v0.0.7" }
}

local opts = {}

require("lazy").setup(plugins, opts)
