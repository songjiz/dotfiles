command! MergeTab call s:merge_tab()
function! s:merge_tab() abort
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction
nnoremap <Plug>(MergeTab) :<C-U>call <SID>merge_tab()<CR>
