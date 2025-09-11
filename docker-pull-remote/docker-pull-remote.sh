
identifier=$1
ressource_pull=$2
image_name=$ressource_pull
remote_download_path="$~/DockerUpdate"

# Download and push the image to remote
docker image pull "$ressource_pull"
local_tmp_dir=$(mktemp -d) # Create a local safe temporary directory
docker save -o "$local_tmp_dir/$image_name.docker" "$ressource_pull"
scp  "$image_name.docker" "$identifier:$remote_download_path"

ssh "$identifier" './remote.sh $image_name $remote_download_path && exit'

rm -rf "$local_tmp_dir"