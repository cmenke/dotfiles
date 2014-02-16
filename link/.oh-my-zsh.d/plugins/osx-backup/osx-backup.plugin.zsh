backup-keyremap() {
  local cli=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli
  local target=$HOME/.dotfiles/init/osx/80_keyremap.sh

  if [[ -f $cli ]]; then
    echo "cli=$cli" > $target
    echo "[[ -f \$cli ]] || return 1" >> $target
    $cli export | tail -n+4 >> $target
    echo "Successfully copied to ${target}."
  else
    echo "$cli not found. Check if installed?"
  fi
}
