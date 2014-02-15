DIR="$HOME/.oh-my-zsh"

if [ ! -d $DIR ]; then
	e_header "Installing oh-my-zsh..."
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
	e_header "Updating oh-my-zsh..."
	git pull
fi
