
SHOW DATABASES;
# SQL ESTE CASE-INSENSITIVE
# CONVENTIE 1. intructiunile cu CAPS 2. nume de variabile cu litere mici

CREATE DATABASE IF NOT EXISTS scoala;

# DROP DATABASE IF EXISTS scoala;

USE scoala;

CREATE TABLE IF NOT EXISTS specializari (nume VARCHAR(255));

CREATE TABLE IF NOT EXISTS profesori (nume VARCHAR(255), prenume VARCHAR(255));

SHOW TABLES;

# pentru a "vedea" tabelele

SELECT * FROM specializari;

SELECT * FROM profesori;

# pentru a introduce date in tabel

INSERT INTO specializari SET nume = 'AI & Python';

INSERT INTO specializari VALUES ('Web Design');

INSERT INTO specializari VALUES ('Java');

# pentru a sterge tabelul specializari

DROP TABLE IF EXISTS specializari;

# pentru a sterge o singura valoare din tabel

-- DELETE FROM specializari WHERE nume = 'Java' ; AVEM NEVOIE DE ID NU DE NUME CA SA STERGEM

CREATE TABLE IF NOT EXISTS specializari ( id INT, nume VARCHAR(255));

INSERT INTO specializari SET id = 1, nume = 'AI & Python';
INSERT INTO specializari VALUES (2, 'Web Design');
INSERT INTO specializari VALUES (3, 'Java');
INSERT INTO specializari SET id = 4, nume = 'Java';
SELECT * FROM specializari;

SET SQL_SAFE_UPDATES = 0; # acest flag trebuie sa ramana pe 1
DELETE FROM specializari WHERE id=4;

SET SQL_SAFE_UPDATES = 1;

DROP TABLE IF EXISTS specializari;

## !!! PRIMARY KEY = IDENTIFICATOR UNIC

CREATE TABLE IF NOT EXISTS specializari ( id INT PRIMARY KEY , nume VARCHAR(255));

INSERT INTO specializari SET id = 1, nume = 'AI & Python';
INSERT INTO specializari VALUES (2, 'Web Design');
INSERT INTO specializari VALUES (3, 'Java');
INSERT INTO specializari SET id = 4, nume = 'Java';

DELETE FROM specializari WHERE id=4;
SELECT * FROM specializari;
DROP TABLE IF EXISTS specializari;

## !!! AUTO INCREMENT

CREATE TABLE IF NOT EXISTS specializari ( id INT PRIMARY KEY AUTO_INCREMENT, nume VARCHAR(255));
INSERT INTO specializari SET nume = 'AI & Python';
INSERT INTO specializari VALUES ('Web Design');
INSERT INTO specializari VALUES ('C++');
INSERT INTO specializari SET nume = 'Java';
SELECT * FROM specializari;

