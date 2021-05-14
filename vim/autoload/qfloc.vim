function! qfloc#cdelete() abort range
  let list = getqflist()
  let w:qfloc_qf_history = get(w:, 'qfloc_qf_history', [])
  call add(w:qfloc_qf_history, copy(list))
  unlet! list[a:firstline - 1 : a:lastline - 1]
  call setqflist(list, 'r')
  execute a:firstline
endfunction

function! qfloc#ldelete() abort range
  let list = getloclist(0)
  let w:qfloc_loc_history = get(w:, 'qfloc_loc_history', [])
  call add(w:qfloc_loc_history, copy(list))
  unlet! list[a:firstline - 1 : a:lastline - 1]
  call setloclist(0, list, 'r')
  execute a:firstline
endfunction

function! qfloc#cundo() abort
  let hist = get(w:, 'qfloc_qf_history', [])
  if !empty(hist)
    call setqflist(remove(hist, -1), 'r')
  endif
endfunction

function! qfloc#lundo() abort
  let hist = get(w:, 'qfloc_loc_history', [])
  if !empty(hist)
    call setloclist(0, remove(hist, -1), 'r')
  endif
endfunction

function! qfloc#cclear() abort
  let w:qfloc_qf_history = []
  call setqflist([], 'r')
endfunction

function! qfloc#lclear() abort
  let w:qfloc_loc_history = []
  call setloclist(0, [], 'r')
endfunction

function! qfloc#cyank(sp) range abort
  let filenames = map(getqflist()[a:firstline - 1 : a:lastline -1], { _, entry -> bufname(entry.bufnr) })
  call sort(filenames)
  call uniq(filenames)
  call setreg('*', join(filenames, a:sp))
endfunction

function! qfloc#lyank(sp) range abort
  let filenames = map(getloclist(0)[a:firstline - 1 : a:lastline -1], { _, entry -> bufname(entry.bufnr) })
  call sort(filenames)
  call uniq(filenames)
  call setreg('*', join(filenames, a:sp))
endfunction

function! s:is_qf() abort
  let l:wininfo = getwininfo(win_getid())[0]
  return l:wininfo.quickfix && !l:wininfo.loclist
endfunction
