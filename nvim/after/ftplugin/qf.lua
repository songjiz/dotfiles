local opt = vim.opt_local

opt.number = true
opt.relativenumber = false
opt.wrap = false

vim.keymap.set("n", "gq", "<Cmd>bd<CR>", { silent = true, buffer = 0 })
