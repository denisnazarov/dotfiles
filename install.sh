link() {
  local original="$1"
  local target="$HOME"/.`basename "$1"`

  if [ -e "$target" ]; then
    echo "$target" already exists
  else
    ln -s "$original" "$target"
  fi
}

install() {
  local files=`pwd`/*
  local this_file=`basename $0`

  for f in $files; do
    # link all files except this one
    [ `basename "$f"` != "$this_file" ] && link "$f"
  done
}

install
