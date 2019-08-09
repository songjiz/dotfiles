setlocal norelativenumber
setlocal nowrap
setlocal number

nnoremap <silent> <buffer> dd :call qf#delete()<CR>
vnoremap <silent> <buffer> dd :call qf#delete()<CR>
vnoremap <silent> <buffer> d  :call qf#delete()<CR>
nnoremap <silent> <buffer> \c :call qf#clear()<CR>
nnoremap <silent> <buffer> p <CR>zz<C-w>p
nnoremap <silent> <buffer> o <CR>zz<C-w>p
nnoremap <silent> <buffer> t <C-w><CR><C-w>T
nnoremap <silent> <buffer> u :call qf#undo()<CR>

if !empty(getloclist(0))
  nnoremap <silent> <buffer> O <CR>:lclose<CR>
else
  nnoremap <silent> <buffer> O <CR>:cclose<CR>
endif
