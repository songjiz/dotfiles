# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simple"
# ZSH_THEME="robbyrussell"

# oh-my-zsh overrides the prompt, so Pure must be activated after `source $ZSH/oh-my-zsh.sh`
# autoload -U promptinit; promptinit
# prompt pure

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git cargo rails asdf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias e="vim"
alias v="vim"
alias vi="vim"
alias reload="source $HOME/.zshrc"
alias fuckgfw="vim ~/.config/Surge/Documents/Default.conf"
alias proxy="export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152;export all_proxy=socks5://127.0.0.1:6153"
alias noproxy="unset https_proxy; unset https_proxy; unset all_proxy"
alias dotfiles="cd ~/.dotfiles && vim"

alias cl="curl -L"
# Follow redirects and download as original name
alias clo="curl -O -L"
# Show Headers
alias clh="curl -D - -so /dev/null"

# Permission
alias x="chmod +x"
alias 000="chmod 000" # ---------- (nobody)
alias 600="chmod 600" # -rw------- (user: rw, group: -, other: -)
alias 640="chmod 640" # -rw-r----- (user: rw, group: r, other: -)
alias 644="chmod 644" # -rw-r--r-- (user: rw, group: r, other: -)
alias 755="chmod 755" # -rwxr-xr-x (user: rwx, group: rx, other: x)
alias 775="chmod 775" # -rwxrwxr-x (user: rwx, group: rwx, other: rx)
alias mx="chmod a+x"  # ---x--x--x (user: --x, group: --x, other: --x)
alias ux="chmod u+x"  # ---x------ (user: --x, group: -, other: -)

alias ttop="top -R -F -s 10 -o rsize"

# Short and human-readable directory listing
alias dud="du -d 1 -h"
# Short and human-readable file listing
alias duf="du -sh *"

# Show SSH key and generate it if necessary
function ssh-key() {
  local file="$HOME/.ssh/id_rsa.pub"
  if [ ! -f "$file" ]; then
    ssh-keygen -t rsa
  fi

  cat "$file"
}

alias rce="rails credentials:edit"
alias rced="rails credentials:edit --environment development"
alias rcep="rails credentials:edit --environment production"
alias rcet="rails credentials:edit --environment test"
function rdmd() {
  rake db:migrate:down VERSION=$@
}
function rdmu() {
  rake db:migrate:up VERSION=$@
}
alias hosts="sudo vim /etc/hosts"
alias dev="cd ~/Developer"
alias whatsmyip='curl -w "\n" -s https://api.ipify.org'
alias whatsmyipv6='curl -w "\n" -s https://api64.ipify.org'

[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
