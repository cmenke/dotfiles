# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# APPLE, Y U PUT /usr/bin B4 /usr/local/bin?!
PATH=/usr/local/sbin:$(path_remove /usr/local/sbin)
PATH=/usr/local/bin:$(path_remove /usr/local/bin)
export PATH

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Flsuh DNS Cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Show Login Scren
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
