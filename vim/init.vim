" vim-plug {{{
let vimplug=expand('~/.vim/autoload/plug.vim')
if !filereadable(vimplug)
  echo "Installing vim-plug ..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | quit | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'maralla/completor.vim'
Plug 'tmsvg/pear-tree'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.vim/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'songjiz/vim-monokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-abolish'
Plug 'andymass/vim-matchup'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'justinmk/vim-sneak'
Plug 'wellle/targets.vim'
Plug 'lambdalisue/gina.vim'
Plug 'airblade/vim-gitgutter'
Plug 'liuchengxu/vista.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'terryma/vim-multiple-cursors'
Plug 'kshenoy/vim-signature'
Plug 'ap/vim-css-color'
Plug 'janko/vim-test'
Plug 'rust-lang/rust.vim'
call plug#end()
" }}}

set nocompatible

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
" set relativenumber
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

" Windows {{{
if has('windows')
  " set fillchars=vert:\  " Beautify vertical splits
endif
" }}}

" Indent {{{
set autoindent
" set smartindent
" }}}

" Seaching {{{
set incsearch
set hlsearch
set ignorecase
set smartcase
set matchtime=1
" Enables interactive search and replace
if has('nvim')
  set inccommand=split
endif

" }}}

" No annoying {{{
set noerrorbells
set novisualbell
set nospell
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
" set showcmd
set cmdheight=1
set history=1000
" }}}

" Completion {{{
set path+=**                    " Include all subfolders in file completions
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

silent! call MakePath(&undodir)
silent! call MakePath(&backupdir)
silent! call MakePath(&directory)
silent! call MakePath('~/.vim/tmp/log/')
" }}}

" Folding and Concealing {{{
set nofoldenable
set foldlevelstart=99 " unfold everything by default
set foldmethod=marker
set foldnestmax=2
set foldcolumn=0

set conceallevel=0    " Don't conceal anything
" }}}

" Clipboard {{{
set clipboard^=unnamed,unnamedplus
" }}}

" Wrap {{{
set nolist
set wrap
set textwidth=79
set formatoptions=qn1 " See :help fo-table
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
set redrawtime=10000
" set regexpengine=1 " Some syntax files on the new regex engine cause vim to be slower

" set colorcolumn=80,120

" Prefer vertical orientation when using :diffsplit
set diffopt+=vertical

set listchars=tab:»·,trail:·,extends:⟩,precedes:⟨,eol:↩,nbsp:+
set showbreak=↪

set virtualedit=onemore
set viewoptions=folds,cursor,unix,slash

" Auto read file when a file is changed from outside
" Auto write a file when leaveing a modified buffer
set autoread
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
if !has("gui_running")
  let g:monokai_term_italic = 0
endif
colorscheme monokai
" }}}

function! WhichHighlightGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
" }}

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

  autocmd InsertEnter * setlocal nocursorline nolist
  autocmd InsertLeave * setlocal cursorline list

  " Unset paste on InsertLeave
  autocmd InsertLeave * set nopaste
  " autocmd FocusLost,TabLeave,BufLeave * silent! :wa | setlocal nocursorline

  " Check for external changes and reload buffer
  " autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if filereadable(bufname('%')) | checktime | setlocal cursorline

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
" Clear highlighted searches
nnoremap <silent> <Leader>/ :nohlsearch<CR>
" }}}

" Toglle paste mode
set pastetoggle=<F5>
" nnoremap <silent> <F5> :set invpaste<CR>

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

" Resize windows using <Alt> and h,j,k,l
nnoremap <silent> <M-h> <C-w><
nnoremap <silent> <M-l> <C-w>>
nnoremap <silent> <M-j> <C-W>-
nnoremap <silent> <M-k> <C-W>+

" Quit
inoremap <C-q>     <ESC>:q<CR>
nnoremap <C-q>     :q:<CR>
vnoremap <C-Q>     <ESC>
xnoremap <C-Q>     <ESC>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa!<CR>

" qq to record, Q to replay
nnoremap Q @q

" Center screen after navigation {{{
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

" Use <Cr> to select an item and do not add an annoying newline
inoremap <expr> <Cr> ((pumvisible())?("\<C-Y>"):("\<Cr>"))
" Use <Esc> to close auto-completion menu
inoremap <expr> <Esc> ((pumvisible())?("\<C-e>"):("\<Esc>"))
" }}}

" Verb c Change
" 1) cw     - change to next word
" 2) cc     - change entire line
" 3) ce     - change from cursor to end of word
" 4) c$     - change to end of line
" 5) ci"    - change inside of double quotes
" 6) ca"    - change around double quotes
" 7) cfx    - change until next found occurrence of letter x(search forward)
" 8) cFx    - change until next found occurrence of letter x(search backward)
" 9) cis    - change inside sentence
" 10) ci}   - change inside block
" 11) cip   - change inside paragraph
" 12) c/foo - change until next occurence of 'foo'

