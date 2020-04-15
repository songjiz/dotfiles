if !filereadable(expand('~/.vim/autoload/plug.vim'))
  echo "Installing vim-plug ..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim
          \ --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd! VimEnter * PlugInstall --sync | quit | source $MYVIMRC
endif

call plug#begin('~/.vim/pack')
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.vim/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tmsvg/pear-tree'
Plug 'janko/vim-test'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'cespare/vim-toml'

Plug 'crusoexia/vim-monokai'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" Enable built-in matchit plugin
if has('packages') && !has('nvim')
  packadd matchit
else
  silent! runtime macros/matchit.vim
endif
