if exists('g:qf_loaded') || &compatible
  finish
endif
let g:qf_loaded = 1

let s:cpoptions = &cpoptions
set cpoptions&vim

function! s:delete(from, to) abort
  let l:type  = s:is_qf() ? 'qf' : 'location'
  let l:list  = l:type == 'qf' ? getqflist() : getloclist(0)
  let l:history = get(b:, 'qf_history', [])
  call add(l:history, copy(l:list))
  let b:qf_history = l:history
  echom a:from . ' | ' . a:to
  unlet! l:list[a:from - 1 : a:to - 1]
  if l:type == 'qf'
    call setqflist(l:list, 'r')
    if empty(l:list)
      execute 'cclose'
    else
      execute 'cc ' . a:from
    endif
  else
    call setloclist(0, l:list, 'r')
    if empty(l:list)
      execute 'lclose'
    else
      execute 'll ' . a:from
    endif
  endif

  execute "normal \<C-w>\<C-p>"
endfunction

function! qf#delete() range
  call s:delete(a:firstline, a:lastline)
endfunction

function! qf#clear() abort
  if s:is_qf()
    call setqflist([], 'r')
    execute 'cclose'
  else
    call setloclist(0, [], 'r')
    execute 'lclose'
  endif
endfunction

function! qf#undo() abort
  let l:history = get(b:, 'qf_history', [])
  if !empty(l:history)
    if s:is_qf()
      call setqflist(remove(l:history, -1), 'r')
    else
      call setloclist(0, remove(l:history, -1), 'r')
    endif
  endif
endfunction

function! s:is_qf() abort
  let l:wininfo = getwininfo(win_getid())[0]
  return l:wininfo.quickfix && !l:wininfo.loclist
endfunction

let &cpoptions = s:cpoptions
unlet s:cpoptions
