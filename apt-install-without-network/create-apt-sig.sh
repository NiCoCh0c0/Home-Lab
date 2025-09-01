remote_download_path="$1"
remote_generated_filename="$2"

if [[ ! -d "$remote_download_path" ]]; then
    echo "Creating $remote_download_path"
    mkdir "$remote_download_path"
fi
if [[ ! -r "$remote_download_path" ]]; then
    echo "Given user has not the read permission in $remote_download_path"
    exit 1
fi

shift 2
sudo apt-offline set "$remote_download_path/$remote_generated_filename" --install-packages "$@"