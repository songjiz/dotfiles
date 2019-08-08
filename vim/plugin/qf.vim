" Toggle quickfix window.
command! QfToggle call qf#toggle()
function! qf#toggle() abort
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') ==# 'quickfix'
      cclose
      return
    endif
  endfor
  copen
endfunction

nnoremap <Plug>(QfToggle) :<C-U>call qf#toggle()<CR>

" function! qf#remove() abort
"   let curqfidx = line('.') - 1
"   let qfall = getqflist()
"   call remove(qfall, curqfidx)
"   call setqflist(qfall, 'r')
"   execute curqfidx + 1 . "cfirst"
"   copen
" endfunction
