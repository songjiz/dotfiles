# Rails aliases
alias RED="RAILS_ENV=development"
alias REP="RAILS_ENV=production"
alias RET="RAILS_ENV=test"

function _rails_command () {
  if [ -e "bin/stubs/rails" ]; then
    bin/stubs/rails $@
  elif [ -e "bin/rails" ]; then
    bin/rails $@
  elif [ -e "script/rails" ]; then
    ruby script/rails $@
  elif [ -e "script/server" ]; then
    ruby script/$@
  else
    command rails $@
  fi
}

alias rails="_rails_command"

alias rc="rails console"
alias rcs="rails console --sandbox"
alias rd="rails destroy"
alias rdb="rails dbconsole"
alias rg="rails generate"
alias rgm="rails generate migration"
alias rp="rails plugin"
alias ru="rails runner"
alias rs="rails server"
alias rsd="rails server --debugger"
alias rsp="rails server --port"

# rails 5.2
alias rce="rails credentials:edit"
