augroup markdown
  autocmd!
  au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown setlocal expandtab
  autocmd FileType markdown setlocal shiftwidth=4
  autocmd FileType markdown setlocal softtabstop=4
  autocmd FileType markdown setlocal tabstop=4
  autocmd FileType markdown setlocal syntax=markdown
  " Don't fold Markdown files
  autocmd FileType markdown setlocal foldlevel=1
augroup END
