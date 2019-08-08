command! -nargs=* ExpandTab call <SID>expand_tab(<q-args>)
function! s:expand_tab(size)
  if a:size
    setlocal expandtab
    execute 'setlocal shiftwidth='.a:size
    execute 'setlocal softtabstop='.a:size
    execute 'setlocal tabstop='.a:size
  else
    setlocal noexpandtab
    execute 'setlocal shiftwidth&vim'
    execute 'setlocal softtabstop&vim'
    execute 'setlocal tabstop&vim'
  endif
endfunction
