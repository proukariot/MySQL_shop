-- Tworzymy bazę danych dla sklepu odzieżowego
CREATE DATABASE SKLEP_ELEkTRONICZNY;
USE SKLEP_ELEKTRONICZNY;

-- Dodajemy do bazy danych tabelkę z informacją o producentach 
CREATE TABLE Producenci (
id_producenta INTEGER NOT NULL PRIMARY KEY, 
nazwa_producenta TEXT,
adres_producenta TEXT,
nip_producenta VARCHAR(55),
data_podpisania_umowy DATE
);

-- Dodajemy do bazy danych tabelkę z informacją o produktach
CREATE TABLE Produkty (
id_produktu INTEGER PRIMARY KEY,
id_producenta INTEGER, 
nazwa_produktu TEXT,
opis_produktu TEXT,
cena_netto_zakupu FLOAT,
cena_brutto_zakupu FLOAT,
cena_netto_sprzedaży FLOAT,
cena_brutto_sprzedaży FLOAT,
procent_VAT FLOAT
);

-- Dodajemy do bazy danych tabelkę z informacją o zamówieniach
CREATE TABLE Zamówienia (
id_zamówienia INTEGER PRIMARY KEY, 
id_klienta INTEGER,
id_produktu INTEGER,
data_zamówienia DATE
);

-- Dodajemy do bazy danych tabelkę z informacją o klientach 
CREATE TABLE Klienci (
id_klienta INTEGER PRIMARY KEY, 
id_zamówienia INTEGER,
imię TEXT,
nazwisko TEXT,
adres TEXT
);

-- Dodajemy klucz obcy do tabeli producentów, produktów i klientów
ALTER TABLE Produkty 
ADD CONSTRAINT producent_fk FOREIGN KEY (id_producenta)
REFERENCES Producenci(id_producenta);

ALTER TABLE Zamówienia 
ADD CONSTRAINT produkt_fk FOREIGN KEY (id_produktu)
REFERENCES Produkty(id_produktu);

ALTER TABLE Zamówienia 
ADD CONSTRAINT klient_fk FOREIGN KEY (id_klienta)
REFERENCES Klienci(id_klienta);

-- Tworzymy czterech producentów wraz z informacjami zawartymi w tabelce Producenci
INSERT INTO Producenci
VALUE (1, 'Anna Nowak', 'Warszawa', '5213910689', '2015-02-23'),
(2, 'Roman Kowalski', 'Kraków', '5213911212', '2016-02-25'),
(3, 'Tomasz WIŚNIEWSKI', 'Poznań', '5213913333', '2017-05-03'),
(4, 'Agata WÓJCIK', 'Gdańsk', '5213915556', '2018-06-20');

