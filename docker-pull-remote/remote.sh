image_name=$1
remote_download_path=$2

cd "$2"
docker load -i "$image_name.docker"
rm "$image_name.docker"