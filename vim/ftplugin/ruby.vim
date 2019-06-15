augroup ruby
  autocmd!
  autocmd BufNewFile,BufRead {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set filetype=ruby
  autocmd FileType ruby setlocal expandtab
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal textwidth=120
  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby compiler ruby
  autocmd FileType ruby set iskeyword+=!
augroup END
