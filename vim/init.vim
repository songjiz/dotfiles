set nocompatible

" vim-plug {{{
if !filereadable(expand('~/.vim/autoload/plug.vim'))
  echo "Installing vim-plug ..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim
          \ --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | quit | source $MYVIMRC
endif
call plug#begin('~/.vim/pack')
Plug 'maralla/completor.vim'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.vim/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret'
Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-abolish'
Plug 'justinmk/vim-sneak'
Plug 'wellle/targets.vim'
Plug 'lambdalisue/gina.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'janko/vim-test'
Plug 'rust-lang/rust.vim'
call plug#end()
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
set fileencodings=utf8,chinese,taiwan,japan,korea,ansi
" }}}

" Numbering {{{
set number
set relativenumber
" }}}

" Tabs and Spaces {{{
set smarttab      " Tabs at the beginning of a line
set expandtab     " Use space instead of tab
set shiftround    " Indent to the nearest tabstop
set tabstop=2
set softtabstop=2
set shiftwidth=2
function! s:expand_tab(size)
  if a:size
    setlocal expandtab
    execute 'setlocal shiftwidth='.a:size
    execute 'setlocal softtabstop='.a:size
    execute 'setlocal tabstop='.a:size
  else
    setlocal noexpandtab
    execute 'setlocal shiftwidth&vim'
    execute 'setlocal softtabstop&vim'
    execute 'setlocal tabstop&vim'
  endif
endfunction
command! -nargs=* ExpandTab call <SID>expand_tab(<q-args>)
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
set matchtime=1
" }}}

" No annoying {{{
set noerrorbells
set novisualbell
set nospell
set belloff=all
" }}}

" Split {{{
set splitbelow
set splitright
" }}}

" Backspace {{{
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
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
set wildmenu                    " Command line tab completion
set wildmode=list:longest,full

set completeopt+=longest
set completeopt+=menuone
set completeopt+=noinsert
set completeopt+=preview

set dictionary+=$HOME/.vim/dict/words
set complete+=k
set complete+=kspell

" Popup Menu
set pumheight=15  " Maximum number of items to show in popup menu
" set pumblend=10   " Pesudo-blend effect for popup menu
" }}}

