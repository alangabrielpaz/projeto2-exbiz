#!/bin/bash

# Atualizar servidor
apt update && apt upgrade -y

# Instalar Apache e Unzip
apt install -y apache2 unzip

# Baixar aplicação
wget https://github.com/AngeloAntunes/02-Projeto/archive/refs/heads/main.zip -O /tmp/projeto.zip

# Extrair aplicação
unzip /tmp/projeto.zip -d /tmp/

# Copiar para diretório do Apache
cp -R /tmp/02-Projeto-main/* /var/www/html/

# Ajustar permissões
chown -R www-data:www-data /var/www/html/

# Reiniciar Apache
systemctl restart apache2

# Limpar arquivos temporários
rm -rf /tmp/projeto.zip /tmp/02-Projeto-main

echo "Deploy concluído!"
