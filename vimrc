" Basic {{{
set nocompatible
" Don't show startup splash screen
set shortmess+=I

syntax on
set noshowmode
set showmatch
set nocursorline
set nojoinspaces
set scrolloff=3

set signcolumn=no

set ttyfast
set lazyredraw
set redrawtime=5000
set ttimeout
set timeoutlen=500
set ttimeoutlen=1

" Prefer vertical orientation when using :diffsplit
set diffopt+=vertical

" Auto read file when a file is changed from outside
set autoread
" Auto write a file when leaveing a modified buffer
set autowrite

" No annoying
set noerrorbells
set novisualbell
set nospell
set belloff=all

" Clipboard
set clipboard^=unnamed,unnamedplus
" }}}

" Plugins {{{
if filereadable(expand('~/.vim/pack.vim'))
  source ~/.vim/pack.vim
endif
" }}}

" Filetype {{{
filetype on
filetype plugin on
filetype indent on
" }}}

" Encoding {{{
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf8
" }}}

" Numbering {{{
set number
set relativenumber
" }}}

" Tabs And Spaces {{{
set smarttab      " Tabs at the beginning of a line
set expandtab     " Use space instead of tab
set shiftround    " Indent to the nearest tabstop
set tabstop=2
set softtabstop=2
set shiftwidth=2

set backspace=indent,eol,start
" }}}

" Indent {{{
set autoindent
set smartindent
" }}}

" Seaching {{{
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase
set gdefault
" }}}

" Split {{{
set splitbelow
set splitright
" }}}

" Status line {{{
set laststatus=2
set ruler
" }}}

" Command line {{{
set showcmd
set cmdheight=1
set history=1000
" }}}

" Completion {{{
set wildmenu
set wildmode=list:longest,full

" set completeopt+=longest
" set completeopt+=menuone
" set completeopt-=noselect
" set completeopt-=noinsert
" set completeopt+=preview

" set dictionary+=~/.vim/dict/words
set tags=./tags;
set pumheight=10
" }}}

