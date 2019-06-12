addpath() {
  new="$1"
  read orig
  if [[ ! -d "$new" ]]; then
    echo "$orig"
    return
  fi
  if [[ -z "$orig" ]]; then
    echo "$new"
    return
  fi
  orig=":$orig:"
  left=${orig%:$new:*}
  if [[ "$left" != "$orig" ]]; then
    orig="$left:"${orig#*:$new:}
  fi
  orig=${orig%:}
  orig=${orig%:}
  echo "$new$orig"
}

PATH=$( echo "$PATH" |
addpath $HOME/.bin |
addpath $HOME/bin)

export PATH
