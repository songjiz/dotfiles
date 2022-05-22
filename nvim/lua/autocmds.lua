vim.cmd [[
  function! ResizeWindows()
    let savetab = tabpagenr()
    tabdo wincmd =
    execute 'tabnext' savetab
  endfunction
]]

vim.cmd [[
  autocmd VimResized * call ResizeWindows()
]]

-- Deletes all trailing whitespaces
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    -- TODO: extact to function
    if not vim.o.binary and vim.o.filetype ~= 'diff' then
      local current_view = vim.fn.winsaveview()
      vim.cmd([[keeppatterns %s/\s\+$//e]])
      vim.fn.winrestview(current_view)
    end
  end,
  group = vim.api.nvim_create_augroup('TrimTrailingWhitespaces', { clear = true }),
  pattern = '*'
})

-- diagnostic
local _group = vim.api.nvim_create_augroup('Diagnostic', { clear = true })
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
  group = _group,
  pattern = '*'
})

-- Toggle relativenumber
local _group = vim.api.nvim_create_augroup('LineNumber', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusLost', 'InsertLeave', 'WinEnter' }, {
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = true
    end
  end,
  group = _group,
  pattern = '*'
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusGained', 'InsertEnter', 'WinLeave' }, {
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = false
    end
  end,
  group = _group,
  pattern = '*'
})

-- Toggle highlight search---
local _group = vim.api.nvim_create_augroup('Hls', { clear = true })

vim.api.nvim_create_autocmd('CmdlineEnter', {
  callback = function()
    vim.o.hlsearch = true
  end,
  group = _group,
  pattern = '/,?'
})

vim.api.nvim_create_autocmd('CmdlineLeave', {
  callback = function()
    vim.o.hlsearch = false
  end,
  group = _group,
  pattern = '/,?'
})

-- Highlight on yank
local _group = vim.api.nvim_create_augroup('Yank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = _group,
  pattern = '*'
})

-- Automatically open quickfix window
local _group = vim.api.nvim_create_augroup('Qf', { clear = true })
vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  command = 'cwindow',
  group = _group,
  pattern = '[^l]*',
})

vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  command = 'lwindow',
  group = _group,
  pattern = 'l*',
})

-- Teminal
local _group = vim.api.nvim_create_augroup('Terminal', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
    -- vim.opt_local.buflisted = false
    vim.cmd 'startinsert'
  end,
  group = _group,
  pattern = '*',
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if string.match(bufname, '^term:') then
      vim.cmd 'startinsert'
    end
  end,
  group = _group,
  pattern = '*',
})

