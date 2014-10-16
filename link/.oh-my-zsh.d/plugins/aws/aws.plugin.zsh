AWS_HOME="${HOME}/.aws"
AWS_CONFIG_FILE="${AWS_HOME}/config"

if [ -e $AWS_CONFIG_FILE ]; then
  export AWS_HOME
  export AWS_CONFIG_FILE

  function agp {
    echo $AWS_DEFAULT_PROFILE
  }

  function asp {
    export AWS_DEFAULT_PROFILE=$1
    export RPROMPT="%{$reset_color%}aws:%{$fg[magenta]%}$AWS_DEFAULT_PROFILE%{$reset_color%} $RPROMPT"
  }

  function aws_profiles {
    reply=($(grep profile $AWS_HOME/config|sed -e 's/.*profile \([a-zA-Z0-9_-]*\).*/\1/'))
  }

  compctl -K aws_profiles asp
  source `which aws_zsh_completer.sh`
fi
