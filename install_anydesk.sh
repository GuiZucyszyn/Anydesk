#!/bin/bash

# Remover versões anteriores do AnyDesk
sudo apt remove --purge -y anydesk*

mkdir /tmp/Anydesk

# URL para o arquivo .deb do AnyDesk
wget -q https://my.anydesk.com/v2/api/v2/custom-clients/downloads/public/YNUEB2E4PPUY/anydesk-client-rentcars-6.3.0-1_amd64.deb -P /tmp/Anydesk


# Instala o AnyDesk usando o dpkg
sudo dpkg -i /tmp/Anydesk/anydesk-rentcars-infra-6.3.0-1_amd64.deb
    
# Instala dependências, se necessário
sudo apt-get -f install
    
