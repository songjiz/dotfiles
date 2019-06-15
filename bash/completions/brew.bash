#!/usr/bin/env bash
# Bash completion support for `brew` command.

if which brew >/dev/null 2>&1; then
  if [ -r "`brew --prefix`/Homebrew/completions/bash/brew" ]; then
    source "`brew --prefix`/Homebrew/completions/bash/brew"
  fi
fi
