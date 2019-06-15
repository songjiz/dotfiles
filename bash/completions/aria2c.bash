#!/usr/bin/env bash
# Bash completion support for `aria2c` command.

if which aria2c >/dev/null 2>&1; then
  if [[ -r "/usr/local/etc/bash_completion.d/aria2c" ]]; then
    source "/usr/local/etc/bash_completion.d/aria2c"
  fi
fi
