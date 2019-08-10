if exists('g:loaded_macro')
  finish
endif
let g:loaded_macro = 1

if !exists('g:macro_dir')
  let g:macro_dir = '$HOME/.vim/macros/'
endif

command! -nargs=* MacroSave call macro#save(<f-args>)
function! macro#save(name, file) abort
  let content = eval('@' . a:name)
  if !empty(content)
    if !isdirectory(expand(g:macro_dir))
      call mkdir(iconv(expand(g:macro_dir), &encoding, &termencoding), 'p')
    endif
    call writefile(split(content, "\n"), s:path(a:file))
    echom len(content) . " bytes save to ". a:file
  endif
endfunction

command! -nargs=* MacroLoad call macro#load(<f-args>)
function! macro#load(file, name) abort
  let data = join(readfile(s:path(a:file)), "\n")
  call setreg(a:name, data, 'c')
  echom "Macro loaded to @". a:name
endfunction

command! -nargs=* MacroDel call macro#delete(<f-args>)
function! macro#delete(file) abort
  if delete(s:path(a:file)) == 0
    echom "Deleted " . a:file
  else
    echohl WarningMsg
    echom "Failed to delete " . a:file
    echohl None
  endif
endfunction

function s:path(file)
  return expand(g:macro_dir . a:file)
endfunction
