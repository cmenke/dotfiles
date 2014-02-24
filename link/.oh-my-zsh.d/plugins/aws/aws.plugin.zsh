AWS_HOME="${HOME}/.aws"

if [ -e $AWS_HOME ]; then
  export AWS_HOME
  export AWS_CONFIG_FILE="${AWS_HOME}/config"

  function agp {
    echo $AWS_DEFAULT_PROFILE
  }

  function asp {
    export AWS_DEFAULT_PROFILE=$1
    export RPROMPT="%{$fg[magenta]%}aws:$AWS_DEFAULT_PROFILE%{$reset_color%}"
  }

  function aws_profiles {
    reply=($(grep profile $AWS_HOME/config|sed -e 's/.*profile \([a-zA-Z0-9_-]*\).*/\1/'))
  }

  compctl -K aws_profiles asp
  source `which aws_zsh_completer.sh`
fi
