_artisan_get_command_list () {
	php artisan --no-ansi | sed "1,/Available commands/d" | awk '/^  [a-z]+/ { print $1 }'
}

_artisan () {
  if [ -f artisan ]; then
    compadd `_artisan_get_command_list`
  fi
}

compdef _artisan artisan
compdef _artisan artisand

#!zsh
alias artisan='php artisan'
alias artisand='php -dxdebug.remote_connect_back=0 -dxdebug.remote_autostart -dxdebug.remote_host="33.33.33.1" artisan'
