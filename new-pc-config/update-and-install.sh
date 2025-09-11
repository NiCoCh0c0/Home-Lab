apt update && apt dist-upgrade -y
apt install sudo git gh
usermod -aG sudo $1 # TOTO: Ajouter l'utilisateur dans le fichier /etc/sudoers