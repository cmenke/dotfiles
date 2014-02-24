# Editing

if [[ "$OSTYPE" =~ ^darwin ]]; then
  export EDITOR='st -w'
  export LESSEDIT='st %f'
  alias q='st'
else
  export EDITOR=$(type vim vi pico nano 2>/dev/null | sed 's/ .*$//;q')
  alias q="$EDITOR"
fi

export VISUAL="$EDITOR"

alias q.='q .'

function qs() {
  pwd | perl -ne"s#^$(echo ~/.dotfiles)## && exit 1" && cd ~/.dotfiles
  q ~/.dotfiles
}
