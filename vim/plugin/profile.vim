if exists('g:loaded_profile')
  finish
endif
let g:loaded_profile = 1

command! -bang Profile call s:profile(<bang>0)

function! s:profile(bang) abort
  if a:bang
    call profile#pause()
  else
    call profile#start()
  endif
endfunction

function! profile#pause() abort
  profile pause
  " noautocmd qall
  execute 'tabe ~/.vim/cache/profile.log'
endfunction

function! profile#start() abort
  profile start ~/.vim/cache/profile.log
  profile func *
  profile file *
endfunction
