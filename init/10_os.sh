# https://github.com/nishigori/oh-my-zsh-custom/blob/master/os.zsh

SYSINIT_FILE=/.dotinit
DIR=$HOME/.dotfiles/init

# Determine if system is initialized for the first time
IS_FRESH=
if [ ! -f $SYSINIT_FILE ]; then
  IS_FRESH=true
fi

# Determine OS/Dist
case "${OSTYPE}" in
  darwin*)
    OS="osx"
    ;;
  linux*)
    if [ -f /etc/debian_version ]; then
      OS="debian"
    fi
    ;;
esac

# If OS
if [ $OS ]; then
  find $DIR/$OS -name '*.sh' | while read scriptfile; do
    source $scriptfile
  done

  # Set marker that system initialisation has been performed
  sudo touch $SYSINIT_FILE
else
  e_header "OS \"${OSTYPE}\" not configured."
  exit
fi
