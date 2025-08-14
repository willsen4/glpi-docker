
# Instalado GLPI no Docker usando Docker Compose
## O GLPI é um sistema de código aberto para gestão de ativos de TI, suporte técnico e central de serviços.

### Esta é a forma mais organizada e recomendada, pois permite definir ambos os serviços (MySQL e GLPI) em um único arquivo. Se você já tem o MySQL rodando em um contêiner separado, você pode adaptá-lo para incluí-lo no docker-compose.yml ou simplesmente referenciar o serviço existente.
--------
### Criando os diretórios / volumes (Dados persistentes)
````Bash
sudo mkdir -p /data/glpi-app/glpi/documents
sudo mkdir -p /data/glpi-app/glpi/files/data-documents
sudo mkdir -p /data/glpi-app/glpi/marketplace
sudo mkdir -p /data/glpi-app/glpi/plugins
sudo mkdir -p /data/glpi-app/glpi/files/_pictures
sudo mkdir -p /data/glpi-app/glpi/files/_plugins
sudo mkdir -p /data/glpi-app/glpi/etc
sudo mkdir -p /data/glpi-app/glpi/imagens-custom
sudo mkdir -p /data/glpi-app/backup
````
-------------
### Ajustando permissões do GLPI
````Bash
sudo chown -R 33:33 /data/glpi-app
sudo chmod -R 775 /data/glpi-app
````
----------------
### Acessar o Shell do contêiner MySQL 
````Bash   
docker exec -it mysql-app mysql -uroot -p
````
------------
### Depois crie o banco e o usuário:
SQL
### Usar os comandos que estão no arquivo SQL.sql
-----------
### Inspecionar a rede MySQL
````Bash
docker inspect mysql-app | grep "IPAddress"
````
----------
### Crie uma rede Docker
````Bash
docker network create glpi_network
````
----------
#### Conecte seu contêiner MySQL a essa rede (se ele já estiver rodando):
````Bash
docker network connect glpi_network mysql-app
````
-----------
### Crie um diretório para o GLPI:
````Bash
mkdir glpi-docker
````
````Bash
cd glpi-docker
````
-----------
### Crie um arquivo docker-compose.yml:
````Bash
nano docker-compose.yml
````
--------------
### Cole o conteúdo:
YAML
### Salve e feche o arquivo. (Em nano, pressione Ctrl+X, depois Y e Enter).
---------------
### Inicie os contêineres:
### No diretório onde você salvou o docker-compose.yml, execute:
````Bash
docker compose up -d
````
-----------
## Acesse o GLPI:
### Abra seu navegador e acesse o IP público da sua instância do Google Cloud: http://<IP_DA_SUA_INSTANCIA>. 
### O processo de instalação do GLPI será iniciado, e ele deverá se conectar automaticamente ao seu MySQL configurado.

## Pós-Instalação e Considerações Importantes
### Configuração Inicial do GLPI: Após a conexão bem-sucedida com o banco de dados, o GLPI o guiará pelo restante do processo de instalação (verificação de requisitos, criação do banco de dados, etc.).

### Credenciais Padrão: As credenciais padrão do GLPI após a instalação são:

### Usuário: glpi

### Senha: glpi

## Por motivos de segurança, por favor remova o arquivo: install/install.php
### Essa mensagem de "Por motivos de segurança, por favor remova o arquivo: install/install.php" significa que a instalação do GLPI foi concluída com sucesso!

### Essa é uma medida de segurança padrão do GLPI e de muitas outras aplicações web. O arquivo install.php é usado apenas para a instalação inicial e, se deixado no servidor, poderia ser usado por pessoas mal-intencionadas para tentar reinstalar ou manipular sua aplicação.

## Como Resolver
### Você precisa remover ou renomear o arquivo install.php do contêiner do GLPI. A forma mais fácil de fazer isso é através do terminal SSH da sua VM.

### Conecte-se à sua VM via SSH.

### Para renomear o arquivo:

### Acesse o Shell do conteiner
````Bash
docker exec -it glpi-app bash
````
### Renomear o arquivo
````Bash
mv /usr/share/glpi/install /usr/share/glpi/installOld
````






