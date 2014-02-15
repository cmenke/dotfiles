# This file is sourced at the end of a first-time dotfiles install.
shopt -s expand_aliases
source ~/.zshrc

# I'm forgetful. Just look at this repo's commits to see how many times I
# forgot to setup Git and GitHub.

cat <<EOF
1) Setup Git
  git config --global user.name YOUR_NAME
  git config --global user.email YOUR_EMAIL
2) copy keys to .ssh
3) set .aws/config file

If this is a remote server, run [-i KEYFILE]:
ssh-copy-id $USER@$(wanip) && ssh $USER@$(wanip)
EOF
