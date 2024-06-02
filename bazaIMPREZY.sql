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
('VIP', 250, 3),
('Standard', 120, 4),
('VIP', 180, 5),
('Standard', 130, 6),
('VIP', 220, 7),
('Standard', 140, 8),
('VIP', 210, 9),
('Standard', 150, 10),
('VIP', 230, 11),
('Standard', 160, 12),
('VIP', 240, 13),
('Standard', 170, 14),
('VIP', 260, 15),
('Standard', 180, 16),
('VIP', 270, 17),
('Standard', 190, 18),
('VIP', 280, 19),
('Standard', 200, 20);

-- Dodanie przykładowych danych do tabeli Transakcje
INSERT INTO Transakcje (Kwota, Data_Transakcji, ID_Uzytkownika) VALUES
(200, '2024-05-01', 1),
(100, '2024-05-02', 2),
(250, '2024-05-03', 3),
(120, '2024-05-04', 4),
(180, '2024-05-05', 5),
(130, '2024-05-06', 6),
(220, '2024-05-07', 7),
(140, '2024-05-08', 8),
(210, '2024-05-09', 9),
(150, '2024-05-10', 10),
(230, '2024-05-11', 11),
(160, '2024-05-12', 12),
(240, '2024-05-13', 13),
(170, '2024-05-14', 14),
(260, '2024-05-15', 15),
(180, '2024-05-16', 16),
(270, '2024-05-17', 17),
(190, '2024-05-18', 18),
(280, '2024-05-19', 19),
(200, '2024-05-20', 20);

-- Dodanie przykładowych danych do tabeli Impreza
INSERT INTO Impreza (Nazwa, Lokalizacja, Data, ID_Biletu) VALUES
('Koncert Rockowy', 'Warszawa', '2024-06-15', 1),
('Festiwal Jazzowy', 'Kraków', '2024-07-20', 2),
('Impreza EDM', 'Poznań', '2024-08-10', 3),
('Koncert Pop', 'Gdańsk', '2024-09-05', 4),
('Spektakl Teatralny', 'Wrocław', '2024-10-10', 5),
('Występ Stand-up', 'Łódź', '2024-11-15', 6),
('Pokaz Filmowy', 'Katowice', '2024-12-20', 7),
('Koncert Klasyczny', 'Szczecin', '2025-01-25', 8),
('Festiwal Folkowy', 'Bydgoszcz', '2025-02-20', 9),
('Impreza Techno', 'Lublin', '2025-03-15', 10),
('Wystawa Sztuki', 'Rzeszów', '2025-04-10', 11),
('Konferencja', 'Białystok', '2025-05-05', 12),
('Targi Książki', 'Toruń', '2025-06-10', 13),
('Koncert Metalowy', 'Zielona Góra', '2025-07-05', 14),
('Festiwal Bluesowy', 'Opole', '2025-08-15', 15),
('Impreza Hip-Hop', 'Olsztyn', '2025-09-20', 16),
('Występ Kabaretowy', 'Koszalin', '2025-10-10', 17),
('Festiwal Reggae', 'Gorzów Wielkopolski', '2025-11-15', 18),
('Pokaz Teatru Tańca', 'Kalisz', '2025-12-20', 19),
('Spektakl Operowy', 'Siedlce', '2026-01-25', 20);