" Verb v - Visual
" 1) vap - select paragraph
" 2) V   - select line
" 3) vfx - select until next found occurence of letter x(search forward)
" 3) vFx - select until next found occurence of letter x(search backward)

" CTRL
" 1) v visual block mode
" 2) w window adjustments
" 3) r redo
" 4) b back one full screen
" 5) f forward one full screen
" 6) d forward half screen
" 7) u back half screen
" 8) [ built in <esc> mapping

" Change case
" 1) ~     change the case of current character
" 2) guu   change current line from upper to lower
" 3) gUU   change current LINE from lower to upper
" 4) guw   change to end of current WORD from upper to lower
" 5) guaw  change all of current WORD to lower
" 6) gUw   change to end of current WORD from lower to upper
" 7) gUaw  change all of current WORD to upper
" 8) g~~   Invert case to entire line

" gn/gN (n is forward, N is backward)
" run '/foo' to search the word 'foo', then type 'cgn', type the contents of
" replacement, then <Esc>, now press 'n.' to repeat the change for each
" subsequent match.

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
" cnoremap <UP>    <NOP>
" cnoremap <DOWN>  <NOP>
" cnoremap <LEFT>  <NOP>
" cnoremap <RIGHT> <NOP>

nnoremap <silent> <Leader>bg :let &background = (&background == "dark"? "light" : "dark")<CR>

" Move to begin/end of line
noremap B ^
noremap E $

" Copy the text from the cursor position to the end of line(like 'D' and 'C')
nnoremap Y y$

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" u is undo, U is redo
nnoremap U <C-r>

" Fast edit files in same directory
cabbr <expr> %% fnameescape(expand("%:p:h"))

" Fast newlines {{{
" use [<Space> and ]<Space> provided by unimpaired
" nnoremap <Leader>O O<Esc>j
" nnoremap <Leader>o o<Esc>k
" }}}

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
inoremap <S-Tab> <C-d>
" }}}

" Tab navigation {{{
" just like window navigation (<C-w> is for window)
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
" }}}

" Window split {{{
" 1) Ctrl-w s   Split
" 2) Ctrl-w v   Vsplit
" }}}

" Window navigation {{{
" 1) Ctrl-w j   Move to down window
" 2) Ctrl-w k   Move to up window
" 3) Ctrl-w h   Move to left window
" 4) Ctrl-w l   Move to right window
" 5) Ctrl-w R   Swap top/bottom or left/right split
" 6) Ctrl-w T   Break out current window into a new tabview
" 7) Ctrl-w o   Close every window in the current tabview but the current one
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Tab>   <C-w>w
nnoremap <S-tab> <C-w>W
" }}}

" Window resize {{{
" 1) Ctrl-w =   To resize all windows to equal dimensions based on their splits
" 2) Ctrl-w -   To decrease a window by one row
" 3) Ctrl-w +   To increase a window by one row
" 4) Ctrl-w _   To increase a window to its maximum height
" 5) Ctrl-w |   To incsearch a window to its maximum width
" 6) Ctrl-w >   To increase a window by one column
" 7) Ctrl-w <   To decrease a window by one column

 " 20<C-w>|     Set window width to 20 columns
 " 10<C-w>>     Increase window width by 10 columns
 " 10<C-w><     Decrease window width by 10 columns
 " 10<C-w>+     Increase window height by 10 columns
 " 10<C-w>-     Decrease window height by 10 columns
" }}}

" Quickly edit/reload the vimrc file {{{
nnoremap <silent> <Leader>ec :vsp $MYVIMRC<CR>
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
" zc — close the fold (where your cursor is positioned)
" zM — close all folds on current buffer
" zo — open the fold (where your cursor is positioned)
" zR — open all folds on current buffer
" zj — cursor is moved to next fold
" zk — cursor is moved to previous fold

nnoremap <Space> za
" }}}

