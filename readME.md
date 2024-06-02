# MySQL Server Setup and Database Initialization

This repository contains scripts to install MySQL Server, configure it, create a database, and update passwords with bcrypt hash.

## Prerequisites

- Windows or Linux operating system
- Python installed
- `pip` package manager for Python
- `curl` and `tar` tools (for Windows, use Git Bash or Cygwin)

## Files

- `addPasswords.py`: Python script to update user passwords with bcrypt hash.
- `bazaIMPREZY.sql`: SQL script to create a database and tables.
- `ezSETUP.bat`: Batch script to run SQL and Python scripts on Windows.
- `ezSETUP-linux.sh`: Bash script to run SQL and Python scripts on Linux.
- `noSQLnoPROBLEM/ezSetupMySQLserver.bat`: Batch script to install MySQL Server on Windows.
- `noSQLnoPROBLEM/ezSetupMySQLserver.sh`: Bash script to install MySQL Server on Linux.
- `readME.md`: This README file.

## Installation and Setup

### 1. Install MySQL Server

#### Windows

1. Open a command prompt or Git Bash.
2. Navigate to the `noSQLnoPROBLEM` directory.
3. Run the following command to start the installation:
    ```cmd
    ezSetupMySQLserver.bat
    ```
4. Follow the prompts to complete the installation. The default root password will be displayed in the console.

#### Linux

1. Open a terminal.
2. Navigate to the `noSQLnoPROBLEM` directory.
3. Make the script executable:
    ```bash
    chmod +x ezSetupMySQLserver.sh
    ```
4. Run the following command to start the installation:
    ```bash
    ./ezSetupMySQLserver.sh
    ```
5. Follow the prompts to complete the installation. The default root password will be displayed in the console.

### 2. Create Database and Tables

#### Windows

1. Open a command prompt or Git Bash.
2. Navigate to the root directory of the project.
3. Run the following command with the necessary arguments:
    ```cmd
    ezSETUP.bat <host> <username> <password> <database>
    ```
   Example:
    ```cmd
    ezSETUP.bat localhost root your_password BazaDanychImprezy
    ```

#### Linux

1. Open a terminal.
2. Navigate to the root directory of the project.
3. Make the script executable:
    ```bash
    chmod +x ezSETUP-linux.sh
    ```
4. Run the following command with the necessary arguments:
    ```bash
    ./ezSETUP-linux.sh <host> <username> <password> <database>
    ```
   Example:
    ```bash
    ./ezSETUP-linux.sh localhost root your_password BazaDanychImprezy
    ```

### 3. Verify the Setup

1. Open MySQL command line or a MySQL client like MySQL Workbench.
2. Connect to your MySQL server.
3. Verify that the database and tables have been created:
    ```sql
    SHOW DATABASES;
    USE BazaDanychImprezy;
    SHOW TABLES;
    ```

## Python Scrip Overview in Polish

### `addPasswords.py`

```python
import sys
import bcrypt
import mysql.connector

# Sprawdzenie, czy podano odpowiednią liczbę argumentów
if len(sys.argv) != 5:
    print("Użycie: python addPasswords.py <host> <username> <password> <database>")
    sys.exit(1)

# Pobranie argumentów wiersza poleceń
host = sys.argv[1]
username = sys.argv[2]
password = sys.argv[3]
database = sys.argv[4]

# Funkcja do haszowania hasła
def hash_password(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
    return hashed.decode('utf-8')

# Przykładowe dane użytkowników z plaintext hasłami
users = [
    (1, 'haslo123'),
    (2, 'haslo456'),
    (3, 'haslo789'),
    (4, 'haslo111'),
    (5, 'haslo222'),
    (6, 'haslo333'),
    (7, 'haslo444'),
    (8, 'haslo555'),
    (9, 'haslo666'),
    (10, 'haslo777'),
    (11, 'haslo888'),
    (12, 'haslo999'),
    (13, 'haslo101'),
    (14, 'haslo102'),
    (15, 'haslo103'),
    (16, 'haslo104'),
    (17, 'haslo105'),
    (18, 'haslo106'),
    (19, 'haslo107'),
    (20, 'haslo108'),
]

# Połączenie z bazą danych
conn = mysql.connector.connect(
    host=host,
    user=username,
    password=password,
    database=database
)
cursor = conn.cursor()

# Aktualizacja zhashowanych haseł w tabeli Uzytkownik
for user in users:
    user_id, plaintext_password = user
    hashed_password = hash_password(plaintext_password)
    cursor.execute("""
        UPDATE Uzytkownik
        SET Haslo = %s
        WHERE ID_Uzytkownika = %s
    """, (hashed_password, user_id))

# Zatwierdzenie zmian i zamknięcie połączenia
conn.commit()
cursor.close()
conn.close()
```

