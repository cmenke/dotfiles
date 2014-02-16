ZSH_BIN=$(which zsh)

# zsh
if [[ "$(type -P $ZSH_BIN)" && "$(cat /etc/shells | grep -q "$ZSH_BIN")" ]]; then
  e_header "Adding $ZSH_BIN to the list of acceptable shells"
  echo "$ZSH_BIN" | sudo tee -a /etc/shells >/dev/null
fi
if [[ "$SHELL" != "$ZSH_BIN" ]]; then
  e_header "Making $ZSH_BIN your default shell"
  sudo chsh -s "$ZSH_BIN" "$USER" >/dev/null 2>&1
  e_arrow "Please exit and restart all your shells."
fi

# Oh-my-zsh
OMZSH_DIR="$HOME/.oh-my-zsh"
if [ ! -d $OMZSH_DIR ]; then
	e_header "Installing oh-my-zsh..."
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
	e_header "Updating oh-my-zsh..."
	git pull
fi
