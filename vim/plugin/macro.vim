command! -nargs=* SaveMacro call macro#save(<f-args>)
function! macro#save(name, file)
  let content = eval('@' . a:name)
  if !empty(content)
    call writefile(split(content, "\n"), a:file)
    echom len(content) . " bytes save to ". a:file
  endif
endfunction

command! -nargs=* LoadMacro call macro#load(<f-args>)
function! macro#load(file, name)
  let data = join(readfile(a:file), "\n")
  call setreg(a:name, data, 'c')
  echom "Macro loaded to @". a:name
endfunction
