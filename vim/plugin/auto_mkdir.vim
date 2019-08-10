if exists('g:loaded_auto_mkdir')
  finish
endif

let g:loaded_auto_mkdir = 1

function! auto_mkdir#try(dir, force) abort
  if !isdirectory(a:dir)
    if a:force || confirm("'" . a:dir . "' does not exist. Do you want to create it?", "&Yes\n&No", 2) == 1
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endif
endfunction
