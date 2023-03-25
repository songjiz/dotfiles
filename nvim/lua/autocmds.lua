local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Deletes all trailing whitespaces
augroup("TrimTrailingWhitespaces", { clear = true })
autocmd("BufWritePre", { command = ":%s/\\s\\+$//e", pattern = "*" })

-- Diagnostic
augroup("Diagnostic", { clear = true })
autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
  pattern = "*"
})

-- Toggle relativenumber
local function show_relative_number()
  if vim.o.number then
    vim.o.relativenumber = true
  end
end

local function hide_relative_number()
  if vim.o.number then
    vim.o.relativenumber = false
  end
end

augroup("LineNumber", { clear = true })
autocmd({ "BufEnter", "FocusLost", "InsertLeave", "BufWinEnter" }, { callback = show_relative_number,  pattern = "*" })
autocmd({ "BufLeave", "FocusGained", "InsertEnter", "BufWinLeave" }, { callback = hide_relative_number, pattern = "*" })

-- Toggle cursor line
local function show_cursor_line()
  vim.o.cursorline = true
end

local function hide_cursor_line()
  vim.o.cursorline = false
end

augroup("CursorLine", { clear = true })
autocmd({ "BufEnter", "FocusLost", "InsertLeave", "BufWinEnter" }, { callback = show_cursor_line, pattern = "*" })
autocmd({ "BufLeave", "FocusGained", "InsertEnter", "BufWinLeave" }, { callback = hide_cursor_line, pattern = "*" })

-- Toggle highlight search---
local function enable_hlsearch()
  vim.o.hlsearch = true
end

local function disable_hlsearch()
  vim.o.hlsearch = false
end

augroup("HLS", { clear = true })
autocmd("CmdlineEnter", { callback = enable_hlsearch, pattern = "/,?" })
autocmd("CmdlineLeave", { callback = disable_hlsearch, pattern = "/,?" })

-- Highlight on yank
local function highlight_yank()
  vim.highlight.on_yank({ higroup = "IncSearch", timeout = "500" })
end
augroup("TextYank", { clear = true })
autocmd("TextYankPost", { callback = highlight_yank, pattern = "*" })

-- Automatically open quickfix window
augroup("Qf", { clear = true })
autocmd("QuickFixCmdPost", { command = "cwindow", pattern = "[^l]*" })
autocmd("QuickFixCmdPost", { command = "lwindow", pattern = "l*" })

-- Terminal
augroup("Terminal", { clear = true })
autocmd("TermOpen", { command = "startinsert", pattern = "*" })
autocmd("BufEnter", { command = "startinsert", pattern = "term://*" })
autocmd("BufLeave", { command = "stopinsert", pattern = "term://*" })
autocmd("TermOpen", {
  callback = function()
    local opt = vim.opt_local
    opt.number = false
    opt.relativenumber = false
    opt.signcolumn = "no"
    opt.listchars = ""
    opt.cursorline = false
    -- opt.buflisted = false
  end,
  pattern = "*",
})

local function set_terminal_keymaps(bufnr)
  local opts   = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap

  keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
  keymap.set("t", "jk", "<C-\\><C-n>", opts)
  keymap.set("t", "<C-h>", "<Cmd>wincmd h<CR>", opts)
  keymap.set("t", "<C-j>", "<Cmd>wincmd j<CR>", opts)
  keymap.set("t", "<C-k>", "<Cmd>wincmd k<CR>", opts)
  keymap.set("t", "<C-l>", "<Cmd>wincmd l<CR>", opts)
  keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", opts)
end

augroup("TerminalKeymaps", { clear = true })
autocmd("TermOpen", {
  callback = function()
    set_terminal_keymaps(vim.fn.bufnr())
  end,
  pattern = "term://*"
})
