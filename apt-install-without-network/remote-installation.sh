host_generated_filepath="$1"

shift
sudo apt-offline install "$host_generated_filepath" "$@"
rm "$host_generated_filepath"