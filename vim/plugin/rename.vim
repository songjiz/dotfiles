command! Rename call <SID>Rename()
function! s:Rename() abort
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
nnoremap <Plug>(rename-buf) :<C-U>call <SID>Rename()<CR>
