function! lightline#absPath() abort
  let path = substitute(expand('%:p'), $HOME, '~', 'g')
  if 2.6*len(path) > winwidth(0)
    let path = pathshorten(path)
  endif
  return path
endfunction

function! lightline#gitBranch() abort
  if exists('*FugitiveHead')
    return fugitive#head()
  elseif exists('*fugitive#head')
    return FugitiveHead()
  else
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  endif
endfunction

function! lightline#gitHunks() abort
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

function! lightline#aleStatus() abort
  let l:ale_status_indicators = get(g:, 'lightline#ale#status_indicators', {
          \ 'ok': 'OK',
          \ 'warning': 'W:',
          \ 'error': 'E:',
          \ 'running': '...'
          \ })
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  if ale#engine#IsCheckingBuffer(bufnr(''))
    return '[' . l:ale_status_indicators['running'] . ']'
  else
    if l:counts.total == 0
      return '['. l:ale_status_indicators['ok'] . ']'
    else
      return (
            \ l:all_non_errors == 0 ? '' :
            \ printf('[' . l:ale_status_indicators['warning'] . '%d]', all_non_errors)) .
            \ (l:all_errors == 0 ? '' : printf('[' . l:ale_status_indicators['error'] . '%d]', all_errors)
            \ )
    endif
  endif
endfunction
