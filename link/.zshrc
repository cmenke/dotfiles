# ZSH Settings
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh.d
ZSH_THEME="risto"
DISABLE_AUTO_UPDATE="true"

plugins=('git' 'composer' 'vagrant' 'golang' 'artisan' 'aws')

# OS X specific plugins
if [[ "$OSTYPE" =~ ^darwin ]]; then
  plugins+=('brew' 'osx-backup')
fi

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
