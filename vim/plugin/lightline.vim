function! lightline#file_size() abort
  let l:bytes = getfsize(expand('%'))
  if l:bytes < 0
    return ''
  endif

  let l:factor = 1
  for l:unit in ['B', 'K', 'M', 'G']
    let l:next_factor = l:factor * 1024
    if l:bytes < l:next_factor
      let l:number_str = printf('%.2f', (l:bytes * 1.0) / l:factor)
      let l:number_str = substitute(l:number_str, '\v\.?0+$', '', '')
      return l:number_str . l:unit
    endif
    let l:factor = l:next_factor
  endfor
endfunction

function! lightline#git_branch() abort
  let branch = gina#component#repo#branch()
  return strlen(branch) ? ' '. branch : ''
endfunction

function! lightline#git_hunks() abort
  if !get(g:, 'gitgutter_enabled', 0) || winwidth(0) <= 100
    return ''
  end
  let s:hunk_signs = get(g:, 'lightline#hunks#signs', ['+', '~', '-'])
  let hunks = GitGutterGetHunkSummary()
  let summary = ''
  for i in [0, 1, 2]
    let summary .= printf('%s%s ', s:hunk_signs[i], hunks[i])
  endfor
  return trim(summary)
endfunction

function! lightline#ale_lint() abort
  if !exists(':ALE') || winwidth(0) <= 100
    return ''
  endif
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
