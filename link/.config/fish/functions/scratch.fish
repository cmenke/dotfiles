function scratch
  if string match -r -q '^[a-z0-9\\-]+$' $argv
    set date (date +%Y%m%d)
    set full_path "$WORKSPACE/_scratch/$date-$argv"
    mkdir -p "$full_path"
    pushd "$full_path"
    echo "Now in temp dir: $full_path"
  else
    echo "Invalid name: '$argv'"
    echo "Usage: scratch <name>"
  end
end
