#!/bin/bash

# Pytanie o wersję MySQL do zainstalowania
read -p "Podaj wersję MySQL (np. 8.0): " MYSQL_VERSION

# Pobieranie i instalacja MySQL Server
echo "Pobieranie i instalacja MySQL Server $MYSQL_VERSION"
wget https://dev.mysql.com/get/Downloads/MySQL-$MYSQL_VERSION/mysql-$MYSQL_VERSION-linux-glibc2.12-x86_64.tar.xz
tar -xf mysql-$MYSQL_VERSION-linux-glibc2.12-x86_64.tar.xz
cd mysql-$MYSQL_VERSION-linux-glibc2.12-x86_64

# Konfiguracja MySQL Server
echo "Konfiguracja MySQL Server"
mkdir mysql-files
chmod 750 mysql-files
bin/mysqld --initialize --user=mysql --console
bin/mysql_ssl_rsa_setup
bin/mysqld --daemonize --user=mysql

# Uruchomienie MySQL Server
echo "Uruchomienie MySQL Server"
bin/mysqld_safe --user=mysql &

echo "Instalacja zakończona. Domyślne hasło root jest wyświetlone w konsoli powyżej."
