complete --command w --erase
complete --command w --exclusive --arguments '(__fish_complete_directories $WORKSPACE/(commandline -ct) | sed -e "s#$WORKSPACE/##")'
