# ZSH Settings
# --------------------------------------------------
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh.d
ZSH_THEME="risto"

DISABLE_AUTO_UPDATE="true"

plugins=(brew git composer vagrant golang artisan aws)

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
