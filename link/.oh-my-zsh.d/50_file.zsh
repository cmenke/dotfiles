# Files will be created with these permissions:
# files 644 -rw-r--r-- (666 minus 022)
# dirs  755 drwxr-xr-x (777 minus 022)
umask 022

alias -- -="cd -"
alias dir='ls -hl'

if [[ "$OSTYPE" =~ ^darwin ]]; then
	alias dl="cd $HOME/Downloads"
	alias dt="cd $HOME/Desktop"
	alias p="cd $HOME/Projects"
fi

# Use human-readable filesizes
alias du="du -h"
alias df="df -h"
alias fs="stat -f '%z bytes'"

# Copy / Move Files via Rsync
alias rcp="rsync -av --progress -h"
alias rmv="rsync -av --progress -h --remove-source-files"

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}
