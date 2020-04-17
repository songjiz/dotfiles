function! lightline#readonly() abort
  return &readonly ? '' : ''
endfunction

function! lightline#file_name() abort
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  return &modified ? filename . ' ✎' : filename
endfunction

function! lightline#abs_path() abort
  let path = substitute(expand('%:p'), $HOME, '~', 'g')
  if 2.6*len(path) > winwidth(0)
    let path = pathshorten(path)
  endif
  return path
endfunction

function! lightline#git_branch() abort
  if exists('*fugitive#head')
    let branch = fugitive#head()
  else
    let branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  endif
  return strlen(branch) ? ''. branch : ''
endfunction

function! lightline#git_hunks() abort
  if exists('*GitGutterGetHunkSummary')
    let s:hunk_signs = get(g:, 'lightline#hunks#signs', ['+', '~', '-'])
    let hunks = GitGutterGetHunkSummary()
    let summary = ''
    for i in [0, 1, 2]
      let summary .= printf('%s%s', s:hunk_signs[i], hunks[i])
    endfor
    return trim(summary)
  endif
  return ''
endfunction

function! lightline#ale_status() abort
  let l:indicator_warnings = get(g:, 'lightline#ale#indicator_warnings', 'W:')
  let l:indicator_errors = get(g:, 'lightline#ale#indicator_errors', 'E:')
  let l:indicator_ok = get(g:, 'lightline#ale#indicator_ok', 'OK')
  let l:indicator_linting = get(g:, 'lightline#ale#indicator_linting', 'Linting...')
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  if ale#engine#IsCheckingBuffer(bufnr(''))
    return l:indicator_linting
  else
    if l:counts.total == 0
      return l:indicator_ok

    else
      return (
            \ l:all_non_errors == 0 ? '' :
            \ printf(l:indicator_warnings . '%d', all_non_errors)) .
            \ (l:all_errors == 0 ? '' : printf(l:indicator_errors . '%d', all_errors)
            \ )
    endif
  endif
endfunction
