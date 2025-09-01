#!/bin/bash
# Inspired by: https://www.ubuntumint.com/apt-offline-update-ubuntu-debian/

#set -euo

# Variables
remote_download_path="$~/SystemUpdate"
remote_generated_filename="apt-offline.sig"
host_generated_filename="apt-offline-bundle.zip"

# Check if there are at least 2 arguments
if [[ "$#" -lt 2 ]]; then
    echo "You need to use the command as: $0 user@ip package1 package2 ..."
    exit 1
fi

# Clean the first parameter
identifier=$(echo "$1" | sed 's/[^A-Za-z0-9@._-]//g') 
# Check the format user@ip
reg_username="[A-Za-z][A-Za-z0-9_-]+" # assumption: you are following the Debian naming recommandation (https://wiki.debian.org/UserAccountsPhilosophy)
reg_ip_number="(([01]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))"
reg_ip_addr="($reg_ip_number\.){3}$reg_ip_number"
reg_ssh_param="^$reg_username@$reg_ip_addr$"
if [[ ! $identifier =~ $reg_ssh_param ]]; then
    echo "First parameter need to match: user@ip_addr (like ssh parameter)"
    echo "Your input: $identifier"
    exit 1
fi
shift # Keep only package names as parameters (make them accessible from $@)

# TODO: Clear les noms de packages



# Connection to the offline machine to get the informations in order to download the correct packages and dependancies
ssh "$identifier" './create-apt-sig.sh $remote_download_path $remote_generated_filename $@ && exit'

# Get the informations and send all the packages
local_tmp_dir=$(mktemp -d) # Create a local safe temporary directory
scp  "$identifier:$remote_download_path/$remote_generated_filename" "$local_tmp_dir/$remote_generated_filename"
sudo apt-offline get "$local_tmp_dir/$remote_generated_filename" --bundle "$local_tmp_dir/$host_generated_filename"
scp -r "$identifier:$remote_download_path" "$local_tmp_dir"
#rm -rf "$local_tmp_dir"
cat $local_tmp_dir

# Go back in the remote host to apply the download file
ssh "$identifier" "./remote-installation.sh $remote_download_path/$host_generated_filename && exit"