" Buffer {{{
nnoremap <silent> <Leader>bn :bn<CR>
nnoremap <silent> ]b         :bn<CR>
nnoremap <silent> [b         :bp<CR>
nnoremap <silent> [B         :bp<CR>
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
" }}}

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
command! ToggleQf call <SID>toggle_qf()

" ferret support this feature
" function! QuickfixRemove()
"   let curqfidx = line('.') - 1
"   let qfall = getqflist()
"   call remove(qfall, curqfidx)
"   call setqflist(qfall, 'r')
"   execute curqfidx + 1 . "cfirst"
"   copen
" endfunction

nnoremap <silent> <F4> :ToggleQf<CR>
" }}}

function! s:todo()
  let entries = []
  for cmd in [
        \ 'git grep -niI -e TODO -e FIXME -e XXX 2> /dev/null',
        \ 'grep -rniI -e TODO -e FIXME -e XXX * 2> /dev/null'
        \ ]
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call <SID>todo()
nnoremap <silent> <F3> :Todo<CR>

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
command! -bang Profile call s:profile(<bang>0)

function! s:git_root()
  let l:root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' . l:root
    echo 'Changed directory to: ' . l:root
  endif
endfunction
command! GitRoot call s:git_root()

function! s:save_macro(name, file)
  let content = eval('@'.a:name)
  if !empty(content)
    call writefile(split(content, "\n"), a:file)
    echom len(content) . " bytes save to ". a:file
  endif
endfunction
command! -nargs=* SaveMacro call <SID>save_macro(<f-args>)

function! s:load_macro(file, name)
  let data = join(readfile(a:file), "\n")
  call setreg(a:name, data, 'c')
  echom "Macro loaded to @". a:name
endfunction
command! -nargs=* LoadMacro call <SID>load_macro(<f-args>)

function s:auto_mkdir(dir, force)
  if !isdirectory(a:dir)
    if a:force || confirm("'" . a:dir . "' does not exist. Create?", "&Yes\n&No", 2)
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endif
endfunction

command! -bang AutoMkdir call <SID>auto_mkdir(expand('%:p:h'), <bang>0)

function! s:syntax_stack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), ' > ')
endfunction
command! SyntaxStack call <SID>syntax_stack()

" Plugins config {{{

" FZF  {{{
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

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '20split enew' }

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

" Working only When fzf starts in a terminal buffer
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=228 ctermbg=236
  highlight fzf2 ctermfg=228 ctermbg=236
  highlight fzf3 ctermfg=228 ctermbg=236
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

augroup FZF
  autocmd!
  autocmd! FileType fzf
  if has('nvim') || has('gui_running')
    autocmd! User FzfStatusLine call <SID>fzf_statusline()
  endif
augroup END

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \   <q-args>,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%', '?'),
      \   <bang>0
      \ )

" command! -bang -nargs=* Ack
"       \ call fzf#vim#ag(
"       \   <q-args>,
"       \   <bang>0 ? fzf#vim#with_preview('up:60%')
"       \           : fzf#vim#with_preview('right:50%', '?'),
"       \   <bang>0
"       \ )

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

" vista & vim-lsp {{{
let g:vista_icon_indent = ["▸ ", ""]
let g:vista_default_executive = 'ctags'
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
      \   "function": "\uf794",
      \   "variable": "\uf71b",
      \  }
let g:vista_executive_for = {
      \ 'ruby': 'vim_lsp',
      \ }
let g:lsp_diagnostics_enabled = 0
if executable('solargraph')
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': { server_info -> [&shell, &shellcmdflag, 'solargraph stdio'] },
        \ 'initialization_options': { "diagnostics": "false" },
        \ 'whitelist': ['ruby'],
        \ })
endif

if executable('typescript-language-server')
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'typescript-language-server',
      \ 'cmd': { server_info -> [&shell, &shellcmdflag, 'typescript-language-server --stdio'] },
      \ 'root_uri':{ server_info -> lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json')) },
      \ 'whitelist': ['typescript', 'typescript.tsx', 'javascript', 'javascript.jsx'],
      \ })
endif
nnoremap <silent><F2> :Vista!!<CR>
" }}}

" ale {{{
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_set_signs = 0
let g:ale_sign_column_always = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
" Run linters only when I save files
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" }}}

" commentary {{{
"" }}}

" emmet {{{
" Press <Ctrl-Y>, to trigger
" let g:user_emmet_mode='n'    "only enable normal mode functions.
" let g:user_emmet_mode='inv'  "enable all functions, which is equal to
" let g:user_emmet_mode='a'    "enable all function in all mode.
" let g:user_emmet_leader_key='<C-Z>'
" }}}

" fugitive {{{
" nnoremap <Leader>gs :Gstatus<CR>
" nnoremap <Leader>gd :Gvdiff<CR>
" nnoremap <Leader>gc :Gcommit<CR>
" nnoremap <Leader>gb :Gblame<CR>
" nnoremap <Leader>gl :Glog<CR>
" nnoremap <Leader>gp :Gpush<CR>
" nnoremap <Leader>gr :Gread<CR>
" nnoremap <Leader>gw :Gwrite<CR>
" nnoremap <Leader>ge :Gedit<CR>