-- Dodajemy informację o produktach 
INSERT INTO Produkty  
VALUES(101, 1, 'Myszka komputerowa', 'Bezprzewodowa myszka z 3 przyciskami', 20.00, 24.60, 35.00, 43.05, 23.00),
  (102,1, 'Klawiatura mechaniczna', 'Klawiatura z podświetleniem i switchami Cherry MX', 150.00, 184.50, 250.00, 307.50, 23.00),
  (103,3, 'Słuchawki bezprzewodowe', 'Słuchawki z mikrofonem i etui ładującym', 80.00, 98.40, 120.00, 147.60, 23.00),
  (104,4, 'Smartwatch', 'Smartwatch z GPS i pulsometrem', 250.00, 307.50, 400.00, 492.00, 23.00),
  (105,2, 'Monitor 24"', 'Monitor z matrycą IPS i Full HD', 400.00, 492.00, 600.00, 738.00, 23.00),
  (106,2, 'Karta graficzna', 'Karta graficzna z 4GB pamięci GDDR5', 800.00, 984.00, 1200.00, 1476.00, 23.00),
  (107,3, 'Procesor', 'Procesor z 6 rdzeniami i taktowaniem 3.5 GHz', 600.00, 738.00, 900.00, 1107.00, 23.00),
  (108,4, 'Pamięć RAM 16GB', 'Pamięć RAM DDR4 16GB', 200.00, 246.00, 300.00, 369.00, 23.00),
  (109,1, 'Dysk SSD 512GB', 'Dysk SSD z interfejsem M.2 NVMe', 100.00, 123.00, 150.00, 184.50, 23.00),
  (110,3, 'Obudowa PC', 'Obudowa do komputera ATX', 50.00, 61.50, 80.00, 98.40, 23.00),
  (111,3, 'Myszka gamingowa', 'Bezprzewodowa myszka z 6 przyciskami i DPI do 12000', 50.00, 61.50, 100.00, 123.00, 23.00),
  (112,4, 'Klawiatura membranowa', 'Klawiatura z podświetleniem i klawiszami multimedialnymi', 30.00, 36.90, 50.00, 61.50, 23.00),
  (113,4, 'Klawiatura bezprzewodowa', 'Klawiatura z podświetleniem', 50.00, 61.50, 100.00, 123.00, 23.00),
  (114,1, 'Myszka komputerowa', 'Myszka z przewodowym połączeniem USB', 20.00, 24.60, 40.00, 49.20, 23.00),
  (115,2, 'Słuchawki bezprzewodowe', 'Słuchawki z Bluetooth 5.0', 70.00, 86.10, 150.00, 184.50, 23.00),
  (116,3, 'Monitor LCD', 'Monitor 24 cali z matrycą IPS', 300.00, 369.00, 500.00, 615.00, 23.00),
  (117,1, 'Drukarka laserowa', 'Drukarka monochromatyczna z szybkim drukiem', 150.00, 184.50, 300.00, 369.00, 23.00),
  (118,3, 'Laptop', 'Laptop z procesorem Intel Core i5 i dyskiem SSD', 1000.00, 1230.00, 1500.00, 1845.00, 23.00),
  (119,4, 'Smartfon', 'Smartfon z ekranem AMOLED i podwójnym aparatem', 600.00, 738.00, 800.00, 984.00, 23.00),
  (120,2, 'Tablet', 'Tablet z systemem Android i pojemnościowym ekranem dotykowym', 400.00, 492.00, 500.00, 615.00, 23.00);

-- Dodajemy informację o Klientach
INSERT INTO Klienci (id_klienta,id_zamówienia, imię, nazwisko, adres)
VALUES
  (100,01, 'Jan', 'Kowalski', 'ul. Kwiatowa 1, Warszawa'),
  (200,02, 'Anna', 'Nowak', 'ul. Słoneczna 2, Kraków'),
  (300,03, 'Piotr', 'Wiśniewski', 'ul. Zielona 3, Gdańsk'),
  (400,04, 'Marta', 'Kaczmarek', 'ul. Polna 4, Wrocław'),
  (500,05, 'Tomasz', 'Lewandowski', 'ul. Lipowa 5, Poznań'),
  (600,06, 'Monika', 'Olszewska', 'ul. Różana 6, Łódź'),
  (700,07, 'Michał', 'Jankowski', 'ul. Brzozowa 7, Szczecin'),
  (800,08, 'Agnieszka', 'Kwiatkowska', 'ul. Kasztanowa 8, Lublin'),
  (900,09, 'Grzegorz', 'Wójcik', 'ul. Dębowa 9, Katowice'),
  (1000,010, 'Karolina', 'Zając', 'ul. Akacjowa 10, Gdynia');

-- Tworzymy zamówienia
INSERT INTO Zamówienia (id_zamówienia, id_klienta, id_produktu, data_zamówienia)
VALUES
  (01,200,120, '2022-01-05'),
  (02,400,119,'2022-02-10'),
  (03,100,114, '2022-03-15'),
  (04,100,117, '2022-04-20'),
  (05,300,118, '2022-05-25'),
  (06,100,109, '2022-06-30'),
  (07,200,105, '2022-01-05'),
  (08,300,103, '2022-08-10'),
  (09,400,114, '2022-09-15'),
  (010,400,108, '2022-01-05');
  

