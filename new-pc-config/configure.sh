su root -c ./update-and-install.sh $(whoami)
git config --global user.name $2
git config --global user.email $3
gh auth login