export CLICOLOR=1
export TERM="xterm-256color"
export EDITOR=vim

export GOPATH=$HOME/golang

# Aliases
alias ll='ls -lh'
alias dir=ll
alias du='du -h'
alias df='df -h'

# Better cd'ing
alias w='cd $HOME/workspace'
alias ..='cd ..'
alias ...='cd ../..'

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
