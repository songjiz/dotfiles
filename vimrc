" Plugins {{{
if filereadable(expand('~/.vim/pack.vim'))
  source ~/.vim/pack.vim
endif
" }}}

" Basic {{{
set nocompatible
set title
" Don't show startup splash screen
set shortmess+=I

syntax on
set noshowmode
set showmatch
set cursorline
set nojoinspaces
set scrolloff=5

set signcolumn=yes

set ttyfast
set lazyredraw
set redrawtime=2000
set updatetime=300
set ttimeout
set timeoutlen=1000
set ttimeoutlen=1

" Prefer vertical orientation
set diffopt+=vertical

set switchbuf=useopen

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

" Filetype
filetype on
filetype plugin on
filetype indent on

" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf8

" Line Number
set number
set relativenumber

" Tabs And Spaces
set smarttab
set expandtab
set shiftround
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start

" Indent
set autoindent
set smartindent

" Seaching
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase
set gdefault
set matchpairs+=<:>
set matchpairs+=《:》
set matchpairs+=（:）
set matchpairs+=【:】
set matchpairs+=“:”
set matchpairs+=‘:’

" Split
set splitbelow
set splitright

" Always show tatus line and tab bar
set showtabline=2
set laststatus=2

set ruler

" Command line
set showcmd
set cmdheight=1
set history=1000

" Completion
set wildmenu
set wildmode=list:longest,full
set pumheight=12
set completeopt=menu,preview

set tags+=.git/tags

" Ignore Files
set wildignore+=.DS_Store,*.keep,*.swp,*.bak,*.log
set wildignore+=.git,.svn,.hg
set wildignore+=.bundle,node_modules,build,dist,target,tmp
set wildignore+=*.rbc,.rbx,*.scssc,*.sassc,.sass-cache,*pyc,*.o,*.gem
set wildignore+=*.jpg,*jpeg,*.tiff,*.gif,*.png,*.svg,*.psd,*.pdf
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ttf,*.otf
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=tags

" Swap
set noswapfile
set directory=~/.vim/cache/swap//
if has('win32') || has('win64')
  set directory-=~/.vim/cache/swap//
  set directory=~/vimfiles/cache/swap//
endif
silent! call mkdir(iconv(&directory, &encoding, &termencoding), 'p')

" Undo
set undofile
set undoreload=1000
set undolevels=1000
set undodir=~/.vim/cache/undo//
if has('win32') || has('win64')
  set undodir-=~/.vim/cache/undo//
  set undodir=~/vimfiles/cache/undo//
endif
silent! call mkdir(iconv(&undodir, &encoding, &termencoding), 'p')

" Backup
set nobackup
set nowritebackup
set backupdir=~/.vim/cache/backup//
if has('win32') || has('win64')
  set backupdir-=~/.vim/cache/backup
  set backupdir=~/vimfiles/cache/backup
endif
silent! call mkdir(iconv(&backupdir, &encoding, &termencoding), 'p')

