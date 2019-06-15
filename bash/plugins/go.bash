[ ! command -v go &> /dev/null ] && return

export GOROOT=${GOROOT:-$(go env GOROOT)}
export GOPATH=${GOPATH:-$(go env GOPATH)}
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:$GOPATH/bin"
