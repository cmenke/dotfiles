if (type npm >/dev/null 2>&1); then
  export PATH=$PATH:/usr/local/share/npm/bin
  eval "$(npm completion 2>/dev/null)"
fi
