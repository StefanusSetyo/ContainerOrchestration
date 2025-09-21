#!/bin/bash
sudo -i
apt-get update -y
apt-get upgrade -y
apt install unzip -y
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release unzip awscli git
curl -L "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
apt install unzip -y
unzip awscliv2.zip
./aws/install
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io
curl -SL https://github.com/docker/compose/releases/download/v2.24.7/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
mkdir -p /home/ubuntu/task1
cd /home/ubuntu/task1

# Ambil file dari github dan s3
curl -o docker-compose.yaml https://raw.githubusercontent.com/StefanusSetyo/ContainerOrchestration/main/task1/docker-compose.yaml
curl -o nginx.conf https://raw.githubusercontent.com/StefanusSetyo/ContainerOrchestration/main/task1/nginx.conf
aws s3 cp s3://task1-stefanus-with-galih/.env .env --region us-east-1
docker-compose up -d
