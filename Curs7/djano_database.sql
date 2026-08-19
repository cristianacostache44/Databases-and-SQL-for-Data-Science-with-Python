CREATE DATABASE IF NOT EXISTS my_django_database;
CREATE USER 'my_django_databaseuser'@'127.0.0.1' IDENTIFIED BY 'my_django_password';
GRANT ALL PRIVILEGES ON my_django_database.* TO'my_django_databaseuser'@'127.0.0.1';
