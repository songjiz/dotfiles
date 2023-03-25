local nvim_tree_available, nvimtree = pcall(require, "nvim-tree")

if not nvim_tree_available then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        git = false
      }
    }
  }
})

local keymap = vim.keymap

keymap.set("n", "<Leader>nn", "<Cmd>NvimTreeToggle<CR>")
keymap.set("n", "<Leader>nm", "<Cmd>NvimTreeFindFileToggle<CR>")
