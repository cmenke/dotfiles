_artisan_get_command_list () {
	php artisan --no-ansi | sed "1,/Available commands/d" | awk '/^  [a-z]+/ { print $1 }'
}

_artisan () {
  if [ -f artisan ]; then
    compadd `_artisan_get_command_list`
  fi
}

compdef _artisan artisan

#!zsh
alias artisan='php artisan'
