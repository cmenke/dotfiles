function geoip
  set ipaddress $argv[1]
  curl -s "http://freegeoip.net/json/$ipaddress" | jq '.'
end
