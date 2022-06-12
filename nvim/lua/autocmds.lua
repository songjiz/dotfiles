local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePost', {
  desc = 'Auto update packer plugins once the plugins.lua file is changed',
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerSync',
  group = augroup('Packer', { clear = true })
})

-- Deletes all trailing whitespaces
local trailingWhitespacesGrp = augroup('TrimTrailingWhitespaces', { clear = true })
autocmd('BufWritePre', {
  command = ':%s/\\s\\+$//e',
  group = trailingWhitespacesGrp,
  pattern = '*'
})

-- Diagnostic
local diagnosticGrp = augroup('Diagnostic', { clear = true })
autocmd({ 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
  group = diagnosticGrp,
  pattern = '*'
})

-- Toggle relativenumber
local lineNumberGrp = augroup('LineNumber', { clear = true })

autocmd({ 'BufEnter', 'FocusLost', 'InsertLeave', 'BufWinEnter' }, {
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = true
    end
  end,
  group = lineNumberGrp,
  pattern = '*'
})

autocmd({ 'BufLeave', 'FocusGained', 'InsertEnter', 'BufWinLeave' }, {
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = false
    end
  end,
  group = lineNumberGrp,
  pattern = '*'
})

-- Toggle cursor line
local cursorlineGrp = augroup('CursorLine', { clear = true })

autocmd({ 'BufEnter', 'FocusLost', 'InsertLeave', 'BufWinEnter' }, {
  callback = function()
    vim.o.cursorline = true
  end,
  group = cursorlineGrp,
  pattern = '*'
})

autocmd({ 'BufLeave', 'FocusGained', 'InsertEnter', 'BufWinLeave' }, {
  callback = function()
    vim.o.cursorline = false
  end,
  group = cursorlineGrp,
  pattern = '*'
})
-- Toggle highlight search---
local hlsGrp = augroup('HLS', { clear = true })

vim.api.nvim_create_autocmd('CmdlineEnter', {
  callback = function()
    vim.o.hlsearch = true
  end,
  group = hlsGrp,
  pattern = '/,?'
})

autocmd('CmdlineLeave', {
  callback = function()
    vim.o.hlsearch = false
  end,
  group = hlsGrp,
  pattern = '/,?'
})

-- Highlight on yank
local yankGrp = augroup('Yank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end,
  group = yankGrp,
  pattern = '*'
})

-- Automatically open quickfix window
local qfGrp = augroup('Qf', { clear = true })

autocmd('QuickFixCmdPost', {
  command = 'cwindow',
  group = qfGrp,
  pattern = '[^l]*',
})

autocmd('QuickFixCmdPost', {
  command = 'lwindow',
  group = qfGrp,
  pattern = 'l*',
})

-- Teminal
local termGrp = augroup('Terminal', { clear = true })

autocmd('TermOpen', {
  command = 'startinsert',
  group = termGrp,
  pattern = '*',
})

autocmd('BufEnter', {
  command = 'startinsert',
  group = termGrp,
  pattern = 'term://*',
})

autocmd('BufLeave', {
  command = 'stopinsert',
  group = termGrp,
  pattern = 'term://*',
})

autocmd('TermOpen', {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
    vim.opt_local.listchars = ''
    vim.opt_local.cursorline = false
    -- vim.opt_local.buflisted = false
  end,
  group = termGrp,
  pattern = '*',
})

