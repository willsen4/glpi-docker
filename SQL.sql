CREATE DATABASE glpi_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'glpi_user'@'localhost' IDENTIFIED BY 'sua_senha';
CREATE USER 'glpi_web'@'%' IDENTIFIED BY 'sua_senha_forte';
GRANT ALL PRIVILEGES ON glpi_db.* TO 'glpi_user'@'localhost'; -- Permissões para localhost
GRANT ALL PRIVILEGES ON glpi_db.* TO 'glpi_web'@'%'; -- Permissões remotas
FLUSH PRIVILEGES;
