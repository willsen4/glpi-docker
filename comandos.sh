#Crie um diretório para o GLPI:

Bash
mkdir glpi-docker
cd glpi-docker

#Crie o arquivo docker-compose.yml:

Bash
nano docker-compose.yml

#Você pode acessar o MariaDB via shell
Bash
docker exec -it mariadb-app mariadb -uroot -p
docker exec -it mysql-app mysql -uroot -p

SQL
CREATE DATABASE glpi_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'glpi_user'@'%' IDENTIFIED BY 'sua_senha';
GRANT ALL PRIVILEGES ON glpi_db.* TO 'glpi_user'@'%';
FLUSH PRIVILEGES;

#Inspecionar a rede MariaDB/MySQL
Bash
docker inspect mariadb-app | grep "IPAddress"
docker inspect mysql-app | grep "IPAddress"

#Crie uma rede Docker
Bash
docker network create glpi_network

#Conecte seu contêiner MariaDB/MySQL a essa rede (se ele já estiver rodando):
Bash
docker network connect glpi_network mariadb-app
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

#Acessa a pasta
cd glpi-docker

#Logs
docker logs glpi-docker

#Remover o conteiner
docker compose down

#Altera o arquivo de configuração
nano docker-compose.yml

#Recria o conteiner
docker compose up -d

