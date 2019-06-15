# Rake aliases
function _rake_command () {
  if [ -e "bin/stubs/rake" ]; then
    bin/stubs/rake $@
  elif [ -e "bin/rake" ]; then
    bin/rake $@
  elif type bundle &> /dev/null && [ -e "Gemfile" ]; then
    bundle exec rake $@
  else
    command rake $@
  fi
}

alias rake="_rake_command"

alias rdm="rake db:migrate"
alias rdms="rake db:migrate:status"
alias rdr="rake db:rollback"
alias rdc="rake db:create"
alias rds="rake db:seed"
alias rdd="rake db:drop"
alias rdrs="rake db:reset"
alias rdtc="rake db:test:clone"
alias rdtp="rake db:test:prepare"
alias rdmtc="rake db:migrate db:test:clone"
alias rdsl="rake db:schema:load"
alias rlc="rake log:clear"
alias rn="rake notes"
alias rr="rake routes"
alias rrg="rake routes | grep"
alias rt="rake test"
alias rmd="rake middleware"
alias rsts="rake stats"

function rdmd() {
  rake db:migrate:down VERSION=$@
}

function rdmu() {
  rake db:migrate:up VERSION=$@
}
