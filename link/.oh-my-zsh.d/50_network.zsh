# Show IPs (WAN, local, all)
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

if [[ "$OSTYPE" =~ ^darwin ]]; then
  alias localip="ipconfig getifaddr en1"
fi

# Whois
alias whois="whois -h whois-servers.net"

# Sniff HTTP Traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Get IP details from geoiptool.com
function geoip() {
  padlen=13
  ipaddress=$1

  if [[ "$1" == "--raw" ]] || [[ "$1" == "-r" ]]; then
    padlen=0
    ipaddress=$2
  elif [[ "$2" == "--raw" ]] || [[ "$2" == "-r" ]]; then
    padlen=0
  fi

  case "$1" in
    "-h" | "--help" )
      echo "usage: geoip [<ipaddress>]"
      echo ""
      echo "Options:"
      echo "  --raw, -r:  Do not align headers. Allows easier machine parsing of output."
      echo ""
      echo "Look up details for given IP address via http://www.geoiptool.com/. If no IP"
      echo "address is given, your own public IP will be used instead."
      ;;
    * )
      curl -s http://freegeoip.net/json/${ipaddress} | jq '.'
  esac
}
