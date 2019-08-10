setlocal norelativenumber
setlocal nowrap
setlocal number

nnoremap <silent> <buffer> p <CR>zz<C-w>p
nnoremap <silent> <buffer> o <CR>zz<C-w>p
nnoremap <silent> <buffer> t <C-w><CR><C-w>T

if !empty(getloclist(0))
  nnoremap <silent> <buffer> O <CR>:lclose<CR>
  nnoremap <silent> <buffer> dd :call qfloc#ldelete()<CR>
  vnoremap <silent> <buffer> dd :call qfloc#ldelete()<CR>
  vnoremap <silent> <buffer> d  :call qfloc#ldelete()<CR>
  nnoremap <silent> <buffer> \c :call qlloc#lclear()<CR>
  nnoremap <silent> <buffer> u :call qfloc#lundo()<CR>
else
  nnoremap <silent> <buffer> O <CR>:cclose<CR>
  nnoremap <silent> <buffer> dd :call qfloc#cdelete()<CR>
  vnoremap <silent> <buffer> dd :call qfloc#cdelete()<CR>
  vnoremap <silent> <buffer> d  :call qfloc#cdelete()<CR>
  nnoremap <silent> <buffer> \c :call qfloc#cclear()<CR>
  nnoremap <silent> <buffer> u :call qfloc#cundo()<CR>
endif


