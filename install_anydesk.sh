#!/bin/bash

# Remover versões anteriores do AnyDesk
echo "Removendo versões anteriores do AnyDesk..."
sudo apt remove --purge -y anydesk*

# URL para o arquivo .deb do AnyDesk
anydesk_deb_url="https://my.anydesk.com/v2/api/v2/custom-clients/downloads/public/0IFYTVCVQJOH/anydesk_rentcars.infra6.3.0-1_amd64.deb"

# Nome do arquivo .deb após o download
deb_filename="anydesk_rentcars.infra6.3.0-1_amd64.deb"

# Diretório temporário para baixar o arquivo .deb
temp_dir=$(mktemp -d)

# Baixa o arquivo .deb do AnyDesk
echo "Baixando AnyDesk..."
wget -q "$anydesk_deb_url" -P "$temp_dir"

# Verifica se o download foi bem-sucedido
if [ -e "$temp_dir/$deb_filename" ]; then
    echo "Instalando AnyDesk..."
    
    # Instala o AnyDesk usando o dpkg
    sudo dpkg -i "$temp_dir/$deb_filename"
    
    # Instala dependências, se necessário
    sudo apt-get -f install
    
    echo "AnyDesk foi instalado com sucesso."
    
    # Limpa o diretório temporário
    rm -rf "$temp_dir"
else
    echo "Falha ao baixar o arquivo .deb do AnyDesk a partir da URL '$anydesk_deb_url'. Certifique-se de que a URL esteja correta e a conexão com a Internet esteja ativa."
fi
