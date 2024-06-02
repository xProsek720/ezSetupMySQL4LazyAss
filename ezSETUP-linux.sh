#!/bin/bash

# Sprawdzenie, czy podano odpowiednią liczbę argumentów
if [ "$#" -ne 4 ]; then
    echo "Użycie: ./ezSETUP-linux.sh <host> <username> <password> <database>"
    exit 1
fi

# Pobranie argumentów wiersza poleceń
SERVER=$1
USERNAME=$2
PASSWORD=$3
DATABASE=$4

# Instalacja wymaganych pakietów Pythona
pip install bcrypt mysql-connector-python

# Uruchomienie skryptu SQL
mysql -h "$SERVER" -u "$USERNAME" -p"$PASSWORD" < bazaIMPREZY.sql

# Uruchomienie skryptu Python do aktualizacji haseł
python addPasswords.py "$SERVER" "$USERNAME" "$PASSWORD" "$DATABASE"

echo "Instalacja zakończona pomyślnie."