set backupskip^=/dev/shm/*  " Shared memory RAM disk
set backupskip^=/var/tmp/*  " Debian's $TMPDIR for sudoedit(8)
if !has('unix')
  set backupskip-=/dev/shm/*
  set backupskip-=/var/tmp/*
endif

" Folding
set nofoldenable
set foldnestmax=3

" Wrap
set list
set wrap
set whichwrap+=<,>,[,]
set textwidth=79
set colorcolumn=100
set listchars=leadmultispace:\┊\ ,tab:┊\ ,trail:∙,extends:»,precedes:«,nbsp:∅
set showbreak=↪\
" }}}

" Theme {{{
" Show block cursor in Normal mode and line cursor in Insert mode
let &t_ti.="\e[2 q"
let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"
let &t_te.="\e[0 q"

" Support italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Enable true color
if has('gui_running') || $COLORTERM ==# 'truecolor'
  set termguicolors
else
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set t_Co=256
endif

augroup colorscheme
  autocmd!
  if !has("gui_running")
    autocmd ColorScheme * highlight Normal ctermbg=NONE
    autocmd ColorScheme * highlight TabLineSel ctermbg=NONE
  end
  autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
        \ | highlight NonText guibg=NONE ctermbg=NONE
        \ | highlight VertSplit guibg=NONE ctermbg=NONE
        \ | highlight LineNr guibg=NONE ctermbg=NONE
        \ | highlight GitGutterAdd guibg=NONE ctermbg=NONE
        \ | highlight GitGutterChange guibg=NONE ctermbg=NONE
        \ | highlight GitGutterDelete guibg=NONE ctermbg=NONE
        \ | highlight GitGutterChangeDelete guibg=NONE ctermbg=NONE
augroup END

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
colorscheme monokai
" }}}

" Auto Commands {{{
augroup common
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC

  " Restore cursor to file position in previous editing session
  autocmd BufWinEnter *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "silent! normal! g`\"" |
        \ endif

  autocmd FocusGained * checktime

  autocmd InsertEnter * setlocal nolist
  autocmd InsertLeave * setlocal list nopaste

  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set relativenumber   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set norelativenumber | endif

  " Delete trailing white spaces
  autocmd BufWritePre * :%s/\s\+$//e

  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch

  autocmd BufWritePre,FileWritePre * silent! call mkdir(iconv(expand('<afile>:p:h'), &encoding, &termencoding), 'p')

  " Auto switch to insert mode when focusing on terminal window
  autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif
  autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! IndentLinesDisable | endif

  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd VimResized * call ResizeWindows()
augroup END

" }}}

" Key Mappings {{{
let mapleader = "\<Space>"

" line textobjects il,al
xnoremap il g_o^
onoremap il :<C-u>normal vil<CR>
xnoremap al $o0
onoremap al :<C-u>normal val<CR>

" buffer textobjects i%,a%
xnoremap i% :<C-u>let z = @/\|1;/^./kz<CR>G??<CR>:let @/ = z<CR>V'z
onoremap i% :<C-u>normal vi%<CR>
xnoremap a% GoggV
onoremap a% :<C-u>normal va%<CR>

" comment textobjects i/,a/
omap a/ <Plug>(textobj-comment-a)
xmap a/ <Plug>(textobj-comment-a)
omap i/ <Plug>(textobj-comment-i)
xmap i/ <Plug>(textobj-comment-i)

nnoremap gK K
nnoremap J mzJ`z
" J is join, K is break
" A space is replaced with a carriage return; otherwise a carriage return is inserted.
nnoremap <expr> K getline('.')[col('.') - 1] == ' ' ? "r<CR>" : "i<CR><ESC>l"

" Alt key (Must disable 'Use Option as Meta Key' in terminal.app)
" ˙ <A-h>
" ∆ <A-j>
" ˚ <A-k>
" ¬ <A-l>
" ƒ <A-f>
" ∫ <A-b>
" “ <A-]>

" Fast move current line down/up in edit mode
inoremap <C-k> <ESC>:move .-2<CR>==gi
inoremap <C-j> <ESC>:move .+1<CR>==gi
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv

" Ctrl-j/k navigation in popups
" inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" inoremap <expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"
" Tab completion
inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Let mark go to column
nnoremap ' `

nnoremap ; :
nnoremap : ;
nnoremap ! :!

" Toggle paste mode
set pastetoggle=<F5>

vmap v <ESC>

" In terminal mode, <C-w> is leader key
tnoremap <C-[> <C-\><C-n>
if has('mac')
  tnoremap ∆ <C-w>j
  tnoremap ˚ <C-w>k
  tnoremap ˙ <C-w>h
  tnoremap ¬ <C-w>l
  nnoremap ÷ :terminal ++close<CR>
  nnoremap « :vertical terminal ++close<CR>
else
  tnoremap <A-j> <C-w>j
  tnoremap <A-k> <C-w>k
  tnoremap <A-h> <C-w>h
  tnoremap <A-l> <C-w>l
  nnoremap <A-/> :terminal ++close<CR>
  nnoremap <A-\> :vertical terminal ++close<CR>
endif

" Insert mode navigation like terminal
" Move one character backward
inoremap <C-b> <C-o>h
" Move one character forward
inoremap <C-f> <C-o>l
if has('mac')
  inoremap ∫ <C-o>b
  inoremap ƒ <C-o>e
else
  inoremap <A-b> <C-o>b
  inoremap <A-e> <C-o>e
endif
" Move to start of the line
inoremap <C-a> <C-o>^
" Move to end of the line
inoremap <C-e> <C-o>$
" Delete one character forward
inoremap <C-d> <Delete>
" Undo
inoremap <C-/> <C-o>u
inoremap <C-_> <C-o>u
" Redo
inoremap <C-=> <C-o><C-r>

" zoom-in/out
nnoremap <silent>Zi <C-w>_ \| <C-w>\|
nnoremap <silent>Zo <C-w>=

" Window split
nnoremap <silent><Leader>sh :leftabove vnew<CR>
nnoremap <silent><Leader>sl :rightbelow vnew<CR>
nnoremap <silent><Leader>sk :leftabove new<CR>
nnoremap <silent><Leader>sj :rightbelow new<CR>

" Window navigation
" nnoremap <silent><C-h> <C-w>h
" nnoremap <silent><C-l> <C-w>l
" nnoremap <silent><C-j> <C-W>j
" nnoremap <silent><C-k> <C-W>k
nnoremap <silent><Leader>1 :1wincmd w<CR>
nnoremap <silent><Leader>2 :2wincmd w<CR>
nnoremap <silent><Leader>3 :3wincmd w<CR>
nnoremap <silent><Leader>4 :4wincmd w<CR>
nnoremap <silent><Leader>5 :5wincmd w<CR>
nnoremap <silent><Leader>6 :6wincmd w<CR>
nnoremap <silent><Leader>7 :7wincmd w<CR>
nnoremap <silent><Leader>8 :8wincmd w<CR>
nnoremap <silent><Leader>9 :9wincmd w<CR>

" qq to record, Q to replay
nnoremap Q @q

" Center screen after navigation
nnoremap }   }zz
nnoremap {   {zz

" Recenter when jump back
nnoremap <C-o> <C-o>zz

" Center highlighted search
nnoremap n  nzzzv
nnoremap N  Nzzzv
nnoremap *  *zzzv
nnoremap #  #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv
nnoremap G  Gzzzv

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

" Windows resize
noremap  <Up>    :resize +2<CR>
noremap  <Down>  :resize -2<CR>
noremap  <Left>  :vertical resize +2<CR>
noremap  <Right> :vertical resize -2<CR>
function! ResizeWindows()
  let savetab = tabpagenr()
  tabdo wincmd =
  execute 'tabnext' savetab
endfunction

" Disable arrow keys
inoremap <UP>    <NOP>
inoremap <DOWN>  <NOP>
inoremap <LEFT>  <NOP>
inoremap <RIGHT> <NOP>
cnoremap <UP>    <NOP>
cnoremap <DOWN>  <NOP>
cnoremap <LEFT>  <NOP>
cnoremap <RIGHT> <NOP>

" Move cursor in command mode like in terminal
cnoremap <C-j> <Down>
cnoremap <C-k> <UP>
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>
cnoremap <C-p> <UP>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-h> <Backspace>

nnoremap <silent> <Leader>bg :let &background = (&background == "dark"? "light" : "dark")<CR>

" Copy the text from the cursor position to the end of line(like 'D' and 'C')
nnoremap Y y$

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" u is undo, U is redo
nnoremap U <C-r>
" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Fast edit files in same directory
cabbr <expr> %% fnameescape(expand("%:p:h"))
nnoremap <Leader>e :e <C-R>=fnameescape(expand("%:p:h")) . '/'<CR>
nnoremap <Leader>t :tabe <C-R>=fnameescape(expand("%:p:h")) . '/'<CR>
nnoremap <Leader>s :sp <C-R>=fnameescape(expand("%:p:h")) . '/'<CR>
nnoremap <Leader>v :vsp <C-R>=fnameescape(expand("%:p:h")) . '/'<CR>

" Indenting
vnoremap < <gv
vnoremap > >gv
xnoremap < <gv
xnoremap > >gv

" Tab navigation
nnoremap <silent><Tab>   gt
nnoremap <silent><S-Tab> gT

" <C-w>T move buffer to new tab
" <C-w>U merge a tab into a split in the previous window
nnoremap <silent><C-w>U :TabMerge<CR>

" Quickly edit/reload the vimrc file
nnoremap <silent> <Leader>vc :tabe $MYVIMRC<CR>
nnoremap <silent> <Leader>vu :tabe ~/.vimrc.local<CR>
nnoremap <silent> <Leader>rc :silent update $MYVIMRC <Bar> source $MYVIMRC<CR>
nnoremap <silent> <Leader>pi :source $MYVIMRC <Bar> PlugInstall<CR>
nnoremap <silent> <Leader>pu :source $MYVIMRC <Bar> PlugUpdate<CR>
nnoremap <silent> <Leader>pc :source $MYVIMRC <Bar> PlugClean<CR>

" Buffer
nnoremap <Leader>; :silent bn<CR>:file<CR>
nnoremap <Leader>, :silent bp<CR>:file<CR>
nnoremap <silent> <Leader>bp :bp<CR>
nnoremap <silent> <Leader>bn :bn<CR>
nnoremap <silent> <Leader>bw :w<CR>:bd<CR>
nnoremap <silent> <Leader>bd :w<CR>:bd!<CR>
nnoremap <silent> <Leader>ba :1,bd!<CR>
nnoremap <silent> <Leader>w  :w!<CR>
nnoremap <silent> <Leader>q  :q!<CR>
nnoremap <silent> <Leader>x  :x!<CR>
" nnoremap <silent> <Leader>lb :ls<CR>:buffer<SPACE>

" Save file as root.
cnoremap w!! w !sudo tee % > /dev/null<CR>

" Toggle between last open buffers
nnoremap <Leader><Space> <C-^>

nnoremap <silent><Leader><CR> :nohlsearch<CR>

command! Q q
command! Qa qall
command! QA qall
command! E e
command! W w

" folding
noremap <silent>z0 :set foldlevel=0<CR>
noremap <silent>z1 :set foldlevel=1<CR>
noremap <silent>z2 :set foldlevel=2<CR>
noremap <silent>z3 :set foldlevel=3<CR>
noremap <silent>z4 :set foldlevel=4<CR>
noremap <silent>z5 :set foldlevel=5<CR>
noremap <silent>z6 :set foldlevel=6<CR>
noremap <silent>z7 :set foldlevel=7<CR>
noremap <silent>z8 :set foldlevel=8<CR>
noremap <silent>z9 :set foldlevel=9<CR>

" sessions
let g:sessions_dir = '$HOME/.vim/cache/sessions'
nnoremap <Leader>ss :mksession! <C-R>=expand(g:sessions_dir) . '/'<CR>
nnoremap <Leader>sr :source <C-R>=expand(g:sessions_dir) . '/'<CR>
nnoremap <Leader>sd :!rm <C-R>=expand(g:sessions_dir) . '/'<CR>
silent! call mkdir(iconv(expand(g:sessions_dir), &encoding, &termencoding), 'p')

nmap <silent><Leader>n <Plug>(rename-buf)

command! FuckGFW :tabe ~/.config/Surge/Documents/Default.conf

" Copy file name
nnoremap <silent><Leader>cf :let @*=expand("%:t")<CR>
nnoremap <silent><Leader>cp :let @*=expand("%:p")<CR>

" Quickfix / Localtion List
nnoremap <silent> <Leader>cw :cwindow<CR>
nnoremap <silent> <Leader>lw :lwindow<CR>
nnoremap <silent> <Leader>co :copen<CR>
nnoremap <silent> <Leader>lo :lopen<CR>
nnoremap <silent> <Leader>cc :cclose<CR>
nnoremap <silent> <Leader>lc :lclose<CR>
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz

" }}}

" Plugins config {{{

"               ┌ filename
"               │  ┌ line nr
"               │  │  ┌ column nr
"               │  │  │  ┌ error message
"               │  │  │  │
set grepformat=%f:%l:%c:%m,%f:%l:%m
"   │
"   └ default value:  %f:%l:%m,%f:%l%m,%f  %l%m
if executable('rg')
  let s:rg_cmd = "rg --hidden --follow --smart-case --no-ignore-messages --vimgrep "
  let s:rg_ignore = split(&wildignore, ',')
  let s:rg_cmd .= " --glob '!{'" . shellescape(join(s:rg_ignore, ',')) . "'}'"
  let &grepprg = s:rg_cmd . ' '
  let $FZF_DEFAULT_COMMAND=s:rg_cmd . ' --files'
else
  let &grepprg="grep -n --with-filename -I -R "
endif

command! Ctags !ctags --tag-relative=yes --extras=+f -Rf.git/tags .
nnoremap <Leader>rt :Ctags<CR><CR>

" FZF {{{
let $FZF_DEFAULT_OPTS = "--layout=reverse --inline-info --bind ctrl-a:select-all,ctrl-d:deselect-all"

" Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" Command to generate tags file
let g:fzf_tags_command = 'noglob ctags --tag-relative=yes --extras=+f -Rf.git/tags'
" Disable preview window
let g:fzf_preview_window = ''

" Extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tabedit',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-y': { lines -> setreg('*', join(lines, "\n")) }
      \ }

let g:fzf_layout = {
      \   'up': '80%',
      \   'window': {
      \     'width': 0.9,
      \     'height': 0.8,
      \     'yoffset': 0.5,
      \     'xoffset': 0.5,
      \     'highlight': 'Constant',
      \     'border': 'sharp'
      \   }
      \ }

" Customize fzf colors to match color scheme
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }

command! -bang -nargs=* Grep call
      \ fzf#vim#grep(
      \   &grepprg . ' --color=always ' . shellescape(<q-args>),
      \   1,
      \   <bang>0
      \ )

nnoremap <silent> <C-p>        :Files<CR>
nnoremap <silent> <Leader>fG   :GFiles<CR>
nnoremap <silent> <Leader>fg   :GFiles?<CR>
nnoremap <silent> <Leader>fC   :Commits<CR>
nnoremap <silent> <Leader>fc   :BCommits<CR>
nnoremap <silent> <Leader>fb   :Buffers<CR>
nnoremap <silent> <Leader>f;   :Commands<CR>
nnoremap <silent> <Leader>fk   :Helptags<CR>
nnoremap <silent> <Leader>fh   :History<CR>
nnoremap <silent> <Leader>fL   :Lines<CR>
nnoremap <silent> <Leader>fl   :BLines<CR>
nnoremap <silent> <Leader>fT   :Tags<CR>
nnoremap <silent> <Leader>ft   :BTags<CR>
nnoremap <silent> <Leader>fm   :Maps<CR>
nnoremap <silent> <Leader>f'   :Marks<CR>
nnoremap <silent> <Leader>fm   :Marks<CR>
nnoremap <silent> <Leader>fw   :Windows<CR>
nnoremap \w :Grep <C-r><C-w><CR>
vnoremap \v ""y:Grep <C-R>=escape(@", '/\')<CR><CR>
nnoremap \\ :Grep<Space>
" }}}

" dash {{{
nmap <silent><Leader>ds <Plug>DashSearch
" }}}

" open-browser {{{
nmap <silent>gx <Plug>(openbrowser-smart-search)
vmap <silent>gx <Plug>(openbrowser-smart-search)
" }}}

" Fern {{{
let g:fern#drawer_width=40
nnoremap <silent> <Leader>nn :Fern . -drawer -toggle<CR>
nnoremap <silent> - :Fern . -drawer -reveal=%<CR>
augroup FernExplorerCustom
  autocmd!
  autocmd FileType fern setl nonumber
augroup END
" }}}

" ale {{{
let g:ale_set_signs = 0
let g:ale_sign_column_always = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%][%severity%] %code: %%s'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 0
let g:ale_linters_explicit = 1
let g:ale_lint_delay = 1000
nmap <silent><Leader>aF <Plug>(ale_previous_wrap)
nmap <silent><Leader>af <Plug>(ale_next_wrap)
" }}}

" Gitgutter {{{
let g:gitgutter_enabled = 1
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_signs = 1
nnoremap <silent><Leader>gg :GitGutterToggle<CR>
nnoremap <silent><Leader>hs :GitGutterStageHunk<CR>
nnoremap <silent><Leader>hu :GitGutterUndoHunk<CR>
nnoremap <silent><Leader>hp :GitGutterPreviewHunk<CR>
" }}}

" fugitive {{{
nnoremap <silent><Leader>gs :Git status<CR>
nnoremap <silent><Leader>gb :Git blame<CR>
nnoremap <silent><Leader>gB :GBrowse<CR>
nnoremap <silent><Leader>gc :Git commit<CR>
nnoremap <silent><Leader>gm :Git merge<CR>
nnoremap <silent><Leader>gr :Gread<CR>
nnoremap <silent><Leader>gw :Gwrite<CR>
nnoremap <silent><Leader>gd :Gdiffsplit<CR>
nnoremap <silent><Leader>gD :GDelete<CR>
nnoremap <silent><Leader>gp :Git push<CR>
nnoremap <silent><Leader>gl :Git pull<CR>
nnoremap <silent><Leader>gf :Git fetch<CR>
nnoremap <silent><Leader>ge :Gedit<CR>
nnoremap <silent><Leader>glg :Git log<CR>
nmap <silent><Leader>gR <Plug>(git-root)
" }}}

" vim-vsnip {{{
" Expand or Jump forward
imap <expr> <Tab> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
smap <expr> <Tab> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'

" Jump backward
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
" }}}

" vim-gutentags {{{
let g:gutentags_project_root = ['.svn', '.git', '.hg']
" }}}

" vim-test {{{
nnoremap <silent> t<C-n> :wa\|:TestNearest<CR>
nnoremap <silent> t<C-f> :wa\|:TestFile<CR>
nnoremap <silent> t<C-a> :wa\|:TestSuite<CR>
nnoremap <silent> t<C-l> :wa\|:TestLast<CR>
nnoremap <silent> t<C-g> :wa\|:TestVisit<CR>
" }}}

" easy-align {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap gA <Plug>(LiveEasyAlign)
xmap gA <Plug>(LiveEasyAlign)
" }}}

" lightline {{{
let g:lightline = {
      \   'colorscheme': 'powerline',
      \   'component': {
      \     'percent': '%p%%',
      \     'lineinfo': '%3l:%-2v',
      \   },
      \   'component_function': {
      \     'gitBranch': 'lightline#gitBranch',
      \     'gitHunks': 'lightline#gitHunks',
      \     'aleStatus': 'lightline#aleStatus',
      \     'absolutepath': 'lightline#absPath'
      \   },
      \   'active': {
      \     'left': [
      \       ['mode', 'paste'],
      \       ['readonly', 'filename']
      \     ],
      \     'right': [
      \       ['lineinfo', 'aleStatus'],
      \       ['filetype', 'percent'],
      \       ['gitHunks', 'fileencoding'],
      \       ['gitBranch']
      \     ],
      \   },
      \   'inactive': {
      \     'left': [
      \       ['filename']
      \     ],
      \     'right': [
      \       ['lineinfo'],
      \       ['filetype', 'percent'],
      \       ['fileencoding']
      \     ]
      \   }
      \ }

autocmd User GitGutter,GitGutterStage call lightline#update()
" }}}

" }}}

" Local config {{{
if filereadable(expand('~/.vimrc.local'))
  source  ~/.vimrc.local
endif
" }}}

" vim: sw=2 sts=2 tw=0 fdm=marker
