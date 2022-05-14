local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

local packer = require 'packer'

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

return packer