-- Wszystkie produkty ze wszystkimi danymi od producenta który znajduje się na pozycji 1 w tabeli „Producenci”
SELECT produkty.*
FROM producenci INNER JOIN produkty ON producenci.id_producenta = produkty.id_producenta
WHERE producenci.id_producenta = 1;

--Posortowane produkty alfabetycznie po nazwie
SELECT produkty.*
FROM producenci INNER JOIN produkty ON producenci.id_producenta = produkty.id_producenta
WHERE producenci.id_producenta = 1
ORDER BY nazwa_produktu ASC;

-- Średnia cena za produkt od producenta z pozycji 1
SELECT AVG(produkty.cena_netto_sprzedaży) as średnia_cena_netto
FROM producenci INNER JOIN produkty ON producenci.id_producenta = produkty.id_producenta
WHERE producenci.id_producenta = 1;

-- Dwie grupy produktów tego producenta: połowa najtańszych to grupa: „Tanie”, pozostałe to grupa: „Drogie”
SELECT produkty.id_produktu, produkty.nazwa_produktu,
	CASE 
    WHEN produkty.cena_netto_zakupu>(
	select avg(cena_netto_zakupu) 
    FROM producenci INNER JOIN produkty ON producenci.id_producenta = produkty.id_producenta
	WHERE producenci.id_producenta = 1) THEN 'Drogie'
    ELSE 'Tanie'
    END as Drogie_czy_tanie
FROM producenci INNER JOIN produkty ON producenci.id_producenta = produkty.id_producenta
WHERE producenci.id_producenta = 1
ORDER BY nazwa_produktu;

-- Produkty zamówione, wyświetlając tylko ich nazwę
SELECT produkty.nazwa_produktu
FROM produkty INNER JOIN zamówienia ON produkty.id_produktu = zamówienia.id_produktu;

-- Wszystkie produkty zamówione – ograniczając wyświetlanie do 5 pozycji
SELECT zamówienia.*, produkty.nazwa_produktu
FROM produkty INNER JOIN zamówienia ON produkty.id_produktu = zamówienia.id_produktu
LIMIT 5;

-- Łączna wartość wszystkich zamówień
SELECT SUM(produkty.cena_netto_sprzedaży) as wartość_netto_zamówień
FROM produkty INNER JOIN zamówienia ON produkty.id_produktu = zamówienia.id_produktu;

-- Wszystkie zamówienia wraz z nazwą produktu posortowane wg daty od najstarszego do najnowszego 
SELECT produkty.nazwa_produktu, zamówienia.*
FROM produkty INNER JOIN zamówienia ON produkty.id_produktu = zamówienia.id_produktu
ORDER BY zamówienia.data_zamówienia asc;

-- Sprawdzanie, czy w tabeli produkty są uzupełnione wszystkie dane – wyświetlanie pozycji dla których brakuje danych
SELECT * FROM Produkty 
WHERE nazwa_produktu IS NULL 
OR opis_produktu IS NULL 
OR cena_netto_zakupu IS NULL 
OR cena_brutto_zakupu IS NULL 
OR cena_netto_sprzedaży IS NULL 
OR cena_brutto_sprzedaży IS NULL 
OR procent_VAT IS NULL;

-- Produkt najczęściej sprzedawany wraz z jego ceną
SELECT COUNT(produkty.id_produktu) as ilość_zamówień , produkty.nazwa_produktu as produkt, produkty.cena_netto_sprzedaży as cena
FROM produkty INNER JOIN zamówienia ON produkty.id_produktu = zamówienia.id_produktu
GROUP BY produkty.id_produktu 
ORDER BY ilość_zamówień DESC
LIMIT 1;

-- Dzień w którym najwięcej zostało złożonych zamówień
SELECT data_zamówienia as data, COUNT(*) as ilość_zamówień
FROM zamówienia
GROUP BY data
ORDER BY data
LIMIT 1;

