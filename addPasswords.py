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
