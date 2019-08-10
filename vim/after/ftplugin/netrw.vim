" Use `<C-c>` to close netrw window.
nnoremap <silent><buffer> <C-c> :wincmd q<CR>
" Delete netrw's buffer once it's hidden.
setlocal bufhidden=delete
