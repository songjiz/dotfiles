if exists('g:loaded_TabMergePlugin')
  finish
endif
let g:loaded_TabMergePlugin = 1

command! TabMerge call s:TabMerge()
function! s:TabMerge() abort
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

nnoremap <Plug>(tab-merge) :<C-U>call <SID>TabMerge()<CR>
