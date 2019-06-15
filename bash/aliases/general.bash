# Change directory
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias ~="cd ~"
alias -- -="cd -"

# List directory contents
alias lsa="ls -lah"
alias l="ls -lah"
alias l.="ls -d .*"
alias ll="ls -lh"
alias la="ls -lAh"

alias c="clear"
alias h="history"

# Make directory
alias md="mkdir -p"

# Create a new directory and enter it
function mdcd() {
  mkdir -p "$@" && cd "$@"
}

# Permission
alias +x="chmod +x"
alias 000="chmod 000" # ---------- (nobody)
alias 640="chmod 640" # -rw-r----- (user: rw, group: r, other: -)
alias 644="chmod 644" # -rw-r--r-- (user: rw, group: r, other: -)
alias 755="chmod 755" # -rwxr-xr-x (user: rwx, group: rx, other: x)
alias 775="chmod 775" # -rwxrwxr-x (user: rwx, group: rwx, other: rx)
alias mx="chmod a+x"  # ---x--x--x (user: --x, group: --x, other: --x)
alias ux="chmod u+x"  # ---x------ (user: --x, group: -, other: -)

# `top` invocation to minimize resources
alias ttop="top -R -F -s 10 -o rsize"

alias dud="du -d 1 -h" # Short and human-readable directory listing
alias duf="du -sh *"   # Short and human-readable file listing

# Show/Hide hidden files in Finder
if [[ $(uname -s) =~ "Darwin" ]]; then
  alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
  alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"
fi

# Network
alias ip0="curl icanhazip.com"
alias ip1="echo $(ifconfig en0 inet | grep 'inet ' | awk '{ print $2 }')"

# [[ `which nvim` ]] && alias vim="nvim"
alias e="vim"
alias v="vim"
alias vi="vim"
alias svim="sudo vim"
alias reload="source $HOME/.bashrc"
alias fuckgfw="vim ~/.config/clash/config.yml"
alias export-proxy="export https_proxy=http://127.0.0.1:7890;export http_proxy=http://127.0.0.1:7890;export all_proxy=socks5://127.0.0.1:0"
alias unset-proxy="unset https_proxy; unset https_proxy; unset all_proxy"
