if [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  [[ `which pyenv` ]] && eval "$(pyenv init -)"
fi