" Ignore files {{{
set wildignore+=.DS_Store,*.keep,
set wildignore+=.git/**,.svn/**,.hg/**,tmp/**,*.log,.bundle/**,node_modules/**,build/**
set wildignore+=*.rbc,.rbx,*.scssc,*.sassc,.sass-cache,*pyc,*.o,*.gem
set wildignore+=*.jpg,*jpeg,*.tiff,*.gif,*.png,*.svg,*.psd,*.pdf
set wildignore+=tags
" }}}

" Undo {{{
set undofile
set undoreload=1000
set undolevels=1000
" }}}

" Disable backup {{{
set nobackup
set nowritebackup
set noswapfile

set undodir=$HOME/.vim/tmp/undo/
set backupdir=$HOME/.vim/tmp/backup/
set directory=$HOME/.vim/tmp/swap/

let g:log_dir=$HOME . '/.vim/tmp/log/'
let g:sessons_dir=$HOME . '/.vim/tmp/sessions/'
silent! call mkdir(iconv(&undodir, &encoding, &termencoding), 'p')
silent! call mkdir(iconv(&backupdir, &encoding, &termencoding), 'p')
silent! call mkdir(iconv(&directory, &encoding, &termencoding), 'p')
silent! call mkdir(iconv(g:log_dir, &encoding, &termencoding), 'p')
silent! call mkdir(iconv(g:sessons_dir, &encoding, &termencoding), 'p')
" }}}

" Folding {{{
set nofoldenable
set foldmethod=indent
set foldnestmax=3
set foldcolumn=0
" }}}

" Clipboard {{{
set clipboard^=unnamed,unnamedplus
" }}}

" Wrap {{{
set list
set wrap
set textwidth=80
set colorcolumn=80
set formatoptions=qn1 " See :help fo-table
" set listchars=tab:»·,trail:·,extends:❯,precedes:❮,eol:↩,nbsp:+
set listchars=tab:»·,trail:·,extends:❯,precedes:❮,nbsp:+
set showbreak=↪
" }}}

" Others {{{
syntax on
set title
set noshowmode
set hidden
set showmatch
set nocursorline
set scrolloff=5

set ttyfast
set lazyredraw
set redrawtime=5000
set timeoutlen=500

" Prefer vertical orientation when using :diffsplit
set diffopt+=vertical

set virtualedit=onemore
set viewoptions=folds,cursor,unix,slash

" Auto read file when a file is changed from outside
set autoread
" Auto write a file when leaveing a modified buffer
set autowrite
set updatetime=1000

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

set background=dark
try
  colorscheme PaperColor
catch
endtry

" Enable built-in matchit plugin
runtime macros/matchit.vim
" }}}

" Autocommands {{{
augroup common
  autocmd!
  " Don't show fold sign column
  autocmd WinEnter,WinLeave,BufRead,BufWrite * set foldcolumn=0

  " Disable automatic commenting on newline
  autocmd FileType * setlocal formatoptions-=cro

  " Restore cursor to file position in previous editing session
  autocmd BufWinEnter *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "silent! normal! g`\"" |
        \ endif

  " Toggle line number
  autocmd BufLeave,FocusLost,InsertEnter *  set norelativenumber
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber

  autocmd InsertEnter * setlocal nolist
  autocmd InsertLeave * setlocal list nopaste

  " Delete trailing white spaces
  autocmd BufWritePre * :%s/\s\+$//e

  autocmd VimResized * :wincmd =

  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch

  autocmd BufWritePre,FileWritePre * silent! call <SID>auto_mkdir(expand('<afile>:p:h'), v:cmdbang)

  " Automatic rename of tmux window
  if exists('$TMUX') && !exists('$NORENAME')
    autocmd BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    autocmd VimLeave * call system('tmux set-window automatic-rename on')
  endif
augroup END
" }}}

" Key mappings {{{
let mapleader = ','
nnoremap ; :
nnoremap : ;
vnoremap ; :

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
endif
" }}}

" Let mark go to column
nnoremap ' `

nnoremap ! :!
nnoremap Q @q

" Search {{{
nnoremap <silent> // :nohlsearch<CR> " Clear highlighted searches
" }}}

" Toglle paste mode
set pastetoggle=<F5>

" Map for Escape key
imap jk <ESC>
cnoremap jk <c-c>
xnoremap jk <c-c>
vnoremap v <ESC>

" In terminal mode, <C-w> is leader key
tnoremap jk <C-\><C-n>
tnoremap <ESC> <C-\><C-n>

" Insert mode navigation like terminal
inoremap <C-b> <C-o>h
inoremap <C-f> <C-o>l
inoremap <M-b> <C-o>b
inoremap <M-f> <C-o>e
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" Ctrl-j/k navigation in popups
inoremap <expr> <C-j> (pumvisible()?"\<C-n>":"\<C-j>")
inoremap <expr> <C-k> (pumvisible()?"\<C-p>":"\<C-k>")

" Resize windows using <Alt> and h,j,k,l
nnoremap <silent> <M-h> <C-w><
nnoremap <silent> <M-l> <C-w>>
nnoremap <silent> <M-j> <C-W>-
nnoremap <silent> <M-k> <C-W>+

" qq to record, Q to replay
nnoremap Q @q

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
nnoremap L $
noremap B ^
noremap E $

" Automatically jump to a file at the correct line number
noremap <Leader>gf :vertical botright wincmd F<CR>
" Jump to definition in vertical split
nnoremap <Leader>] <C-W>v<C-]>

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

nnoremap <silent> <Leader>bg :let &background = (&background == "dark"? "light" : "dark")<CR>

" Copy the text from the cursor position to the end of line(like 'D' and 'C')
nnoremap Y y$

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" u is undo, U is redo
nnoremap U <C-r>

" Fast edit files in same directory
cabbr <expr> %% fnameescape(expand("%:p:h"))
nnoremap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
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
" }}}

" Tab navigation {{{
nnoremap <silent> <C-t><SPACE> gT
nnoremap <silent> <C-t>k :tabprevious<CR>
nnoremap <silent> <C-t>p :tabprevious<CR>
nnoremap <silent> <C-t>j :tabnext<CR>
nnoremap <silent> <C-t>n :tabnext<CR>
nnoremap <silent> <C-t>c :tabclose<CR>
nnoremap <silent> <C-t>a :tabfirst<CR>
nnoremap <silent> <C-t>z :tablast<CR>
nnoremap <silent> <C-t>m :tabmove<SPACE>
nnoremap <silent> <C-t>o :tabonly<CR>

" Merge a tab into a split in the previous window
command! MergeTab call s:merge_tab()
function! s:merge_tab() abort
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction
nnoremap <silent><C-w>u :MergeTab<CR> "<C-w>T move buffer to new tab
" }}}

" Window split {{{
" 1) Ctrl-w s   Split
" 2) Ctrl-w v   Vsplit
nnoremap <silent><leader>sh :leftabove vnew<CR>
nnoremap <silent><leader>sl :rightbelow vnew<CR>
nnoremap <silent><leader>sk :leftabove new<CR>
nnoremap <silent><leader>sj :rightbelow new<CR>
" }}}

" Window navigation {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Tab>   <C-w>w
nnoremap <S-Tab> <C-w>W
" }}}

" Quickly edit/reload the vimrc file {{{
nnoremap <silent> <Leader>vc :vsp $MYVIMRC<CR>
nnoremap <silent> <Leader>rc :silent update $MYVIMRC <Bar> source $MYVIMRC<CR>
" }}}

" Folding {{{
nnoremap <silent> z0 :set foldlevel=0<CR>
nnoremap <silent> z1 :set foldlevel=1<CR>
nnoremap <silent> z2 :set foldlevel=2<CR>
nnoremap <silent> z3 :set foldlevel=3<CR>
nnoremap <silent> z4 :set foldlevel=4<CR>
nnoremap <silent> z5 :set foldlevel=5<CR>
nnoremap <silent> z6 :set foldlevel=6<CR>
nnoremap <silent> z7 :set foldlevel=7<CR>
nnoremap <silent> z8 :set foldlevel=8<CR>
nnoremap <silent> z9 :set foldlevel=9<CR>
nnoremap <Space> za
" }}}

" Buffer {{{
nnoremap <silent> <Leader>bn :bn<CR>
nnoremap <silent> ]b         :bn<CR>
nnoremap <silent> [b         :bp<CR>
nnoremap <silent> <Leader>bp :bp<CR>
nnoremap <silent> <Leader>bf :bf<CR>
nnoremap <silent> <Leader>bl :bl<CR>
nnoremap <silent> <Leader>bw :w<CR>:bd<CR>
nnoremap <silent> <Leader>bd :bd!<CR>
nnoremap <silent> <Leader>w  :w!<CR>
nnoremap <silent> <Leader>q  :q!<CR>
nnoremap <silent> <Leader>x  :x!<CR>
nnoremap <silent> <Leader>bd :bd!<CR>         " Close current buffer(Delete crrent buffer).
nnoremap <silent> <Leader>ba :1,bd!<CR>       " Close all buffers(Delete all buffer).
nnoremap <silent> <Leader>bo :silent w <BAR> :silent %bd <BAR> e#<CR> " Close all others buffers except current one

" Save file as root.
cnoremap w!! w !sudo tee % > /dev/null<CR>

" Toggle between last open buffers
nnoremap <Leader><Space> <C-^>

command! Q q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

" session
nnoremap <Leader>ss :mksession! ~/.vim/tmp/sessions/
nnoremap <Leader>rs :source ~/.vim/tmp/sessions/
nnoremap <Leader>ds :!rm ~/.vim/tmp/sessions/
" }}}

" Rename current file
command! RenameFile call s:rename_file()
function! s:rename_file() abort
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
nnoremap <Leader>n :RenameFile<CR>

command! FuckGFW :tabe ~/.config/clash/config.yaml

" Quickfix window {{{
nnoremap <silent> <Leader>co :copen<CR>zz
nnoremap <silent> <Leader>cw :cwindow<CR>zz
nnoremap <silent> <Leader>cc :cclose<CR>zz
nnoremap <silent> <Leader>cn :cnext<CR>zz
nnoremap <silent> <Leader>cp :cprevious<CR>zz
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz

if executable('rg')
  let s:rg_cmd = "rg --hidden --follow --smart-case --no-ignore-messages"
  let s:rg_ignore = split(&wildignore, ',') + [
        \ 'node_modules', 'target', 'build', 'dist', '.stack-work'
        \ ]
  let s:rg_cmd .= " --glob '!{'" . shellescape(join(s:rg_ignore, ',')) . "'}'"
  let &grepprg=s:rg_cmd . ' --vimgrep'
  let &grepformat='%f:%l:%c:%m'
  let $FZF_DEFAULT_COMMAND = s:rg_cmd . ' --files'
else
  let &grepprg="grep -n --with-filename -I -R"
  let &grepformat='%f:%l:%m'
endif

" Toggle quickfix window.
command! ToggleQf call <SID>toggle_qf()
function! s:toggle_qf()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') ==# 'quickfix'
      cclose
      return
    endif
  endfor
  copen
endfunction

nnoremap <silent> <F4> :ToggleQf<CR>

" function! QuickfixRemove()
"   let curqfidx = line('.') - 1
"   let qfall = getqflist()
"   call remove(qfall, curqfidx)
"   call setqflist(qfall, 'r')
"   execute curqfidx + 1 . "cfirst"
"   copen
" endfunction

" }}}

command! -bang Profile call s:profile(<bang>0)
function! s:profile(bang)
  if a:bang
    profile pause
    noautocmd qall
  else
    profile start ~/.vim/tmp/log/profile.log
    profile func *
    profile file *
  endif
endfunction

command! GitRoot call s:git_root()
function! s:git_root()
  let l:root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' . l:root
    echo 'Changed directory to: ' . l:root
  endif
endfunction

command! -nargs=* SaveMacro call <SID>save_macro(<f-args>)
function! s:save_macro(name, file)
  let content = eval('@'.a:name)
  if !empty(content)
    call writefile(split(content, "\n"), a:file)
    echom len(content) . " bytes save to ". a:file
  endif
endfunction

command! -nargs=* LoadMacro call <SID>load_macro(<f-args>)
function! s:load_macro(file, name)
  let data = join(readfile(a:file), "\n")
  call setreg(a:name, data, 'c')
  echom "Macro loaded to @". a:name
endfunction

command! -bang AutoMkDir call <SID>auto_mkdir(expand('%:p:h'), <bang>0)
function s:auto_mkdir(dir, force)
  if !isdirectory(a:dir)
    if a:force || confirm("'" . a:dir . "' does not exist. Create?", "&Yes\n&No", 2)
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endif
endfunction

command! SyntaxStack call <SID>syntax_stack()
function! s:syntax_stack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), ' > ')
endfunction
" }}}

" Plugins config {{{

" FZF {{{
if executable('rg')
  let $FZF_DEFAULT_COMMAND='rg --vimgrep --files --hidden --follow --no-ignore-messages --glob "!.git/*"'
elseif executable('ag')
  let $FZF_DEFAULT_COMMAND='ag --hidden -l -g ""'
endif
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'

" Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

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

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \   <q-args>,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%', '?'),
      \   <bang>0
      \ )

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --vimgrep --smart-case --hidden --no-ignore-messages --color=always --glob "!.git/*" ' . shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%', '?'),
      \   <bang>0
      \ )

nnoremap <silent> <Leader><Leader> :FZF -m<CR>
nnoremap <silent> <C-p>        :FZF -m<CR>
nnoremap <silent> <Leader>ff   :Files<CR>
nnoremap <silent> <Leader>fgf  :GFiles<CR>
nnoremap <silent> <Leader>fgs  :GFiles?<CR>
nnoremap <silent> <Leader>fc   :Commits<CR>
nnoremap <silent> <Leader>fbc  :BCommits<CR>
nnoremap <silent> <Leader>fbb  :Buffers<CR>
nnoremap <silent> <Leader>bb   :Buffers<CR>
nnoremap <silent> <Leader>f;   :Commands<CR>
nnoremap <silent> <Leader>fk   :Helptags<CR>
nnoremap <silent> <Leader>fh   :History<CR>
nnoremap <silent> <Leader>fl   :Lines<CR>
nnoremap <silent> <Leader>fbl  :BLines<CR>
nnoremap <silent> <Leader>ft   :Tags<CR>
nnoremap <silent> <Leader>fbt  :BTags<CR>
nnoremap <silent> <Leader>fm   :Maps<CR>
nnoremap <silent> <Leader>f'   :Marks<CR>
nnoremap <silent> <Leader>fw   :Windows<CR>

" Mapping selecting mappings
nmap <leader><Tab> <plug>(fzf-maps-n)
xmap <leader><Tab> <plug>(fzf-maps-x)
omap <leader><Tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <C-x><C-k> <plug>(fzf-complete-word)
imap <C-x><C-f> <plug>(fzf-complete-path)
imap <C-x><C-j> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)
" }}}

" completor {{{
let g:completor_filetype_map = {
      \ 'ruby': { 'ft': 'lsp', 'cmd': 'solargraph stdio' },
      \ 'typescript': { 'ft': 'lsp', 'cmd': 'typescript-language-server --stdio' },
      \ 'javascript': { 'ft': 'lsp', 'cmd': 'typescript-language-server --stdio' },
      \ 'javascript.jsx': { 'ft': 'lsp', 'cmd': 'typescript-language-server --stdio' },
      \ 'rust': { 'ft': 'lsp', 'cmd': 'rls' }
      \ }

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" }}}

" surround {{{
" Surroud with #{ruby interpolation}.
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" Surround a word with "double quotes".
map ," ysiwd"
vmap ," c"<C-R>""<ESC>

" Surround a word with 'single quotes'.
map ,' ysiwd'
vmap ,' c'<C-R>"'<ESC>

" Surround with (parens) or ( parens ).
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" Surround with [brackets] or [ brackets ]
map ,[ ysiw[
map ,] ysiw]
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" Surround with {braces} or { braces }
map ,{ ysiw{
map ,} ysiw}
vmap ,{ c{ <C-R>" }<ESC>
vmap ,} c{<C-R>"}<ESC>

map ,` ysiw`
" }}}

" sneak {{{
let g:sneak#label=1
let g:sneak#s_next = 1
" }}}

" ferret {{{
let g:FerrerLazyInit = 1
let g:FerretAutojump = 1

nmap \a <Plug>(FerretAck)
nmap \w <Plug>(FerretAckWord)
nmap \s <Plug>(FerretAcks)
nmap \r <Plug>(FerretAcks)
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
nnoremap - :call OpenDir('leftabove vsplit')<CR>

function! OpenDir(cmd) abort
  if expand('%') =~# '^$\|^term:[\/][\/]'
    execute a:cmd '.'
  else
    execute a:cmd . '%:h | vertical resize ' . get(g:, 'netrw_winsize', 20)
    let pattern = '^\%(|\)*' . escape(expand('#:t'), '.*[]~\') . '[/*|@=]\=\%($\|\t\)'
    call search(pattern, 'wc')
  endif
endfunction

augroup netrw
  autocmd!
  " Use `<C-c>` to close netrw window.
  autocmd FileType netrw
    \ nnoremap <silent><buffer> <C-c> :wincmd q<CR>
  " Delete netrw's buffer once it's hidden.
  autocmd FileType netrw setlocal bufhidden=delete
augroup END
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
 " }}}

" Gitgutter {{{
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_on_bufenter = 1
let g:gitgutter_signs = 0
noremap <silent><Leader>gg :GitGutterToggle<CR>
" }}}

" Gina {{{
" https://github.com/lambdalisue/gina.vim/issues/96#issuecomment-319655413
let g:gina#command#blame#formatter#format="%su%= by %au on %ti %ma%in"
nnoremap <silent> <Leader>gs :Gina status --opener=split<CR>
nnoremap <silent> <Leader>gb :Gina blame<CR>
nnoremap <silent> <Leader>gd :Gina diff --opener=split<CR>
nnoremap <silent> <Leader>gc :Gina commit<CR>
nnoremap <silent> <Leader>ge :Gina edit %<CR>
nnoremap <silent> <Leader>gw :Gina add %<CR>

augroup gina
  autocmd!
  autocmd FileType gina-blame,gina-status,diff noremap <silent>q :bd<CR>
augroup END
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
nnoremap <Leader>sn :UltiSnipsEdit<CR>
" }}}

" vim-test {{{
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
nnoremap <silent> t<C-g> :TestVisit<CR>
" }}}

" easy-align {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <Leader>= <Plug>(LiveEasyAlign)
xmap <Leader>= <Plug>(LiveEasyAlign)
" }}}

" vim-markdown {{{
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
" }}}

" lightline {{{
let g:lightline={}
let g:lightline.colorscheme='PaperColor'
let g:lightline.component_function = {
      \ 'gitbranch': 'LightlineGitBranch',
      \ 'githunks': 'LightlineGitHunks',
      \ 'alelint': 'LightlineALELint',
      \ 'filesize': 'LightlineFileSize',
      \ }
let g:lightline.active = {
      \ 'left': [['mode', 'paste'], ['gitbranch', 'filename', 'githunks', 'readonly', 'modified']],
      \ 'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype', 'alelint']],
      \ }
let g:lightline.inactive = {
      \ 'left': [['filename', 'readonly', 'modified']],
      \ 'right': [['lineinfo'], ['percent']]
      \ }

augroup Lightline
  autocmd!
  autocmd ColorScheme * call LightlineColorschemeUpdate()
augroup END

function! LightlineFileSize()
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

function! LightlineColorschemeUpdate() abort
  let g:lightline.colorscheme = g:colors_name
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! LightlineGitBranch() abort
  let branch = gina#component#repo#branch()
  return strlen(branch) ? ' '. branch : ''
endfunction

function! LightlineGitHunks() abort
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

function! LightlineALELint() abort
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
" }}}

" }}}

" Local config {{{
if filereadable(expand('~/.vimrc.local'))
  source $HOME/.vimrc.local
endif
" }}}

" vim: sw=2 sts=2 tw=0 fdm=marker
