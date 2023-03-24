local opt = vim.opt_local

opt.suffixesadd:prepend(".lua")
opt.path:prepend(vim.fn.stdpath("config") .. "/lua")
