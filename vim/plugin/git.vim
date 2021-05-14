command! GitRoot call <SID>GitRoot()
function! s:GitRoot() abort
  let l:root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echohl ErrorMsg
    echom 'Not in git repo'
    echohl None
  else
    execute 'lcd' . l:root
    echo 'Changed directory to: ' . l:root
  endif
endfunction
nnoremap <silent> <Plug>(git-root) :<C-U>call <SID>GitRoot()<CR>
