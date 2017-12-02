complete --command d --erase
complete --command d --exclusive --arguments '(__fish_complete_directories $GDRIVE/(commandline -ct) | sed -e "s#$GDRIVE/##")'
