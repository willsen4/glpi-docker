#Crie um diretório para o GLPI:
Bash
mkdir glpi-docker
cd glpi-docker

#Crie um arquivo docker-compose.yml:
Bash
nano docker-compose.yml

#Cole o conteúdo:
YAML

#Acessar o Shell do contêiner MySQL 
Bash   
docker exec -it mysql-app mysql -uroot -p

#Depois crie o banco e o usuário:
SQL

#Inspecionar a rede MySQL
Bash
docker inspect mysql-app | grep "IPAddress"

#Crie uma rede Docker
Bash
docker network create glpi_network

#Conecte seu contêiner MySQL a essa rede (se ele já estiver rodando):
Bash
docker network connect glpi_network mysql-app

#Inicie os contêineres:
#No diretório onde você salvou o docker-compose.yml, execute:
Bash
docker compose up -d

#Para remover o arquivo:

#Acesse o Shell do conteiner
Bash
docker exec -it glpi-app bash

#Remove o arquivo
Bash
rm install/install.php

