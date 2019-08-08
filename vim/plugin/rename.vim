command! RenameBuffer call s:rename_buffer()
function! s:rename_buffer() abort
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
nnoremap <Plug>(RenameBuffer) :<C-U>call <SID>rename_buffer()<CR>