" Plug wants to lazy load everything but Fugitive can't be lazy loaded.
" Found this code at the link below.
" @link https://github.com/junegunn/vim-plug/issues/164#issuecomment-366483364
" command! Gstatus call LazyLoadFugitive('Gstatus') command! Gdiff call LazyLoadFugitive('Gdiff')
" command! Glog call LazyLoadFugitive('Glog')
" command! Gblame call LazyLoadFugitive('Gblame')

" function! LazyLoadFugitive(cmd)
"  call plug#load('vim-fugitive')
"  call fugitive#detect(expand('%:pwd'))
"  exe a:cmd
" endfunction
" }}}

" Gitgutter {{{
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_on_bufenter = 1
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'
let g:gitgutter_sign_modified_removed = '•'
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
  autocmd FileType gina-blame,gina-status noremap <silent>q :bd<CR>
augroup END
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger = "<C-e>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['ultisnips']
" }}}

" completor {{{
" Enable LSP
let g:completor_debug = 1
let g:completor_filetype_map = {
      \ 'ruby': { 'ft': 'lsp', 'cmd': 'solargraph stdio' },
      \ 'typescript': { 'ft': 'lsp', 'cmd': 'typescript-language-server --stdio' },
      \ 'javascript': { 'ft': 'lsp', 'cmd': 'typescript-language-server --stdio' },
      \ 'javascript.jsx': { 'ft': 'lsp', 'cmd': 'typescript-language-server --stdio' },
      \ 'rust': { 'ft': 'lsp', 'cmd': 'rls' }
      \ }

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:completor_auto_trigger = 0
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ completor#do('complete')
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

noremap <silent> <leader>d :call completor#do('definition')<CR>
noremap <silent> <leader>c :call completor#do('doc')<CR>
noremap <silent> <leader>f :call completor#do('format')<CR>
noremap <silent> <leader>s :call completor#do('hover')<CR>
" }}}

" Multiple Cursors {{{
let g:multi_cursor_use_default_mapping=0  " Turn off default key mappings
let g:multi_cursor_start_key='<Leader>mc' " Switch to multicursor mode with ,mc
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<ESC>'
" }}}

" test {{{
if has('nvim')
  let test#strategy = "neovim"
else
  let test#strategy = "dispatch"
endif
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR><Paste>
" }}}

" signature {{{
" m[a-zA-Z] add mark
" " '[a-zA-Z] go to mark
" " m<Space>  del all marks
nnoremap <Leader>mm :SignatureToggle<CR>
nnoremap <Leader>mr :SignatureRefresh<CR>
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
let g:lightline.colorscheme='monokai'

" let g:lightline#ale#indicator_checking = "\uf141"
" let g:lightline#ale#indicator_warnings = "\uf071"
" let g:lightline#ale#indicator_errors = "\uf05e"
" let g:lightline#ale#indicator_ok = "\uf058 "

let g:lightline.component_function = {
      \ 'gitbranch': 'LightlineGitBranch',
      \ 'githunks': 'LightlineGitHunks',
      \ 'lint': 'LightlineALELint',
      \ 'filesize': 'LightlineFileSize',
      \ }
let g:lightline.active = {
      \ 'left': [['mode', 'paste'], ['gitbranch', 'githunks', 'filename', 'readonly', 'modified']],
      \ 'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype', 'lint']],
      \ }
let g:lightline.inactive = {
      \ 'left': [['filename', 'readonly', 'modified']],
      \ 'right': [['lineinfo'], ['percent']]
      \ }

augroup Lightline
  autocmd!
  autocmd ColorScheme * call LightlineColorschemeUpdate()
  autocmd User ALEJobStarted call lightline#update()
  autocmd User ALELintPost call lightline#update()
  autocmd User ALEFixPost call lightline#update()
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
  if !get(g:, 'gitgutter_enabled', 0)
    return ''
  end
  let s:hunk_signs = get(g:, 'lightline#hunks#signs', ['+', '~', '-'])
  let hunks = GitGutterGetHunkSummary()
  let summary = ''

  for i in [0, 1, 2]
    if winwidth(0) > 100
      let summary .= printf('%s%s', s:hunk_signs[i], hunks[i]).' '
    endif
  endfor
  return summary
endfunction

function! LightlineALELint() abort
  let l:indicator_warnings = get(g:, 'lightline#ale#indicator_warnings', 'W: ')
  let l:indicator_errors = get(g:, 'lightline#ale#indicator_errors', 'E: ')
  let l:indicator_ok = get(g:, 'lightline#ale#indicator_ok', 'OK')
  let l:indicator_checking = get(g:, 'lightline#ale#indicator_checking', 'Linting...')
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  if ale#engine#IsCheckingBuffer(bufnr(''))
    return l:indicator_checking
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

" vim: sw=2 sts=2 tw=0 fdm=marker
