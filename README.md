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
brew install bat
```

# zsh

```bash
ln -s ~/.dotfiles/zsh/pure/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
ln -s ~/.dotfiles/zsh/pure/async.zsh /usr/local/share/zsh/site-functions/async
ln -s ~/.dotfiles/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s ~/.dotfiles/zshrc ~/.zshrc
```

# Vim

```bash
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
```

# Sublime Text 3

```bash
ln -s /Applications/Sublime Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
ln -s ~/.dotfiles/sublime  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
```

# vscode

```bash
ln -s ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```
