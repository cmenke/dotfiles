# I'm forgetful. Just look at this repo's commits to see how many times I
# forgot to setup Git and GitHub.

MY_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

cat <<EOF
1) Setup Git
  git config --global user.name YOUR_NAME
  git config --global user.email YOUR_EMAIL
2) copy keys to .ssh
3) set .aws/config file

If this is a remote server, run [-i ~/.ssh/KEYFILE]:
ssh-copy-id $USER@$($MY_IP) && ssh $USER@$MY_IP
EOF
