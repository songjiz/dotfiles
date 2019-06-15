#!/usr/bin/env bash

if [[ -x $(which curl) ]]; then
  alias cl="curl -L"
  alias clo="curl -O -L"							#  Follow redirects and download as original name
  alias clh="curl -D - -so /dev/null" # Show Headers
fi

# Show HTTP headers for given URL
function headers() {
  curl -sv -H "User-Agent: Mozilla/5 Gecko" "$@" 2>&1 >/dev/null |
    grep -v "^\*" |
    grep -v "^}" |
    cut -c3-
}
