augroup html
  autocmd!
  autocmd FileType html,xhtml setlocal expandtab
  autocmd FileType html,xhtml setlocal tabstop=2
  autocmd FileType html,xhtml setlocal shiftwidth=2
  autocmd FileType html,xhtml setlocal softtabstop=2
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
augroup END
