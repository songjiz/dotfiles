#!/usr/bin/env bash
# Bash completion support for `ssh` `scp` and `sftp` command.

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_sshcomplete() {
  local CURRENT_PROMPT="${COMP_WORDS[COMP_CWORD]}"
  if [[ ${CURRENT_PROMPT} == *@*  ]] ; then
    local OPTIONS="-P ${CURRENT_PROMPT/@*/}@ -- ${CURRENT_PROMPT/*@/}"
  else
    local OPTIONS=" -- ${CURRENT_PROMPT}"
  fi

  # parse all defined hosts from .ssh/config
  if [ -r "$HOME/.ssh/config" ]; then
    COMPREPLY=($(compgen -W "$(cat $HOME/.ssh/config | grep 'Host ' | sort | uniq | cut -d' ' -f2)" ${OPTIONS}) )
  fi

  # parse all hosts found in .ssh/known_hosts
  if [ -r "$HOME/.ssh/known_hosts" ]; then
    COMPREPLY=( ${COMPREPLY[@]} $(compgen -W "$(cat ~/.ssh/known_hosts  | cut -d ' ' -f1 | grep ',' | cut -d ',' -f1)" ${OPTIONS}) )
  fi

  # parse hosts defined in /etc/hosts
  if [ -r /etc/hosts ]; then
    COMPREPLY=( ${COMPREPLY[@]} $(compgen -W "$( grep -v '^[[:space:]]*$' /etc/hosts | grep -v '^#' | awk '{for (i=2; i<=NF; i++) print $i}' )" ${OPTIONS}) )
  fi

  return 0;
}

complete -o default -o nospace -F _sshcomplete ssh scp sftp
