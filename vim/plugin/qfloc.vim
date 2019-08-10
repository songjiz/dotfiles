if exists('g:loaded_qfloc') || &compatible
  finish
endif
let g:loaded_qfloc = 1

nnoremap <silent> <Plug>(qfloc-cclear) :<C-u>call qfloc#cclear()<CR>
nnoremap <silent> <Plug>(qfloc-lclear) :<C-u>call qfloc#lclear()<CR>
nnoremap <silent> <Plug>(qfloc-cdelete) :call qfloc#cdelete()<CR>
nnoremap <silent> <Plug>(qfloc-ldelete) :call qfloc#ldelete()<CR>
nnoremap <silent> <Plug>(qfloc-cundo) :<C-u>call qfloc#cundo()<CR>
nnoremap <silent> <Plug>(qfloc-lundo) :<C-u>call qfloc#lundo()<CR>

augroup qfloc
  autocmd!
  " autocmd QuickFixCmdPost cgetexpr cwindow
  " autocmd QuickFixCmdPost lgetexpr lwindow
  autocmd QuickfixCmdPost nested [^l]* cwindow
  autocmd QuickfixCmdPost nested l*    lwindow
augroup END
