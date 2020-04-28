command! SynStack call s:SynStack()
function! s:SynStack() abort
  if !exists("*synstack")
    return
  endif
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
