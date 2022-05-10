sudo apt install apt-transport-https ca-certificates curl software-properties-common -y 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" 
sudo apt update 
sudo apt install docker-ce -y 
sudo usermod -aG docker okhab 
sudo usermod -aG docker idksomename 
newgrp docker 
DOCKER_CONFIG=${DOCKER_CONFIG:-/usr/local/lib/docker} 
sudo mkdir -p $DOCKER_CONFIG/cli-plugins 
sudo curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose 
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose 
docker pull reeezos/cyberyulia:0.0.1 
