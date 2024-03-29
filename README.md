# Install

```bash
git clone --recurse-submodules https://github.com/songjiz/dotfiles ~/.dotfiles
```

Install dependencies

```bash
brew install ctags
# brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install ripgrep
# brew install the_silver_searcher
brew install fzf
```

# zsh

```bash
ln -s ~/.dotfiles/zsh/ohmyzsh ~/.oh-my-zsh
ln -sf ~/.dotfiles/zsh/simple.zsh-theme ~/.oh-my-zsh/custom/themes/simple.zsh-theme
ln -s ~/.dotfiles/zshrc ~/.zshrc
```

# Vim

```bash
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
```

# Neovim

```bash
brew install luarocks
luarocks install luautf8

ln -s ~/.dotfiles/nvim ~/.config/nvim
```

# Sublime Text 3

```bash
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
ln -s ~/.dotfiles/sublime  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
```

# Sublime Text 4

```bash
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
ln -s ~/.dotfiles/sublime  ~/Library/Application\ Support/Sublime\ Text/Packages/User
```
