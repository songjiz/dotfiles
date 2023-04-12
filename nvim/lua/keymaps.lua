-- Set leader key to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Wrapped lines goes down/up to next row, rather than next line in file.
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap.set("n", "!", ":!")

-- u is undo, U is redo
keymap.set("n", "U", "<C-r>")

-- Quickly open configuration file
keymap.set("n", "<Leader>ec", "<Cmd>split $MYVIMRC<CR>")

-- Save file as root user.
keymap.set("c", "w!!", "!sudo tee % > /dev/null<CR>")

-- Center screen
keymap.set("n", "]q", "<Cmd>cnext<CR>zz")
keymap.set("n", "[q", "<Cmd>cprev<CR>zz")
keymap.set("n", "]l", "<Cmd>lnext<CR>zz")
keymap.set("n", "[l", "<Cmd>lprev<CR>zz")
keymap.set("n", "}", "}zz")
keymap.set("n", "{", "{zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "*", "*zzzv")
keymap.set("n", "#", "#zzzv")
keymap.set("n", "g*", "g*zzzv")
keymap.set("n", "g#", "g#zzzv")
keymap.set("n", "G", "Gzzzv")
keymap.set("n", "<C-o>", "<C-o>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-f>", "<C-f>zz")
keymap.set("n", "<C-b>", "<C-b>zz")

-- <C-c> to escape in insert mode
keymap.set("i", "<C-c>", "<Esc>")

-- Move to start of the line in insert mode
keymap.set("i", "<C-a>", "<C-o>^")
-- Move to end of the line in insert mode
keymap.set("i", "<C-e>", "<C-o>$")

keymap.set("i", "<C-f>", "<C-o><Right>")
keymap.set("i", "<C-b>", "<C-o><Left>")
keymap.set("i", "<C-d>", "<Del>")

-- Move line up / down
keymap.set("i", "<C-j>", "<Esc>:move .+1<CR>==gi")
keymap.set("i", "<C-k>", "<Esc>:move .-2<CR>==gi")
-- Move selected text up / down
keymap.set("v", "<C-j>", ":move '>+1<CR>==gv")
keymap.set("v", "<C-k>", ":move '<-2<CR>==gv")

keymap.set("c", "<C-j>", "<Down>")
keymap.set("c", "<C-k>", "<Up>")
keymap.set("c", "<C-a>", "<Home>")
keymap.set("c", "<C-e>", "<End>")
keymap.set("c", "<C-p>", "<Up>")
keymap.set("c", "<C-n>", "<Down>")
keymap.set("c", "<C-f>", "<Right>")
keymap.set("c", "<C-b>", "<Left>")
keymap.set("c", "<C-d>", "<Del>")
keymap.set("c", "<C-h>", "<Backspace>")

-- Window
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Toggle between last open buffers
keymap.set("n", "<Leader><Space>", "<C-^>")

-- qq to record, Q to replay
keymap.set("n", "Q", "@q")

-- Swap ";" and ":"
keymap.set("n", ";", ":")
keymap.set("n", ":", ";")

keymap.set("n", "<Leader>q", "<Cmd>q<CR>")
keymap.set("n", "<Leader>w", "<Cmd>w<CR>")

vim.api.nvim_create_user_command("FuckGFW", "tabe ~/.config/Surge/Documents/Default.conf", { bang = true })

-- Diagnostic
keymap.set("n", "<Leader>dn", function()
  vim.diagnostic.goto_next()
end)

keymap.set("n", "<Leader>dp", function()
  vim.diagnostic.goto_prev()
end)

keymap.set("n", "<Leader>dq", function()
  vim.diagnostic.setqflist()
end)

keymap.set("n", "<Leader>dl", function()
  vim.diagnostic.setloclist()
end)

keymap.set("n", "<Leader>df", function()
  vim.diagnostic.open_float()
end)

