local ok, nvimtree = pcall(require, "nvim-tree")

if not ok then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup()

local keymap = vim.keymap

keymap.set("n", "<Leader>nn", "<Cmd>NvimTreeToggle<CR>")
keymap.set("n", "<Leader>nm", "<Cmd>NvimTreeFindFileToggle<CR>")