### `bazaIMPREZY.sql`

```
-- bazaIMPREZY.sql
-- Utworzenie bazy danych
CREATE DATABASE BazaDanychImprezy;
USE BazaDanychImprezy;

-- Utworzenie tabeli Użytkownik
CREATE TABLE Uzytkownik (
    ID_Uzytkownika INT PRIMARY KEY AUTO_INCREMENT,
    Imie NVARCHAR(50),
    Nazwisko NVARCHAR(50),
    Haslo NVARCHAR(255),
    Email NVARCHAR(100)
);

-- Utworzenie tabeli Bilety
CREATE TABLE Bilety (
    ID_Biletu INT PRIMARY KEY AUTO_INCREMENT,
    Typ_Biletu NVARCHAR(100),
    Cena INT,
    ID_Uzytkownika INT,
    FOREIGN KEY (ID_Uzytkownika) REFERENCES Uzytkownik(ID_Uzytkownika)
);

-- Utworzenie tabeli Transakcje
CREATE TABLE Transakcje (
    ID_Transakcji INT PRIMARY KEY AUTO_INCREMENT,
    Kwota INT,
    Data_Transakcji DATE,
    ID_Uzytkownika INT,
    FOREIGN KEY (ID_Uzytkownika) REFERENCES Uzytkownik(ID_Uzytkownika)
);

-- Utworzenie tabeli Impreza
CREATE TABLE Impreza (
    ID_Imprezy INT PRIMARY KEY AUTO_INCREMENT,
    Nazwa NVARCHAR(100),
    Lokalizacja NVARCHAR(255),
    Data DATE,
    ID_Biletu INT,
    FOREIGN KEY (ID_Biletu) REFERENCES Bilety(ID_Biletu)
);

-- Dodanie przykładowych danych do tabeli Uzytkownik (bez haseł)
INSERT INTO Uzytkownik (Imie, Nazwisko, Haslo, Email) VALUES
('Jan', 'Kowalski', NULL, 'jan.kowalski@example.com'),
('Anna', 'Nowak', NULL, 'anna.nowak@example.com'),
('Piotr', 'Zieliński', NULL, 'piotr.zielinski@example.com'),
('Ewa', 'Wiśniewska', NULL, 'ewa.wisniewska@example.com'),
('Tomasz', 'Kaczmarek', NULL, 'tomasz.kaczmarek@example.com'),
('Katarzyna', 'Wójcik', NULL, 'katarzyna.wojcik@example.com'),
('Michał', 'Lewandowski', NULL, 'michal.lewandowski@example.com'),
('Maria', 'Szymańska', NULL, 'maria.szymanska@example.com'),
('Robert', 'Kamiński', NULL, 'robert.kaminski@example.com'),
('Agnieszka', 'Nowicka', NULL, 'agnieszka.nowicka@example.com'),
('Paweł', 'Woźniak', NULL, 'pawel.wozniak@example.com'),
('Joanna', 'Kowalczyk', NULL, 'joanna.kowalczyk@example.com'),
('Adam', 'Kozłowski', NULL, 'adam.kozlowski@example.com'),
('Monika', 'Jankowska', NULL, 'monika.jankowska@example.com'),
('Krzysztof', 'Mazur', NULL, 'krzysztof.mazur@example.com'),
('Magdalena', 'Kwiatkowska', NULL, 'magdalena.kwiatkowska@example.com'),
('Marcin', 'Pawlak', NULL, 'marcin.pawlak@example.com'),
('Dorota', 'Krawczyk', NULL, 'dorota.krawczyk@example.com'),
('Andrzej', 'Zając', NULL, 'andrzej.zajac@example.com'),
('Beata', 'Michalska', NULL, 'beata.michalska@example.com');

-- Dodanie przykładowych danych do tabeli Bilety
INSERT INTO Bilety (Typ_Biletu, Cena, ID_Uzytkownika) VALUES
('VIP', 200, 1),
('Standard', 100, 2),
('VIP',

```