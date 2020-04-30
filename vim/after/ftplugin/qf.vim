setlocal norelativenumber
setlocal nowrap
setlocal number

nnoremap <silent> <buffer> p <CR>zz<C-w>p
nnoremap <silent> <buffer> o <CR>zz<C-w>p
nnoremap <silent> <buffer> t <C-w><CR><C-w>T
nnoremap <silent> <buffer> gq :bd<CR>

if !empty(getloclist(0))
  nnoremap <silent> <buffer> O <CR>zz:lclose<CR>
  nnoremap <silent> <buffer> dd :call qfloc#ldelete()<CR>
  vnoremap <silent> <buffer> d  :call qfloc#ldelete()<CR>
  nnoremap <silent> <buffer> cc :call qlloc#lclear()<CR>
  nnoremap <silent> <buffer> u :call qfloc#lundo()<CR>
  nnoremap <silent> <buffer> yJ :call qfloc#lyank(' ')<CR>
  vnoremap <silent> <buffer> yJ :call qfloc#lyank(' ')<CR>
  nnoremap <silent> <buffer> yj :call qfloc#lyank("\n")<CR>
  vnoremap <silent> <buffer> yj :call qfloc#lyank("\n")<CR>
else
  nnoremap <silent> <buffer> O <CR>zz:cclose<CR>
  nnoremap <silent> <buffer> dd :call qfloc#cdelete()<CR>
  vnoremap <silent> <buffer> d  :call qfloc#cdelete()<CR>
  nnoremap <silent> <buffer> cc :call qfloc#cclear()<CR>
  nnoremap <silent> <buffer> u :call qfloc#cundo()<CR>
  nnoremap <silent> <buffer> yJ :call qfloc#cyank(' ')<CR>
  vnoremap <silent> <buffer> yJ :call qfloc#cyank(' ')<CR>
  nnoremap <silent> <buffer> yj :call qfloc#cyank("\n")<CR>
  vnoremap <silent> <buffer> yj :call qfloc#cyank("\n")<CR>
endif


