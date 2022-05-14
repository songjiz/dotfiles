vim.g.mapleader = ' '

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Swap ';' and ':'
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

vim.keymap.set('n', '<Leader>q', ':q<CR>')
vim.keymap.set('n', '<Leader>w', ':w<CR>')

-- telescope
vim.keymap.set('n', '<Leader><Space>', function()
  require('telescope.builtin').buffers()
end)

vim.keymap.set('n', '<Leader>ff', function()
  require('telescope.builtin').find_files { previewer = false }
end)

vim.keymap.set('n', '<Leader>bb', function()
  require('telescope.builtin').buffers { previewer = false }
end)
