vim.cmd [[
  function! ResizeWindows()
    let savetab = tabpagenr()
    tabdo wincmd =
    execute 'tabnext' savetab
  endfunction
]]

vim.cmd [[
  autocmd InsertEnter * setlocal nolist
  autocmd InsertLeave * setlocal list nopaste

  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set relativenumber   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set norelativenumber | endif

  autocmd BufWritePre * :%s/\s\+$//e

  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch

  autocmd VimResized * call ResizeWindows()

  autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus=false })
]]
