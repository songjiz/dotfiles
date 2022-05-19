vim.opt_local.relativenumber = false
vim.opt_local.wrap = false
vim.opt_local.number = true

vim.api.nvim_buf_set_keymap(0, 'n', 'gq', '<Cmd>bd<CR>', { silent = true })
