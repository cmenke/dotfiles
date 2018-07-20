# Some tools look for XCode, even though they don't need it.
# https://github.com/joyent/node/issues/3681

# Install Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  echo "Installing Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ "$(type -P brew)" ]]; then
  echo "Updating Homebrew"

  # Parse Brewfile
  brew bundle --file="$HOME/.dotfiles/conf/osx/Brewfile"
  brew cask cleanup
fi
