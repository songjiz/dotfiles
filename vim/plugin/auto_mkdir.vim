command! -bang -nargs=* AutoMkDir call auto_mkdir#try(expand('%:p:h'), <bang>0)

function! auto_mkdir#try(dir, force) abort
  if !isdirectory(a:dir)
    if a:force || confirm("'" . a:dir . "' does not exist. Do you want to create it?", "&Yes\n&No", 2) == 1
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endif
endfunction
