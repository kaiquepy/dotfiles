#!/usr/bin/env bash

set -euo pipefail

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Cores para o terminal
BLUE="\033[0;34m"
NC="\033[0m" # No Color

# Função para exibir mensagens formatadas
info() {
  echo -e "\n${BLUE}[INFO]${NC} $1\n"
}

info "Atualizando o sistema"
apt-get update && apt-get upgrade -y

info "Instalando pacotes essenciais"
sudo apt-get install -y git curl wget vim unzip

info "Instalando o Docker"
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

info "Instalando o Docker Compose"
apt-get install docker-compose-plugin

info "Instalando o Virtual Box"
apt-get install virtualbox

info "Instalando AWS CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm -rf aws awscliv2.zip

info "Instalando PHP"
apt-get install php-common php-cli

info "Instalando o Discord"
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
apt install -y ./discord.deb
