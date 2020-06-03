setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal textwidth=120
setlocal iskeyword+=!
setlocal formatoptions-=or
setlocal regexpengine=1
setlocal makeprg=ruby\ -c\ %

let b:ale_linters = ['rubocop', 'solargraph']
