vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Wrapped lines goes down/up to next row, rather than next line in file.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '!', ':!')

-- u is undo, U is redo
vim.keymap.set('n', 'U', '<C-r>')

-- Quickly open configuration file
vim.keymap.set('n', '<Leader>ec', ':split $MYVIMRC<CR>')

-- Save file as root user.
vim.keymap.set('c', 'w!!', '!sudo tee % > /dev/null<CR>')

-- Center screen
vim.keymap.set('n', ']q', ':cnext<CR>zz')
vim.keymap.set('n', '[q', ':cprev<CR>zz')
vim.keymap.set('n', ']l', ':lnext<CR>zz')
vim.keymap.set('n', '[l', ':lprev<CR>zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '*', '*zzzv')
vim.keymap.set('n', '#', '#zzzv')
vim.keymap.set('n', 'g*', 'g*zzzv')
vim.keymap.set('n', 'g#', 'g#zzzv')
vim.keymap.set('n', 'G', 'Gzzzv')
vim.keymap.set('n', '<C-o>', '<C-o>zz')

-- Move to start of the line in insert mode
vim.keymap.set('i', '<C-a>', '<C-o>^')
-- Move to end of the line in insert mode
vim.keymap.set('i', '<C-e>', '<C-o>$')

vim.keymap.set('i', '<C-f>', '<C-o><Right>')
vim.keymap.set('i', '<C-b>', '<C-o><Left>')
vim.keymap.set('i', '<C-d>', '<Del>')

vim.keymap.set('c', '<C-j>', '<Down>')
vim.keymap.set('c', '<C-k>', '<Up>')
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')
vim.keymap.set('c', '<C-p>', '<Up>')
vim.keymap.set('c', '<C-n>', '<Down>')
vim.keymap.set('c', '<C-f>', '<Right>')
vim.keymap.set('c', '<C-b>', '<Left>')
vim.keymap.set('c', '<C-d>', '<Del>')
vim.keymap.set('c', '<C-h>', '<Backspace>')

 -- gf and gF open in vertical panel
-- vim.keymap.set('n', 'gf', '<C-w>vgf')
-- vim.keymap.set('v', 'gf', '<C-w>vgf')
-- vim.keymap.set('n', 'gF', '<C-w>vgF')
-- vim.keymap.set('v', 'gf', '<C-w>vgF')

-- Toggle between last open buffers
vim.keymap.set('n', '<Leader><Space>', '<C-^>')

-- qq to record, Q to replay
vim.keymap.set('n', 'Q', '@q')

-- Swap ';' and ':'
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

vim.keymap.set('n', '<Leader>q', ':q<CR>')
vim.keymap.set('n', '<Leader>w', ':w<CR>')

vim.api.nvim_create_user_command('FuckGFW', ':tabe ~/.config/Surge/Documents/Default.conf', { bang = true })

-- telescope
vim.keymap.set('n', '<Leader>ff', function()
  require('telescope.builtin').find_files { previewer = false }
end)

vim.keymap.set('n', '<Leader>bb', function()
  require('telescope.builtin').buffers { previewer = false }
end)

vim.keymap.set('n', '<Leader>\\\\', function()
  require('telescope.builtin').live_grep()
end)

-- diagnostic
vim.keymap.set('n', '<Leader>dn', function()
  vim.diagnostic.goto_next()
end)

vim.keymap.set('n', '<Leader>dp', function()
  vim.diagnostic.goto_prev()
end)

vim.keymap.set('n', '<Leader>dq', function()
  vim.diagnostic.setqflist()
end)

vim.keymap.set('n', '<Leader>dl', function()
  vim.diagnostic.setloclist()
end)

vim.keymap.set('n', '<Leader>df', function()
  vim.diagnostic.open_float()
end)
