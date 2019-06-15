augroup javascript
  autocmd!
  autocmd FileType typescript set expandtab
  autocmd FileType typescript set shiftwidth=4
  autocmd FileType typescript set softtabstop=4
  autocmd FileType typescript set tabstop=4
  " Automatically treat .es6 extension files as javascript
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
augroup END
