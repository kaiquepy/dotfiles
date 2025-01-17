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
sudo apt-get install -y \
  git \
  curl \
  wget \
  vim \
  unzip \
  coreutils \


info "Instalando ferramentas úteis"
sudo apt-get install -y jq


info "Instalando xclip"
apt-get install -y xclip


info "Instalando o Docker"
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


info "Instalando o Docker Compose"
apt-get install -y docker-compose-plugin


info "Instalando o Virtual Box"
apt-get install -y virtualbox

if command -v aws &>/dev/null; then
  info "AWS CLI já está instalado. Versão:"
  aws --version
else
  info "Instalando AWS CLI"
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  ./aws/install
  rm -rf aws awscliv2.zip
fi


info "Instalando PHP"
apt-get install -y php-common php-cli


info "Instalando Go (golang)"
# Obter a versão mais recente do Go
latest_version=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version')
go_tarball="${latest_version}.linux-amd64.tar.gz"

# Baixar o tarball correspondente
wget "https://go.dev/dl/${go_tarball}"

rm -rf /usr/local/go

# Extrair o tarball para /usr/local
sudo tar -C /usr/local -xzf "${go_tarball}"
rm "${go_tarball}"

# Configurar a variável de ambiente PATH
if ! grep -q '/usr/local/go/bin' ~/.profile; then
  echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
fi

source ~/.profile


info "Instalando anew"
go install -v github.com/tomnomnom/anew@latest


info "Instalando o Discord"
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
apt install -y ./discord.deb


info "Removendo .deb baixados"
rm *.deb


mkdir -p ~/repos/pessoal
mkdir -p ~/repos/work
