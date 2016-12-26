# Some tools look for XCode, even though they don't need it.
# https://github.com/joyent/node/issues/3681

# Install Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  e_header "Installing Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ "$(type -P brew)" ]]; then
  e_header "Updating Homebrew"

  # Parse Brewfile
  brew bundle ~/.dotfiles/conf/osx/Brewfile
fi
