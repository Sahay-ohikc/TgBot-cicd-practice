sudo apt install apt-transport-https ca-certificates curl software-properties-common -y 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` 
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt update 
sudo apt-get install gcsfuse -y
sudo sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf
sudo chown okhab /var/lib 
mkdir /var/lib/postgresql
mkdir /var/lib/postgresql/data
gcsfuse -o allow_other base-or-cringe /var/lib/postgresql/data 
sudo apt install docker-ce -y 
sudo usermod -aG docker okhab 
sudo usermod -aG docker idksomename 
newgrp docker 
DOCKER_CONFIG=${DOCKER_CONFIG:-/usr/local/lib/docker} 
sudo mkdir -p $DOCKER_CONFIG/cli-plugins 
sudo curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose 
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose 
docker pull reeezos/cyberyulia:0.0.1 
docker compose --file /var/lib/postgresql/data/docker-compose.yml up -d