function killrails() {
  pid="$(cat tmp/pids/server.pid)"
  if [[ -z "$pid" ]]; then
    kill -9 $pid
  fi
}

alias rsk="killrails"
