CREATE DATABASE glpi_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'glpi_user'@'%' IDENTIFIED BY 'sua_senha_forte';
GRANT ALL PRIVILEGES ON glpi_db.* TO 'glpi_user'@'%';
FLUSH PRIVILEGES;
