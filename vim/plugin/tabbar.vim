if exists('g:loaded_tabbar')
  finish
endif
let g:loaded_tabbar = 1

function! tabbar#merge() abort
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
nnoremap <Plug>(tabbar-merge) :<C-U>call tabbar#merge()<CR>
