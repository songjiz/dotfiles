augroup css
  autocmd!
  autocmd FileType css,sass,scss,less setlocal expandtab
  autocmd FileType css,sass,scss,less setlocal shiftwidth=2
  autocmd FileType css,sass,scss,less setlocal softtabstop=2
  autocmd FileType css,sass,scss,less setlocal tabstop=2
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
augroup END