" Ignore Files {{{
set wildignore+=.DS_Store,*.keep,
set wildignore+=.git/**,.svn/**,.hg/**,
set wildignore+=tmp/**,*.log,
set wildignore+=.bundle/**,node_modules/**,build/**,dist/**,target/**,vendor/gems/*
set wildignore+=*.rbc,.rbx,*.scssc,*.sassc,.sass-cache,*pyc,*.o,*.gem,
set wildignore+=*.jpg,*jpeg,*.tiff,*.gif,*.png,*.svg,*.psd,*.pdf,
set wildignore+=tags,
" }}}

" Session | Swap | Undo | Backup {{{
set noswapfile
set directory^=~/.vim/cache/swap//
if has('win32') || has('win64')
  set directory-=~/.vim/cache/swap//
  set directory^=~/vimfiles/cache/swap//
endif

set undofile
set undoreload=1000
set undolevels=1000
set undodir^=~/.vim/cache/undo//
if has('win32') || has('win64')
  set undodir-=~/.vim/cache/undo//
  set undodir^=~/vimfiles/cache/undo//
endif

set nobackup
set nowritebackup
set backupdir^=~/.vim/cache/backup//
if has('win32') || has('win64')
  set backupdir-=~/.vim/cache/backup
  set backupdir^=~/vimfiles/cache/backup
endif

" Add some paths not to back up
set backupskip^=/dev/shm/*  " Shared memory RAM disk
set backupskip^=/var/tmp/*  " Debian's $TMPDIR for sudoedit(8)
if !has('unix')
  set backupskip-=/dev/shm/*
  set backupskip-=/var/tmp/*
endif

let g:session_dir='~/.vim/cache/sessions//'
set sessionoptions-=localoptions  " No buffer options or mappings
set sessionoptions-=options       " No global options or mappings

silent! call mkdir(iconv(&undodir, &encoding, &termencoding), 'p')
silent! call mkdir(iconv(&backupdir, &encoding, &termencoding), 'p')
silent! call mkdir(iconv(&directory, &encoding, &termencoding), 'p')
silent! call mkdir(iconv(expand(g:session_dir), &encoding, &termencoding), 'p')
" }}}

" Folding {{{
set nofoldenable
set foldnestmax=3
" }}}

" Wrap {{{
set list
set wrap
set whichwrap+=<,>,[,]
set textwidth=79
set colorcolumn=80
set listchars=tab:»\ ,trail:·,extends:›,precedes:‹,nbsp:·
set showbreak=↪
" }}}

" Theme {{{

" Enable true color
if has('gui_running') && $COLORTERM ==# 'truecolor'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
else
  set t_Co=256
endif

" Show block cursor in Normal mode and line cursor in Insert mode
let &t_ti.="\e[2 q"
let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"
let &t_te.="\e[0 q"

if has('gui_running')
  " it is necessary to escape the space
  set guifont=Monaco\ Nerd\ Font:h14
  " remove all scroll bar
  set guioptions=
  set columns=160
  set lines=45
  " set transparency=5
endif

let g:PaperColor_Theme_Options = {
      \   'theme': {
      \     'default.dark': {
      \       'override': {
      \         'folded_bg': ['#303030', '236'],
      \         'folded_fg': ['#808080', '244']
      \       }
      \     },
      \     'default.light': {
      \       'override': {
      \         'folded_bg': ['#E4E4E4', '254'],
      \         'folded_fg': ['#808080', '244']
      \       }
      \     }
      \   }
      \ }
let g:jellybeans_use_term_background_color = 1
let g:jellybeans_overrides = {
      \ 'VertSplit':   { 'ctermbg': 'NONE', '256ctermbg': 'NONE' },
      \ }

try
  colorscheme jellybeans
catch
endtry

highlight clear ColorColumn
highlight link  ColorColumn CursorLine
" }}}

" Autocommands {{{
augroup common
  autocmd!
  autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype markdown

  " Disable automatic commenting on newline
  autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

  " Restore cursor to file position in previous editing session
  autocmd BufWinEnter *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "silent! normal! g`\"" |
        \ endif

  autocmd BufEnter,FocusGained * call lightline#update()

  autocmd InsertEnter * setlocal nolist
  autocmd InsertLeave * setlocal list nopaste

  " Delete trailing white spaces
  autocmd BufWritePre * :%s/\s\+$//e

  autocmd VimResized * :wincmd =

  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch

  autocmd BufWritePre,FileWritePre * silent! call auto_mkdir#try(expand('<afile>:p:h'), v:cmdbang)

  autocmd FileType help,gina-blame,gina-status,diff,qf,netrw nnoremap <buffer><silent>q :bd<CR>

  " Auto switch to insert mode when focusing on terminal window
  autocmd BufWinEnter,BufEnter,WinEnter *
        \ if &buftype == "terminal" |
        \ setlocal colorcolumn& |
        \ silent! normal i |
        \ endif
augroup END
" }}}

" Key Mappings {{{
let mapleader = ","

" Ctrl-j/k navigation in popups
inoremap <expr> <C-j> (pumvisible() ? "\<C-n>" : "\<C-j>")
inoremap <expr> <C-k> (pumvisible() ? "\<C-p>" : "\<C-k>")

" Alt key {{{
if !has('nvim') && &term =~ 'xterm' && !has("gui_running")
  execute "set <A-e>=\ee"
  execute "set <A-p>=\ep"
  execute "set <A-n>=\en"
  execute "set <A-b>=\eb"
  execute "set <A-f>=\ef"
  execute "set <A-h>=\eh"
  execute "set <A-j>=\ej"
  execute "set <A-k>=\ek"
  execute "set <A-l>=\el"
  execute "set <A-t>=\et"
  execute "set <A-]>=\e]"
endif
" }}}

" Let mark go to column
nnoremap ' `

nnoremap ; :
nnoremap : ;
nnoremap ! :!

" Search {{{
" Clear highlighted searches
nnoremap <silent> // :nohlsearch<CR>
" }}}

" Toglle paste mode
set pastetoggle=<F5>

" Map for Escape key
imap jk <ESC>
imap kj <ESC>
cmap jk <C-c>
cmap kj <C-c>
vmap v  <ESC>

" In terminal mode, <C-w> is leader key
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>
tnoremap <C-[> <C-\><C-n>
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
tnoremap <A-h> <C-\><C-n><C-w>h

" Insert mode navigation like terminal
inoremap <C-b> <C-o>h
inoremap <C-f> <C-o>l
inoremap <A-b> <C-o>b
inoremap <A-f> <C-o>e
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" Resize windows using <Ctrl> and h,j,k,l
nnoremap <silent> <C-h> <C-w><
nnoremap <silent> <C-l> <C-w>>
nnoremap <silent> <C-j> <C-W>-
nnoremap <silent> <C-k> <C-W>+

" qq to record, Q to replay
nnoremap Q @q
nmap <leader>ms plug(macro-save)
nmap <leader>ml plug(macro-load)
nmap <leader>md plug(macro-del)

" Center screen after navigation
nnoremap }   }zz
nnoremap {   {zz
nnoremap ]]  ]]zz
nnoremap [[  [[zz
nnoremap []  []zz
nnoremap ][  ][zz

" Recenter when jump back
nnoremap <C-o> <C-o>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" Center highlighted search
nnoremap n  nzz
nnoremap N  Nzz
nnoremap *  *zz
nnoremap #  #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap G  Gzz

" Do not include white space character when using $ in visual mode
vnoremap $ g_

" Go to start or end of line easier
nnoremap H ^
nnoremap L g_

" gf and gF opens in vertical split
nnoremap gf <C-w>vgf
vnoremap gf <C-w>vgf
nnoremap gF <C-w>vgF
vnoremap gF <C-w>vgF
" Jump to definition in vertical split
nnoremap <A-]> <C-W>v<C-]>

" Select all
noremap <C-a> ggVG<CR>

" Disable arrow keys
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>
inoremap <UP>    <NOP>
inoremap <DOWN>  <NOP>
inoremap <LEFT>  <NOP>
inoremap <RIGHT> <NOP>

nnoremap <silent> <leader>bg :let &background = (&background == "dark"? "light" : "dark")<CR>

" Copy the text from the cursor position to the end of line(like 'D' and 'C')
nnoremap Y y$

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" u is undo, U is redo
nnoremap U <C-r>

" Reload current file
nnoremap <C-e> :e#<CR>

" Fast edit files in same directory
cabbr <expr> %% fnameescape(expand("%:p:h"))
nnoremap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
nnoremap <leader>t :tabe <C-R>=expand("%:p:h") . '/'<CR>
nnoremap <leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
nnoremap <leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Move cursor in command mode {{{
" just like in terminal
cnoremap <C-j> <Down>
cnoremap <C-k> <UP>
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>
cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
" }}}

" Indenting {{{
vnoremap < <gv
vnoremap > >gv
xnoremap <S-Tab> <gv
xnoremap <Tab> >gv
nnoremap <leader>i mmgg=G`m
" }}}

" Tab navigation {{{
nnoremap <silent><Tab>   gt
nnoremap <silent><S-Tab> gT

" <C-w>T move buffer to new tab, <C-w>U merge a tab into a split in the previous window
nmap <silent><C-w>U <plug>(tabbar-merge)
" }}}

" Window split {{{
nnoremap <silent><leader>sh :leftabove vnew<CR>
nnoremap <silent><leader>sl :rightbelow vnew<CR>
nnoremap <silent><leader>sk :leftabove new<CR>
nnoremap <silent><leader>sj :rightbelow new<CR>
" }}}

" Window navigation {{{
nnoremap <silent><A-h> <C-w>h
nnoremap <silent><A-l> <C-w>l
nnoremap <silent><A-j> <C-W>j
nnoremap <silent><A-k> <C-W>k
inoremap <silent><A-h> <C-\><C-N><C-w>h
inoremap <silent><A-j> <C-\><C-N><C-w>j
inoremap <silent><A-k> <C-\><C-N><C-w>k
inoremap <silent><A-l> <C-\><C-N><C-w>l
" }}}

" Quickly edit/reload the vimrc file {{{
nnoremap <silent> <leader>vc :tabe $MYVIMRC<CR>
nnoremap <silent> <leader>vu :tabe ~/.vimrc.local<CR>
nnoremap <silent> <leader>rc :silent update $MYVIMRC <Bar> source $MYVIMRC<CR>
" }}}

" Buffer {{{
nnoremap <silent> <C-p> :bp<CR>
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> ]b         :bn<CR>
nnoremap <silent> [b         :bp<CR>
nnoremap <silent> <leader>bw :w<CR>:bd<CR>
nnoremap <silent> <leader>bd :bd!<CR>
nnoremap <silent> <leader>w  :w!<CR>
nnoremap <silent> <leader>q  :q!<CR>
nnoremap <silent> <leader>x  :x!<CR>

" Save file as root.
cnoremap w!! w !sudo tee % > /dev/null<CR>

" Toggle between last open buffers
nnoremap <leader><Space> <C-^>

command! Q q
command! Qa qall
command! QA qall
command! E e
command! W w
command! Wq wq

" session
nnoremap <leader>ss :mksession! ~/.vim/cache/sessions/
nnoremap <leader>rs :source ~/.vim/cache/sessions/
nnoremap <leader>ds :!rm ~/.vim/cache/sessions/
" }}}

nmap <silent><leader>n <plug>(rename-file)

command! FuckGFW :tabe ~/.config/clash/config.yaml

" Quickfix window {{{
nnoremap <silent> <leader>cw :cwindow<CR>
nnoremap <silent> <leader>lw :lwindow<CR>
nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>lo :lopen<CR>
nnoremap <silent> <leader>cc :cclose<CR>
nnoremap <silent> <leader>lc :lclose<CR>
nnoremap <silent> <leader>cn :cnext<CR>zz
nnoremap <silent> <leader>ln :lnext<CR>zz
nnoremap <silent> <leader>cp :cprev<CR>zz
nnoremap <silent> <leader>lp :lprev<CR>zz
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz

if executable('rg')
  let s:rg_cmd = "rg --hidden --follow --smart-case --no-ignore-messages"
  let s:rg_ignore = split(&wildignore, ',')
  let s:rg_cmd .= " --glob '!{'" . shellescape(join(s:rg_ignore, ',')) . "'}'"
  let &grepprg=s:rg_cmd . ' --vimgrep'
  let &grepformat='%f:%l:%c:%m'
  let $FZF_DEFAULT_COMMAND=s:rg_cmd . ' --vimgrep --files'
else
  let &grepprg="grep -n --with-filename -I -R"
  let &grepformat='%f:%l:%m'
endif
" }}}

" }}}

" Plugins config {{{

" FZF {{{
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'

" Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" Command to generate tags file
let g:fzf_tags_command = 'noglob ctags -R'

" This is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tabedit',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-y': { lines -> setreg('*', join(lines, "\n")) }
      \ }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Identifier'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }

command! -bang -nargs=* Grep call
      \ fzf#vim#grep(
      \ &grepprg.' --color=always '.shellescape(<q-args>), 1, <bang>0
      \ )

nnoremap <silent> <leader><leader> :Files<CR>
nnoremap <silent> <leader>fgf  :GFiles<CR>
nnoremap <silent> <leader>fgs  :GFiles?<CR>
nnoremap <silent> <leader>fc   :Commits<CR>
nnoremap <silent> <leader>fbc  :BCommits<CR>
nnoremap <silent> <leader>bb   :Buffers<CR>
nnoremap <silent> <leader>f;   :Commands<CR>
nnoremap <silent> <leader>fk   :Helptags<CR>
nnoremap <silent> <leader>fh   :History<CR>
nnoremap <silent> <leader>fl   :Lines<CR>
nnoremap <silent> <leader>fbl  :BLines<CR>
nnoremap <silent> <leader>ft   :Tags<CR>
nnoremap <silent> <leader>fbt  :BTags<CR>
nnoremap <silent> <leader>fm   :Maps<CR>
nnoremap <silent> <leader>f'   :Marks<CR>
nnoremap <silent> <leader>fw   :Windows<CR>
nnoremap \w :Grep <C-r><C-w><CR>
" }}}

" surround {{{
" with #{ruby interpolation}.
map <leader># ysiw}i#<C-o>%<ESC>
vmap <leader># c#{<C-R>"}<ESC>

" with "double quotes".
map <leader>" ysiw"
vmap <leader>" c"<C-R>""<ESC>

" with 'single quotes'.
map <leader>' ysiw'
vmap <leader>' c'<C-R>"'<ESC>

" with (parens) or ( parens ).
map <leader>( ysiw(
map <leader>) ysiw)
vmap <leader>( c( <C-R>" )<ESC>
vmap <leader>) c(<C-R>")<ESC>

" with [brackets] or [ brackets ]
map <leader>[ ysiw[
map <leader>] ysiw]
vmap <leader>[ c[ <C-R>" ]<ESC>
vmap <leader>] c[<C-R>"]<ESC>

" with {braces} or { braces }
map <leader>{ ysiw{
map <leader>} ysiw}
vmap <leader>{ c{ <C-R>" }<ESC>
vmap <leader>} c{<C-R>"}<ESC>

map <leader>` ysiw`
" }}}

" netrw {{{
let g:netrw_banner = 0
let g:netrw_hide = 1
let g:netrw_liststyle = 1
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let g:netrw_altv = 1
let g:netrw_chgwin = 2
nnoremap <silent><F1> :Vexplore<CR>
"}}}

" ale {{{
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 0

nmap <silent> [g <plug>(ale_previous_wrap)
nmap <silent> ]g <plug>(ale_next_wrap)
" }}}

" Gitgutter {{{
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_on_bufenter = 1
let g:gitgutter_signs = 0
noremap <silent><leader>gg :GitGutterToggle<CR>
" }}}

" fugitive {{{
nnoremap <silent><leader>gs :Gstatus<CR>
nnoremap <silent><leader>gb :Gblame<CR>
nnoremap <silent><leader>gc :Gcommit<CR>
nnoremap <silent><leader>gm :Gmerge<CR>
nnoremap <silent><leader>gr :Gread<CR>
nnoremap <silent><leader>gw :Gwrite<CR>
nnoremap <silent><leader>gd :Gdiffsplit<CR>
nnoremap <silent><leader>gD :Gdelete<CR>
nnoremap <silent><leader>gp :Gpush<CR>
nnoremap <silent><leader>gl :Gpull<CR>
nnoremap <silent><leader>gf :Gfetch<CR>
nnoremap <silent><leader>ge :Gedit<CR>
nnoremap <silent><leader>gcl :Gclog<CR>
nnoremap <silent><leader>gll :Gllog<CR>
nmap <silent><leader>gR <plug>(git-root)
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['ultisnips']
nnoremap <leader>sn :UltiSnipsEdit<CR>
" }}}

" vim-test {{{
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
nnoremap <silent> t<C-g> :TestVisit<CR>
" }}}

" easy-align {{{
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)
nmap <leader>= <plug>(LiveEasyAlign)
xmap <leader>= <plug>(LiveEasyAlign)
" }}}

" lightline {{{
let g:lightline={}
let g:lightline.colorscheme='jellybeans'
let g:lightline.component_function = {
      \ 'gitbranch': 'lightline#git_branch',
      \ 'githunks': 'lightline#git_hunks',
      \ 'alelint': 'lightline#ale_lint'
      \ }
let g:lightline.active = {
      \ 'left': [['mode', 'paste'], ['gitbranch', 'githunks', 'filename']],
      \ 'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype', 'alelint']],
      \ }
" }}}

" Local config {{{
if filereadable(expand('~/.vimrc.local'))
  source  ~/.vimrc.local
endif
" }}}

" vim: sw=2 sts=2 tw=0 fdm=marker
