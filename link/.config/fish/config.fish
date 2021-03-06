## -- 10_paths
set PATH $HOME/.dotfiles/bin $PATH

# -- 50_editor
set -gx EDITOR "vim"
set -gx VISUAL "$EDITOR"
alias q=$EDITOR
alias q.='q .'

## -- 50_file
alias dir='ls -hl'
alias du="du -h"
alias df="df -h"
alias fs="stat -f '%z bytes'"

# Copy / Move Files via Rsync
abbr -a rcp 'rsync -av --progress -h'
abbr -a rmv 'rsync -av --progress -h --remove-source-files'

## -- 50_misc
# Don’t clear the screen after quitting a manual page
set -gx MANPAGER "less -X"
# Always enable colored `grep` output
set -gx GREP_OPTIONS '--color=auto'

function inkognito
  set -gx fish_history ""
  set_color bryellow --background=brblack
  echo "--- inkognito-session started ---"
  set_color normal
end

## -- 50_network
function localips
  ifconfig | grep "broadcast" | awk '{print $2}'
end
function wanip
  dig +short myip.opendns.com @resolver1.opendns.com
end

# Whois
alias whois="whois -h whois-servers.net"

# Sniff HTTP Traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

for file in $HOME/.config/fish/conf.d/*.fish
  source $file
end

for file in $HOME/.config/fish/conf.local.d/*.fish
  source $file
end