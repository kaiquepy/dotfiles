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

# Detectar o diretório HOME do usuário que executou o script
USER_HOME=$(eval echo "~$SUDO_USER")

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
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update &>/dev/null

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


info "Instalando o Docker Compose"
apt-get install -y docker-compose-plugin


info "Instalando o Virtual Box"
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian bookworm contrib" >> /etc/apt/sources.list
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
sudo apt-get update
apt-get install -y virtualbox-7.1

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
GOPATH='export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin'
if ! grep -qxF "$GOPATH" "$USER_HOME/.profile"; then
  echo "$GOPATH" >> "$USER_HOME/.profile"
fi


info "Instalando anew"
sudo -u "$SUDO_USER" /usr/local/go/bin/go install -v github.com/tomnomnom/anew@latest

info "Instalando o Discord"
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
apt install -y ./discord.deb


info "Instalado Google Chrome"
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O chrome.deb
apt install -y ./chrome.deb


info "Instalando Spotify"
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client


info "Removendo .deb baixados"
rm *.deb

info "Criando diretórios para os repositórios"
mkdir -p "$USER_HOME/repos/pessoal"
mkdir -p "$USER_HOME/repos/nuria"
