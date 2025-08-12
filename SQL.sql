-- Acessar o Shell do contêiner MySQL 
Bash
docker exec -it mysql-app mysql -uroot -p

CREATE DATABASE glpi_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'glpi_user'@'%' IDENTIFIED BY 'sua_senha_forte';
GRANT ALL PRIVILEGES ON glpi_db.* TO 'glpi_user'@'%';
-- Permitir que os usuarios do glpi acessem a tabela timezone do mySQL
GRANT SELECT ON mysql.time_zone_name TO 'glpi_user'@'%';
FLUSH PRIVILEGES;