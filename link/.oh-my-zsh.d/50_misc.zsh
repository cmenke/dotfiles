# Show History
alias history='fc -l 1'

# A Simple Timer
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get week number
alias week='date +%V'

# Set the terminal's title bar.
function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

function mkpw() {
  head /dev/urandom | uuencode -m - | sed -n 2p | cut -c1-${1:-8};
}

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Always enable colored `grep` output
export GREP_OPTIONS='--color=auto'
