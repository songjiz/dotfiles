#!/usr/bin/env bash
# Bash completion support for `killall` command.

_killall() {
  local cur prev
  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}

  #  Get a list of processes
  #+ (the first sed evaluation
  #+ takes care of swapped out processes, the second
  #+ takes care of getting the basename of the process).
  COMPREPLY=( $( ps -u $USER -o comm  | \
    sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
    awk '{if ($0 ~ /^'$cur'/) print $0}' ))

  return 0
}

complete -F _killall killall
