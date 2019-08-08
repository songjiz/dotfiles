command! GitRoot call git#root()
function! git#root()
  let l:root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' . l:root
    echo 'Changed directory to: ' . l:root
  endif
endfunction
