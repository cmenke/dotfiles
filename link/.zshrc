# ZSH Settings
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh.d
ZSH_THEME=cmenke
DISABLE_AUTO_UPDATE=true

plugins=(git aws golang npm composer laravel)

# OS X specific plugins
if [[ "$OSTYPE" =~ ^darwin ]]; then
  plugins+=(brew osx-backup rbenv vagrant)
fi

[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
source $ZSH/oh-my-zsh.sh

# Init rbenv (if available)
if (type rbenv >/dev/null 2>&1); then
  eval "$(rbenv init -)"
fi
